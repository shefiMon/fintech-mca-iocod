<?php

namespace App\Jobs;

use App\Models\Deal;
use App\Models\Investor;
use App\Models\Lead;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class AssignDealsJob implements ShouldQueue
{
    use Queueable;

    /**
     * Create a new job instance.
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
         Lead::where('status', Lead::STATUS_PENDING)
                ->where('lead_score', '>=', 80)->chunk(100, function ($leads) {
                    foreach ($leads as $lead) {
                        $this->assignLeadToInvestor($lead);
                    }
            });
    }

    private function assignLeadToInvestor(Lead $lead): void
    {
        DB::transaction(function () use ($lead) {
            // Find available investor with sufficient funds
            $investor = Investor::inRandomOrder()->where('is_active', true)
                              ->where('available_amount', '>=', $lead->requested_amount)
                              ->orderBy('available_amount', 'desc')
                              ->lockForUpdate()
                              ->first();

            if (!$investor) {
                Log::warning("No investor available for lead", ['lead_id' => $lead->id]);
                return;
            }

            // Create deal
            $deal = Deal::create([
                'lead_id' => $lead->id,
                'investor_id' => $investor->id,
                'amount' => $lead->requested_amount,
                'status' => Deal::STATUS_FUNDED,
                'assigned_at' => now(),
                'funded_at' => now(),
            ]);

            // Update investor availability
            $investor->decrement('available_amount', $lead->requested_amount);

            // Update lead status
            $lead->update(['status' => Lead::STATUS_COMPLETED]);

            Log::info("Deal assigned successfully", [
                'deal_id' => $deal->id,
                'lead_id' => $lead->id,
                'investor_id' => $investor->id,
                'amount' => $lead->requested_amount
            ]);
        });
    }
}
