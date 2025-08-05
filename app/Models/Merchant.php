<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
class Merchant extends Model
{
    protected $fillable = [
        'name',
        'email',
        'phone',

    ];

    public function leads(): HasMany
    {
        return $this->hasMany(Lead::class);
    }

    public function bankStatements(): HasMany
    {
        return $this->hasMany(BankStatement::class);
    }
}
