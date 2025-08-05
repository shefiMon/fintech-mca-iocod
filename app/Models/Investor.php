<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
class Investor extends Model
{
     protected $fillable = [
        'name',
        'email',
        'available_amount',
        'total_invested',
        'is_active'
    ];

    protected $casts = [
        'available_amount' => 'decimal:2',
        'total_invested' => 'decimal:2',
        'is_active' => 'boolean'
    ];



    public function deals(): HasMany
    {
        return $this->hasMany(Deal::class);
    }

    public function canInvest(float $amount): bool
    {
        return $this->is_active && $this->available_amount >= $amount;
    }
}
