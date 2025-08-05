<?php

namespace App\Http\Controllers\Auth;

use App\Helpers\FundingHelper;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ApiAuthController extends Controller
{
    public function login(Request $request)
    {

        $Validator =Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($Validator->fails()) {
            return response()->json(['errors' => $Validator->errors()], 422);
        }

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $token = $user->createToken('auth_token')->plainTextToken;

            return FundingHelper::respondSuccess([
                'user' => $user,
                'token' => $token
            ], 'Login successful');
        }

        return FundingHelper::respondError('Unauthorized', 'Login failed', Response::HTTP_UNAUTHORIZED);
    }

    public function destroy(Request $request)
    {
        $user = $request->user();
        $user->tokens()->delete();

        return FundingHelper::respondSuccess([], 'Logout successful');
    }

}
