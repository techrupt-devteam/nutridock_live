<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\TestimonialsModel;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class TestimonialsController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
		$this->TestimonialsModel			= new TestimonialsModel();
	}


    public function index()
    {	
        $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('testimonials')
                        //->where('id',1)
                        ->orderBy('id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }

        $data['arr_data']      = $arr_data;

        $data['page_name'] = "Testimonials List";

        return view($this->module_view_folder.'.view-testimonials',$data)->with('no', 1);

        }else{
           return view('admin/auth/login');
        }

       
    }

    public function create()
	{
		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
		    return view($this->module_view_folder.'.create-testimonials',$data);
	    }else{
            return view('admin/auth/login');
        }
	}

	public function store(Request $request)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']		= "required";
		$arr_rules['name']  = "required";

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}

		$arr_data['name']	=	$request->input('name', null);	
		$arr_data['post']	=	$request->input('post', null);	
		$arr_data['details']	=	$request->input('details', null);

		if($request->hasFile('image'))
		{         
			$file_extension = strtolower($request->file('image')->getClientOriginalExtension());

			if(in_array($file_extension,['png','jpg','jpeg','svg']))
			{
				$file     = $request->file('image');
				$filename = sha1(uniqid().uniqid()) . '.' . $file->getClientOriginalExtension();
				$path     = $this->product_image_base_path. $filename;
				$isUpload = $file->move($this->product_image_base_path , $filename);
				if($isUpload)
				{
					$arr_data['image'] = $filename;
				}
			}    
			else
			{
				Session::flash('error', 'Please use jpg,png or jpeg.');
				return redirect()->back();
			}
		}	

		$status = $this->TestimonialsModel->create($arr_data);
		if($status)
		{
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/view-testimonials');
		}
		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

	public function edit($enc_id='')
	{

		$arr_data = [];
		if($enc_id=='')
		{
			return redirect()->back();
		}

		$obj_data = $this->TestimonialsModel->where('id', base64_decode($enc_id))->first();
		
		if($obj_data)
		{
			$arr_data = $obj_data->toArray();
		}
		
		$data['arr_data'] = $arr_data;
		$data['enc_id']   = $enc_id;
		$data['product_image_public_path']   = $this->product_image_public_path;
		

		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
			return view($this->module_view_folder.'.edit-testimonials',$data);
		 }else{
            return view('admin/auth/login');
        }
	}

	public function update(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['name']      	   		= "required";

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}

		
		$arr_data['name']	=	$request->input('name', null);	
		$arr_data['post']	=	$request->input('post', null);	
		$arr_data['details']	=	$request->input('details', null);

		if($request->hasFile('image'))
		{         
			$file_extension = strtolower($request->file('image')->getClientOriginalExtension());

			if(in_array($file_extension,['png','jpg','jpeg','svg']))
			{
				$file     = $request->file('image');
				$filename = sha1(uniqid().uniqid()) . '.' . $file->getClientOriginalExtension();
				$path     = $this->product_image_base_path. $filename;
				$isUpload = $file->move($this->product_image_base_path , $filename);
				if($isUpload)
				{
					$arr_data['image'] = $filename;
				}
			}    
			else
			{
				Session::flash('error', 'Please use jpg,png or jpeg.');
				return redirect()->back();
			}
		}	
		
		$status = $this->TestimonialsModel->where('id',base64_decode($enc_id))->update($arr_data);

		if($status)
		{
			Session::flash('success', 'Record updated successfully.');
			return redirect($this->module_view_folder.'/view-testimonials');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

	public function delete(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;
		
		$status = $this->TestimonialsModel->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
			Session::flash('success', 'Record deleted successfully.');
				return redirect($this->module_view_folder.'/view-testimonials');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}


}