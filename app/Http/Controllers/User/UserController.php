<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Crypt;
use App\Models\WebUser;

use Validator;
use Session;
use Cookie;
use DB;


class UserController extends Controller
{
    public function __construct(WebUser $web_admin_model)
    {
        $this->auth               = auth()->guard('user');
        $this->arr_view_data      = [];
        $this->module_title       = "User";
        $this->module_view_folder = "user";
        $this->module_url_path    = url('/');
        $this->WebUser           = $web_admin_model;
    }

     
    public function login()
    {
        
        $this->arr_view_data['module_title']     = $this->module_title." Login";
        $this->arr_view_data['page_title']       = $this->module_title." Login";

        return view($this->module_view_folder.'.login',$this->arr_view_data);
    }

    // admin authentication: AUTHOR (Harsh chauhan) 
    public function validate_login(Request $request)
    {
        
        $arr_rules      = array();
        $status         = false;
        $remember_me    = "";

        $arr_rules['email']     = "required";
        $arr_rules['password']  = "required";

        $validator = Validator::make($request->all(),$arr_rules);

        if($validator->fails()) 
        {
            return back()->withErrors($validator)->withInput();
        }

        $remember_me = $request->input('remember_me');

        $obj_group_user = $this->WebUser->where('email','webdeveloper@techrupt.in')->first();
        $password = $obj_group_user['password'];
        /*print_r(decrypt($password)); 
        print_r($request->input('password')); 
        die;*/

        if($obj_group_user) 
        {

            if(decrypt($password) == $request->input('password'))
            {
                
                
                //$data['user'] = $request->only('email', 'password');
                
                //Session::put('user', $obj_group_user);   
                print_r($request->session()->put("user",$obj_group_user)); die;
                
                $request->session()->put("user",$obj_group_user);
                $request->session()->save();  
                if($remember_me!= 'on' || $remember_me == null)
                {
                    setcookie("remember_me_email","");
                    setcookie("remember_me_password","");
                }
                else
                {
                    setcookie('remember_me_email',$request->input('email'), time()+60*60*24*100);
                    setcookie('remember_me_password',$request->input('password'), time()+60*60*24*100);
                }
                return redirect(url('user/index'));
            }
            else
            {
                echo"1"; die;
                setcookie("remember_me_email","");
                setcookie("remember_me_password","");
                
                Session::flash('error','Invalid Username or Password. Please try again.');

                return redirect()->back();
            }
            
        }
        else
        { 
            echo"2"; die;
            setcookie("remember_me_email","");
            setcookie("remember_me_password","");

            Session::flash('error','Invalid Username or Password. Please try again.');
            return redirect()->back();
        }

        return redirect()->back();
    }

    // admin logout : AUTHOR (Harsh chauhan) 
    public function logout()
    {
        //print_r(Session()); die;
        $this->auth->logout();
        Session::flush();
        return redirect($this->module_url_path.'/');
    }

 

}