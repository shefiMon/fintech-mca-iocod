<?php

namespace App\Http\Controllers;

use App\Helpers\FundingHelper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    //

    public function summary(Request $request)
    {

        try {
            $summary = DB::select("
                SELECT
                    (SELECT COUNT(*) FROM leads) as total_leads,
                    (SELECT COUNT(*) FROM leads WHERE status = 'PENDING') as pending_leads,
                    (SELECT COUNT(*) FROM leads WHERE status = 'COMPLETED') as completed_leads,
                    (SELECT COUNT(*) FROM leads WHERE status = 'IN_PROGRESS') as in_progress_leads,
                    (SELECT COUNT(*) FROM deals) as total_deals,
                    (SELECT COUNT(*) FROM deals WHERE status = 'FUNDED') as funded_deals,
                    (SELECT SUM(amount) FROM deals WHERE status = 'FUNDED') as total_funded_amount,
                    (SELECT SUM(requested_amount) FROM leads) as total_requested_amount
            ")[0];



            return response()->json([
                'success' => true,
                'data' => [
                    'leads' => [
                        'total' => (int) $summary->total_leads,
                        'pending' => (int) $summary->pending_leads,
                        'completed' => (int) $summary->completed_leads,
                        'in_progress' => (int) $summary->in_progress_leads,
                    ],
                    'deals' => [
                        'total' => (int) $summary->total_deals,
                        'funded' => (int) $summary->funded_deals
                    ],
                    'funding' => [
                        'total_requested' => (float) $summary->total_requested_amount,
                        'total_funded' => (float) $summary->total_funded_amount,
                        'funding_ratio' => FundingHelper::calculateFundingRatio($summary->total_requested_amount ?? 0, $summary->total_funded_amount ?? 0) . '%'
                    ]
                ]
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to fetch dashboard summary',
                'error' => $e->getMessage()
            ], 500);
        }

    }
}
