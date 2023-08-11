<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;

    public function real_estate()
    {
        return $this->belongsTo(RealEstate::class);
    }

    public function user() {
        return $this->belongsTo(User::class);
    }
}
