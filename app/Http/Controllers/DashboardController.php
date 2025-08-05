<?php

namespace App\Http\Controllers;

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
                    (SELECT COUNT(*) FROM leads WHERE status = 'pending') as pending_leads,
                    (SELECT COUNT(*) FROM leads WHERE status = 'assigned') as assigned_leads,
                    (SELECT COUNT(*) FROM leads WHERE status = 'funded') as funded_leads,
                    (SELECT COUNT(*) FROM deals) as total_deals,
                    (SELECT COUNT(*) FROM deals WHERE status = 'assigned') as assigned_deals,
                    (SELECT COUNT(*) FROM deals WHERE status = 'funded') as funded_deals,
                    (SELECT SUM(amount) FROM deals WHERE status = 'funded') as total_funded_amount,
                    (SELECT SUM(requested_amount) FROM leads) as total_requested_amount,
                    (SELECT AVG(lead_score) FROM leads) as average_lead_score
            ")[0];

            $fundingRatio = $summary->total_requested_amount > 0
                ? round(($summary->total_funded_amount / $summary->total_requested_amount) * 100, 2)
                : 0;

            return response()->json([
                'success' => true,
                'data' => [
                    'leads' => [
                        'total' => (int) $summary->total_leads,
                        'pending' => (int) $summary->pending_leads,
                        'assigned' => (int) $summary->assigned_leads,
                        'funded' => (int) $summary->funded_leads,
                        'average_score' => round($summary->average_lead_score, 2)
                    ],
                    'deals' => [
                        'total' => (int) $summary->total_deals,
                        'assigned' => (int) $summary->assigned_deals,
                        'funded' => (int) $summary->funded_deals
                    ],
                    'funding' => [
                        'total_requested' => (float) $summary->total_requested_amount,
                        'total_funded' => (float) $summary->total_funded_amount,
                        'funding_ratio' => $fundingRatio
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
