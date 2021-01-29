<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class CouponcodeModel extends Model 
{
    protected $table = 'coupon_code';

    protected $fillable = [
                            'coupon_code',
                            'extension_days'
                        ];
}
	