<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
class Lead extends Model
{
     protected $fillable = [
        'merchant_id',
        'merchant_name',
        'requested_amount',
        'lead_score',
        'status',
    ];

    public const STATUS_PENDING = 'PENDING';
    public const STATUS_IN_PROGRESS = 'IN_PROGRESS';
    public const STATUS_COMPLETED = 'COMPLETED';

    protected $casts = [
            'requested_amount' => 'decimal:2'
    ];

    public function merchant(): BelongsTo
    {
        return $this->belongsTo(Merchant::class);
    }

    public function deals(): HasMany
    {
        return $this->hasMany(Deal::class);
    }

    public function isHighQuality(): bool
    {
        return $this->lead_score >= 80;
    }
}
