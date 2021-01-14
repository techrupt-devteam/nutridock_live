<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\ProductModel;
use Session;
use Validator;

class DashboardController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().config('app.project.img_path.product_image');
		$this->product_image_public_path 	= url('/').config('app.project.img_path.product_image');
	
		$this->ProductModel					= new ProductModel();
	}

	
    public function index(Request $request)
    {	
    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        //print_r($data['session_user']); die;
    	

    	/*if($obj_data){
    		$arr_data = $obj_data->toArray();
    	}

    	$this->arr_view_data['arr_data']     			 	= $arr_data;*/
    	//$this->arr_view_data['product_image_public_path']   = $this->product_image_public_path;

       return view($this->module_view_folder.'.index',$data);
    }

    public function create()
	{
		$arr_category = [];
	

		return view($this->module_view_folder.'.pop-art');
	}

	public function store(Request $request)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['title']      	   		= "required";
		$arr_rules['description']      	   	= "required";

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		$name = $request->input('name', null);

		$arr_data['title']				=	$request->input('title', null);	
		$arr_data['description']		=	$request->input('description', null);	


		if($request->hasFile('image'))
		{         
			$file_extension = strtolower($request->file('image')->getClientOriginalExtension());

			if(in_array($file_extension,['png','jpg','jpeg']))
			{
				$file     = $request->file('image');
				$filename = sha1(uniqid().uniqid()) . '.' . $file->getClientOriginalExtension();
				$path     = $this->product_image_base_path . $filename;
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

		$status = $this->ProductModel->create($arr_data);

		if($status)
		{
			Session::flash('success', 'Product added successfully.');
			return redirect('/admin/index');
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

		$obj_data = $this->ProductModel->where('id', base64_decode($enc_id))->first();
		print_r($obj_data); die;
		if($obj_data)
		{
			$arr_data = $obj_data->toArray();
		}
	
	
		$this->arr_view_data['arr_data']               	    = $arr_data;
		$this->arr_view_data['enc_id']                  	= $enc_id;
		$this->arr_view_data['product_image_public_path']   = $this->product_image_public_path;


		return view($this->module_view_folder.'.edit-pop-art',$this->arr_view_data);
	}

	public function update(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['title']      	   		= "required";
		$arr_rules['description']      	   	= "required";

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		$name = $request->input('name', null);

		$arr_data['title']				=	$request->input('title', null);	
		$arr_data['description']		=	$request->input('description', null);	


		if($request->hasFile('image'))
		{         
			$file_extension = strtolower($request->file('image')->getClientOriginalExtension());

			if(in_array($file_extension,['png','jpg','jpeg']))
			{
				$file     = $request->file('image');
				$filename = sha1(uniqid().uniqid()) . '.' . $file->getClientOriginalExtension();
				$path     = $this->product_image_base_path . $filename;
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

		$status = $this->ProductModel->where('id',base64_decode($enc_id))->update($arr_data);

		if($status)
		{
			Session::flash('success', 'Product updated successfully.');
			return redirect('/admin/index');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

	public function delete(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$status = $this->ProductModel->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
			Session::flash('success', 'Product deleted successfully.');
			return redirect('/admin/index');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}


}