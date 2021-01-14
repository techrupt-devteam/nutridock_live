<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\WhyusModel;
use App\Models\AboutusModel;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class AboutusController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
		$this->WhyusModel					= new WhyusModel();
		$this->AboutusModel					= new AboutusModel();
	}


    public function index($enc_id='')
    {	
    
    	$arr_data = [];
		if($enc_id=='')
		{
			return redirect()->back();
		}

		$obj_data = $this->AboutusModel->where('id', $enc_id)->first();
		
		if($obj_data)
		{
			$arr_data = $obj_data->toArray();
		}
		$data['arr_data']      = $arr_data;
        
		$user = \Sentinel::check();
		$data['session_user']  = Session::get('user');
        $data['page_name'] = "About Us";
        if($data['session_user']){
        return view($this->module_view_folder.'.view-about-us',$data)->with('no', 1);

        }else{
           return view('admin/auth/login');
        }
    }

   
	public function update(Request $request,$enc_id)
	{

		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['title']      	   		= "required";

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}

		
		$arr_data['title']	=	$request->input('title', null);	
		$arr_data['about']	=	$request->input('about', null);	
		$arr_data['our_mission']	=	$request->input('our_mission', null);
		$arr_data['our_goals']	=	$request->input('our_goals', null);	

		if($request->hasFile('image1'))
		{         
			$file_extension = strtolower($request->file('image1')->getClientOriginalExtension());

			if(in_array($file_extension,['png','jpg','jpeg','svg']))
			{
				$file     = $request->file('image1');
				$filename = sha1(uniqid().uniqid()) . '.' . $file->getClientOriginalExtension();
				$path     = $this->product_image_base_path. $filename;
				$isUpload = $file->move($this->product_image_base_path , $filename);
				if($isUpload)
				{
					$arr_data['image1'] = $filename;
				}
			}    
			else
			{
				Session::flash('error', 'Please use jpg,png or jpeg.');
				return redirect()->back();
			}
		}

		if($request->hasFile('image2'))
		{         
			$file_extension = strtolower($request->file('image2')->getClientOriginalExtension());

			if(in_array($file_extension,['png','jpg','jpeg','svg']))
			{
				$file     = $request->file('image2');
				$filename = sha1(uniqid().uniqid()) . '.' . $file->getClientOriginalExtension();
				$path     = $this->product_image_base_path. $filename;
				$isUpload = $file->move($this->product_image_base_path , $filename);
				if($isUpload)
				{
					$arr_data['image2'] = $filename;
				}
			}    
			else
			{
				Session::flash('error', 'Please use jpg,png or jpeg.');
				return redirect()->back();
			}
		}
		$status = $this->AboutusModel->where('id',base64_decode($enc_id))->update($arr_data);
		
		if($status)
		{
			Session::flash('success', 'Record updated successfully.');
			return redirect($this->module_view_folder.'/aboutus/view-about-us/'.'1');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

}