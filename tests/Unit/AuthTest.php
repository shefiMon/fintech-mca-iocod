<?php

namespace Tests\Feature\Unit;

use App\Models\User;
use Tests\TestCase;

class AuthTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_user_can_login(): void
    {
         $user = User::factory()->create();

        $response = $this->post('/api/auth/login',[
            'email' => $user->email,
            'password' => 'password'
        ]);

        $response->assertStatus(200);
    }
}
