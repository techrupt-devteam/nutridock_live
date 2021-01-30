<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class SubscribeNowUser extends Model 
{
    protected $table = 'subscribe_now_user';
    protected $fillable = [
    						'email',
                            'password',
    						'phone_no'
						  ];

     public static function getData(){
        $data = SubscribeNow::select('*')
                ->where('is_deleted', 'No')                        
                ->get()->toArray();
        return $data;
    }
}

