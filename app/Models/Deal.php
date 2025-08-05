<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
class Deal extends Model
{
    protected $fillable = [
        'lead_id',
        'investor_id',
        'amount',
        'status',
        'assigned_at',
        'funded_at',
        'notes'
    ];

    public const STATUS_FUNDED = 'FUNDED';


    protected $casts = [
        'amount' => 'decimal:2',
        'assigned_at' => 'datetime',
        'funded_at' => 'datetime'
    ];

    public function lead(): BelongsTo
    {
        return $this->belongsTo(Lead::class);
    }

    public function investor(): BelongsTo
    {
        return $this->belongsTo(Investor::class);
    }
}
