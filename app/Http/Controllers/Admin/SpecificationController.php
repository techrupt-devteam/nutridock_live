<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\WhyusModel;
use App\Models\SpecificationModel;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class SpecificationController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
		$this->WhyusModel					= new WhyusModel();
		$this->SpecificationModel				= new SpecificationModel();
	}


    public function index()
    {	
        $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('specification')
                        //->where('id',1)
                        ->orderBy('id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }

        $data['arr_data']      = $arr_data;
        
        /*For Modal*/
        $editarr_data = [];
        $value     = \DB::table('specification')
                        ->get();
        if(!empty($value))
        {
            $editarr_data = $value->toArray();
        }
        $data['editarr_data']      = $editarr_data;

        $data['page_name'] = "Specification";

        return view($this->module_view_folder.'.view-specification-list',$data)->with('no', 1);

        }else{
           return view('admin/auth/login');
        }

       
    }

 
	public function specification_store(Request $request)
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

		$status = $this->SpecificationModel->create($arr_data);
		if($status)
		{
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/view-specification-list');
		}
		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

	
	public function specification_update(Request $request,$enc_id)
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
		
		$status = $this->SpecificationModel->where('id',base64_decode($enc_id))->update($arr_data);

		if($status)
		{
			Session::flash('success', 'Record updated successfully.');
			return redirect($this->module_view_folder.'/view-specification-list');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

/*	public function specification_delete (Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;
		
		$status = $this->SpecificationModel->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
			Session::flash('success', 'Record deleted successfully.');
				return redirect($this->module_view_folder.'/view-specification-list');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}*/
	
	
	public function specification_delete (Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;
		
		$spec_data = [];
		$obj_data = $this->SpecificationModel->where('id', base64_decode($enc_id))->first();
		
		if($obj_data)
		{
			$spec_data = $obj_data->toArray();
		}

		//$specification_name  = $arr_data;
		$name = $spec_data['name'];

		$menu_data = [];
        $menu_value     = \DB::table('menu')->get();
        if(!empty($menu_value))
        {
            $menu_data = $menu_value->toArray();
        }

       	$specification = '';
        
       	//$name1 = 'Gluten Free';
       	$menu_data_count = count($menu_data);

       	for($i=0;$i<$menu_data_count;$i++)
       	{
       		foreach($menu_data as $row){
        		$specification = $row->specification;
        	} 
        	/*print_r($specification);
        	print_r($name); die;*/
        	$arr_spec = explode(",",$specification);
        	if(in_array($name, $arr_spec)){
        	    Session::flash('success', 'Specification can not be delete as it is used in menu.');
				return redirect($this->module_view_folder.'/view-specification-list');
        	}else{
        		$status = $this->SpecificationModel->where('id',base64_decode($enc_id))->delete();
        		if($status)
				{
					Session::flash('success', 'Record deleted successfully.');
						return redirect($this->module_view_folder.'/view-specification-list');
				}
        	}
       	}
		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}



}