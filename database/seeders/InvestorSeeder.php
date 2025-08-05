<?php

namespace Database\Seeders;

use App\Models\Investor;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class InvestorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
       $investors = [
            [
                'name' => 'Alpha Capital',
                'email' => 'contact@alphacapital.com',
                'available_amount' => 1000000,
                'total_invested' => 500000,
                'is_active' => true
            ],
            [
                'name' => 'Beta Investments',
                'email' => 'info@betainvest.com',
                'available_amount' => 750000,
                'total_invested' => 250000,
                'is_active' => true
            ],
            [
                'name' => 'Gamma Fund',
                'email' => 'hello@gammafund.com',
                'available_amount' => 2000000,
                'total_invested' => 1000000,
                'is_active' => true
            ],
            [
                'name' => 'Delta Ventures',
                'email' => 'contact@deltaventures.com',
                'available_amount' => 500000,
                'total_invested' => 100000,
                'is_active' => true
            ]
        ];

        foreach ($investors as $investor) {
            Investor::firstOrCreate(
                ['email' => $investor['email']],
                [
                    'name' => $investor['name'],
                    'available_amount' => $investor['available_amount'],
                    'total_invested' => $investor['total_invested'],
                    'is_active' => $investor['is_active'],
                ]
            );
        }
    }
}
