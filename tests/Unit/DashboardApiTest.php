<?php

namespace Tests\Unit;

use Database\Seeders\DatabaseSeeder;
use Tests\TestCase;


class DashboardApiTest extends TestCase
{
    /**
     * A basic unit test example.
     */
    public function test_dashboard_summary()
    {
        // Create test data

     $response = $this->post('/api/auth/login',[
            'email' => 'test@example.com',
            'password' => 'password'
        ]);

        $response = $this->get('/api/dashboard/summary',['Accept' => 'application/json','Authorization' => 'Bearer ' . $response->json('data.token')]);

        $response->assertStatus(200);
    }
}
