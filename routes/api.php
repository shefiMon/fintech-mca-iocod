<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



    Route::prefix('auth')->group(function () {
        Route::post('/login', [\App\Http\Controllers\Auth\ApiAuthController::class, 'login']);
        Route::post('/logout', [\App\Http\Controllers\Auth\ApiAuthController::class, 'destroy'])->middleware('auth:sanctum');
    });

    Route::middleware(['auth:sanctum'])->group(function () {
        Route::prefix('dashboard')->group(function () {
            Route::get('/summary', [\App\Http\Controllers\DashboardController::class, 'summary']);
        });

        Route::prefix('merchant')->group(function () {
            Route::post('/{merchantId}/upload-bank-statement', [\App\Http\Controllers\MerchantController::class, 'uploadBankStatement']);
        });
    });



