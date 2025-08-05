<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BankStatement extends Model
{
     protected $fillable = [
        'merchant_id',
        'file_name',
        'file_path',
        'file_type',
        'month',
        'year',
        'status'
    ];

    protected $casts = [
        'total_credits' => 'decimal:2',
        'total_debits' => 'decimal:2',
        'average_balance' => 'decimal:2'
    ];

    public function merchant(): BelongsTo
    {
        return $this->belongsTo(Merchant::class);
    }
}
