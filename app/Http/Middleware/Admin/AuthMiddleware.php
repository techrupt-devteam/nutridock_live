<?php

namespace App\Http\Middleware\Admin;

use Closure;
use Illuminate\Support\Facades\Auth;

class AuthMiddleware
{
    function __construct()
    {  
        //add your code here
    }
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        $arr_site_data = array();

        
        $this->auth = auth()->guard('admin');


        if($this->auth->user())
        {

            $super_admin_details = $this->auth->user()->toArray();

            $obj_user =$this->auth->user();

            
            return $next($request);
        }
        else
        {
        	$this->auth->logout();
            return redirect('/login');
        }
    }
}