<?php

namespace App\Actions;

use App\Models\Lead;
use App\Models\Merchant;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class ImportLeadsAction
{
   public function execute(): array
    {
        try {
            $leadsData =  $this->fetchMockLeadsData();
            $importedCount = 0;
            $errors = [];
            foreach ($leadsData as $leadData) {
                try {
                    $merchant = $this->findOrCreateMerchant($leadData);

                    $lead = Lead::firstOrCreate([
                        'merchant_id' => $merchant->id,
                        'requested_amount' => $leadData['requested_amount'],
                    ],[
                        'merchant_name' => $leadData['merchant_name'],
                        'lead_score' => rand(75, 100), // Random score for demo
                        'status' => Lead::STATUS_PENDING,
                    ]);

                    $importedCount++;
                    Log::info("Lead imported successfully", ['lead_id' => $lead->id]);

                } catch (\Exception $e) {
                    $errors[] = "Failed to import lead for {$leadData['merchant_name']}: " . $e->getMessage();
                    Log::error("Lead import failed", ['error' => $e->getMessage(), 'data' => $leadData]);
                }
            }

            return [
                'imported_count' => $importedCount,
                'errors' => $errors,
                'total_processed' => count($leadsData)
            ];

        } catch (\Exception $e) {
            Log::error("Lead import action failed", ['error' => $e->getMessage()]);
            throw $e;
        }
    }

    private function fetchMockLeadsData(): array
    {
        // Mock API data - in real scenario, this would be an actual API call
        $response = Http::get('https://jsonplaceholder.typicode.com/users');
        $merchants = $response->json();
        return array_map(function ($merchant) {
            return [
                'merchant_name' => $merchant['name'],
                'requested_amount' => rand(1000, 50000),
                'email' => $merchant['email'],
                'phone' => $merchant['phone'] ?? null,
            ];
        }, $merchants);


    }

    private function findOrCreateMerchant(array $leadData): Merchant
    {
        return Merchant::firstOrCreate(
            ['email' => $leadData['email']],
            [
                'name' => $leadData['merchant_name'],
                'phone' => $leadData['phone'] ?? null,
            ]
        );
    }
}
