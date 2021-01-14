<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\ContactModel;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class ContactController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
	
		$this->ContactModel					= new ContactModel();
	}


    public function index(Request $request)
    {	
    $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = $this->ContactModel
                        //->where('id',1)
                        ->orderBy('id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }

        $data['arr_data']      = $arr_data;

        $data['page_name'] = "Contact List";
        //$data['title']     = $this->title;

        return view($this->module_view_folder.'.contact-list',$data);

        }else{
           return view('admin/auth/login');
        }
    }
    
    public function send_mail()
	{
		
		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
		    return view($this->module_view_folder.'.send-mail',$data);
	    }else{
            return view('admin/auth/login');
        }
	}

    public function create()
	{
		
		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
		    return view($this->module_view_folder.'.create-blog',$data);
	    }else{
            return view('admin/auth/login');
        }
	}

	
	public function edit($enc_id='')
	{
		$arr_data = [];
		if($enc_id=='')
		{
			return redirect()->back();
		}

		$obj_data = $this->BlogModel->where('id', base64_decode($enc_id))->first();
		
		if($obj_data)
		{
			$arr_data = $obj_data->toArray();
		}
	
		$data['arr_data']               	    = $arr_data;
		$data['enc_id']                  	= $enc_id;
		$data['product_image_public_path']   = $this->product_image_public_path;
		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
			return view($this->module_view_folder.'.edit-blog',$data);
		 }else{
            return view('admin/auth/login');
        }
	}


	public function delete(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$status = $this->ContactModel->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
			Session::flash('contact_delete', 'Record deleted successfully.');
			return redirect($this->module_view_folder.'/contact-list');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}



}