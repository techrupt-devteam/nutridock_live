<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class SubscribeNowUser extends Model 
{
    protected $table = 'subscribe_now_user';
    protected $fillable = [
    						'name',
    						'email',
                            'password',
    						'phone_no',
    						'session_id'
						  ];

     public static function getData(){
        $data = SubscribeNow::select('*')
                ->where('is_deleted', 'No')                        
                ->get()->toArray();
        return $data;
    }
}

