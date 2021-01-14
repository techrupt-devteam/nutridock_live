<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\MenuModel;
use App\Models\IngredientsModel;
use App\Models\WhatsInsideModel;
use App\Models\SpecificationModel;
use App\Models\SpecificationMenuModel;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use File;
use \Illuminate\Support\Str;

use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class MenuController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
		$this->MenuModel					= new MenuModel();
		$this->IngredientsModel				= new IngredientsModel();
		$this->WhatsInsideModel					= new WhatsInsideModel();
		$this->SpecificationModel				= new SpecificationModel();
		$this->SpecificationMenuModel				= new SpecificationMenuModel();
	}


    public function index(Request $request)
    {	
    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('menu')
                        ->orderBy('id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data']      = $arr_data;

        $cate_data = [];
        $cate_value     = \DB::table('menu_categories')
                        ->orderBy('id','Asc')
                        ->get();
        if(!empty($cate_value))
        {
            $cate_data = $cate_value->toArray();
        }
        $data['cate_data']      = $cate_data;
        $data['page_name'] = "Menu List";
        return view($this->module_view_folder.'.view-menu',$data);
        }else{
           return view('admin/auth/login');
        }
    }

    public function create()
	{
		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
        	$arr_data = [];
	        $value     = \DB::table('menu_categories')
	                        ->orderBy('id','ASC')
	                        ->get();
	        if(!empty($value))
	        {
	            $arr_data = $value->toArray();
	        }

	        $data['arr_data']      = $arr_data;
	        
	         /*Specification*/
	        $specification_data = [];
	        $specification_value     = \DB::table('specification')
	                        ->orderBy('id','ASC')
	                        ->get();
	        if(!empty($specification_value))
	        {
	            $specification_data = $specification_value->toArray();
	        }

	        $data['specification_data']      = $specification_data;
	        
		    return view($this->module_view_folder.'.create-menu',$data);
	    }else{
            return view('admin/auth/login');
        }
	}

	public function store(Request $request)
	{
	    //echo"1"; die;
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['menu_title']      	   		= "required";
		$arr_rules['affiliate_link'] = 'nullable|string';

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		
		$arr_data['menu_title']	 =	$request->input('menu_title', null);	
		$arr_data['menu_category_id']  =	$request->input('menu_category_id', null);	
		$arr_data['menu_description'] =	$request->input('menu_description', null);
		$arr_data['ingredients'] =	$request->input('ingredients', null);
		$arr_data['what_makes_dish_special'] =	$request->input('what_makes_dish_special', null);
		
		
		$specification_data =	$request->input('specification');	
        
        if($specification_data)
        {
		$specification = "";
		foreach ($specification_data as $value)
		{
		       $specification .= $value . ",";
		}
		$arr_data['specification'] = substr($specification,0,-1); 
        }else{
            $arr_data['specification'] = ''; 
        }
		
		
		if($request->hasFile('image'))
		{         
			$file_extension = strtolower($request->file('image')->getClientOriginalExtension());

			if(in_array($file_extension,['png','jpg','jpeg']))
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
		//$status = $this->MenuModel->create($arr_data);
		$delimiter = ",";
		$str = '';
		$path = '';
		$dest = '';
		$count = 0;
		$status = '';
		$arr_data['multiple_image'] = '';

		foreach ($_FILES['files']['name'] as $f => $name) {
			$path = 
		        $ext = pathinfo($_FILES['files']['name'][$f], PATHINFO_EXTENSION);
		        $uniq_name = uniqid() . '.' .$ext;
		        $dest = $this->product_image_base_path. $uniq_name;
		        if(move_uploaded_file($_FILES["files"]["tmp_name"][$f], $dest)) {
		            $count++;
		            if (strlen($arr_data['multiple_image'])) {
		               $arr_data['multiple_image'] .= $delimiter;
		    		   
		            }
		            $arr_data['multiple_image'] .= $uniq_name;
		        }
		}
    //print_r($arr_data); die;
		$status = $this->MenuModel->create($arr_data);	
		if($status)
		{
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/view-menu');
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

		$obj_data = $this->MenuModel->where('id', base64_decode($enc_id))->first();
		
		if($obj_data)
		{
			$arr_data = $obj_data->toArray();
		}

		$data['arr_data']  = $arr_data;
		
		/*Specification*/
        $specification_data = [];
        $specification_value     = \DB::table('specification')
                        ->orderBy('id','ASC')
                        ->get();
        if(!empty($specification_value))
        {
            $specification_data = $specification_value->toArray();
        }

        $data['specification_data']      = $specification_data;
        
        
        
		$data['enc_id']   = $enc_id;
		$data['product_image_public_path']   = $this->product_image_public_path;
		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
        	$arr_data = [];
	        $value     = \DB::table('menu_categories')
	                        ->orderBy('id','ASC')
	                        ->get();
	        if(!empty($value))
	        {
	            $arr_data = $value->toArray();
	        }
	        $data['cate_data']      = $arr_data;

			return view($this->module_view_folder.'.edit-menu',$data);
		 }else{
            return view('admin/auth/login');
        }
	}

	public function menu_update(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['menu_title']      	   		= "required";

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}

		$arr_data['menu_title']				=	$request->input('menu_title', null);	
		$arr_data['menu_category_id']				=	$request->input('menu_category_id', null);	
		$arr_data['menu_description']		=	$request->input('menu_description', null);	
		$arr_data['ingredients'] =	$request->input('ingredients', null);
		$arr_data['what_makes_dish_special'] =	$request->input('what_makes_dish_special', null);

		$specification_data =	$request->input('specification', null);	
        
        if($specification_data)
        {
		$specification = "";
		foreach ($specification_data as $value)
		{
		       $specification .= $value . ",";
		}
		$arr_data['specification'] = substr($specification,0,-1); 
        }else{
            $arr_data['specification'] = ''; 
        }


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

		$delimiter = ",";
		$str = '';
		$path = '';
		$dest = '';
		$count = 0;
		$status = '';
		$arr_data['multiple_image'] = '';

		foreach ($_FILES['files']['name'] as $f => $name) {
			$path = 
		        $ext = pathinfo($_FILES['files']['name'][$f], PATHINFO_EXTENSION);
		        $uniq_name = uniqid() . '.' .$ext;
		        $dest = $this->product_image_base_path. $uniq_name;
		        if(move_uploaded_file($_FILES["files"]["tmp_name"][$f], $dest)) {
		            $count++;
		            if (strlen($arr_data['multiple_image'])) {
		               $arr_data['multiple_image'] .= $delimiter;
		    		   
		            }
		            $arr_data['multiple_image'] .= $uniq_name;
		        }
		}

			if (strlen($arr_data['multiple_image'])) {
				$status = $this->MenuModel->where('id',base64_decode($enc_id))->update($arr_data);
			}else{
				$arr_data['multiple_image'] =	$request->input('pre_images', null);
				$status = $this->MenuModel->where('id',base64_decode($enc_id))->update($arr_data);			
			}
		if($status)
			{
				Session::flash('success', 'Record updated successfully.');
				return redirect($this->module_view_folder.'/view-menu');
			}

		Session::flash('error', 'Something went wrong.');
		return redirect($this->module_view_folder.'/view-menu');
	}

	public function delete(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$status = $this->MenuModel->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
		    $whats_inside_delete = $this->WhatsInsideModel->where('menu_id',base64_decode($enc_id))->delete();

			$ingredients_delete = $this->IngredientsModel->where('menu_id',base64_decode($enc_id))->delete();

			$menu_specification_delete = $this->SpecificationMenuModel->where('menu_id',base64_decode($enc_id))->delete();
			Session::flash('success', 'Record deleted successfully.');
				return redirect($this->module_view_folder.'/view-menu');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}
	
	public function view_ingredients(Request $request,$enc_id)
    {	
    	$data['id'] = base64_decode($enc_id);

    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('ingredients')
                        ->where('menu_id',$data['id'])
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data']      = $arr_data;


        /*For Modal*/
        $editarr_data = [];
        $value     = \DB::table('ingredients')
                        ->where('menu_id',$data['id'])
                        ->get();
        if(!empty($value))
        {
            $editarr_data = $value->toArray();
        }
        $data['editarr_data']      = $editarr_data;

       /* $cate_data = [];
        $cate_value     = \DB::table('categories')
                        ->orderBy('id','Asc')
                        ->get();
        if(!empty($cate_value))
        {
            $cate_data = $cate_value->toArray();
        }

        $data['cate_data']      = $cate_data;*/


        $data['page_name'] = "View Ingredients";
        return view($this->module_view_folder.'.view-ingredients',$data);

        }else{
           return view('admin/auth/login');
        }
    }


	
	public function ingredients_store(Request $request)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['name']      	   		= "required";
		$arr_rules['affiliate_link'] = 'nullable|string';

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		$menu_id = $request->input('menu_id', null);

		$arr_data['name']				=	$request->input('name', null);	
		$arr_data['menu_id']				=	$request->input('menu_id', null);	
		
		if($request->hasFile('image'))
		{         
			$file_extension = strtolower($request->file('image')->getClientOriginalExtension());

			if(in_array($file_extension,['png','jpg','jpeg']))
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
		
		$status = $this->IngredientsModel->create($arr_data);
		if($status)
		{
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/menu/view-ingredients/'.base64_encode($menu_id));
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

	public function ingredients_update(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['name']      	   		= "required";
		$arr_rules['affiliate_link'] = 'nullable|string';

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		$menu_id = $request->input('menu_id', null);

		$arr_data['name']				=	$request->input('name', null);	
		$arr_data['menu_id']				=	$request->input('menu_id', null);	
		
		
		if($request->hasFile('image'))
		{         
			$file_extension = strtolower($request->file('image')->getClientOriginalExtension());

			if(in_array($file_extension,['png','jpg','jpeg']))
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
		
		$status = $this->IngredientsModel->where('id',base64_decode($enc_id))->update($arr_data);
		if($status)
		{
			Session::flash('success', 'Record updated successfully.');
			return redirect($this->module_view_folder.'/menu/view-ingredients/'.base64_encode($menu_id));
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}


	public function ingredients_delete(Request $request,$enc_id)
	{

		$arr_rules      = $arr_data = array();
		$status         = false;
		

		$status = $this->IngredientsModel->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
			Session::flash('success', 'Record deleted successfully.');
				return redirect($this->module_view_folder.'/view-menu');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}


	public function view_whatsinside(Request $request,$enc_id)
    {	
    	$data['id'] = base64_decode($enc_id);

    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        /*Comments*/
        $arr_data = [];
        $value     = \DB::table('whats_inside')
                        ->where('menu_id',$data['id'])
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data']      = $arr_data;
        

        /*For Modal*/
        $editarr_data = [];
        $value     = \DB::table('whats_inside')
                        ->where('menu_id',$data['id'])
                        ->get();
        if(!empty($value))
        {
            $editarr_data = $value->toArray();
        }
        $data['editarr_data']      = $editarr_data;

        $data['page_name'] = "View Whats Inside";
        return view($this->module_view_folder.'.view-whatsinside',$data);

        }else{
           return view('admin/auth/login');
        }
    }

    public function whatsinside_store(Request $request)
	{
		$menu_id = $request->input('menu_id');
		$arr_title				=	$request->input('title');	
		$arr_unit				=	$request->input('unit');	
	    $arr_data['menu_id']				=	$request->input('menu_id');	
	    
	    $data_value     = \DB::table('whats_inside')->where('menu_id',$menu_id)->get();
		if($data_value){
		    $this->WhatsInsideModel->where('menu_id',$menu_id)->delete();
		}
		
		$cnt_title = count($arr_title);
		for($i = 0; $i <$cnt_title; $i++){
		    /*$arr_data['title'] = $arr_title;
		    $arr_data['unit'] = $arr_unit;
		    $arr_data['menu_id'] = $request->input('menu_id');
		    $status = $this->WhatsInsideModel->create($arr_data);*/
		    $data = array(
		        'title' => $arr_title[$i],
                'unit' => $arr_unit[$i],
                'menu_id' => $menu_id
            );
            $insertData[] = $data;
		}
        $status =WhatsInsideModel::insert($insertData);   	
		if($status)
		{
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/menu/view-whatsinside/'.base64_encode($menu_id));
		}
	

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

    public function whatsinside_update(Request $request,$enc_id)
	{

		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['title']      	   		= "required";
		$arr_rules['affiliate_link'] = 'nullable|string';

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		$whatsinside_id = $request->input('menu_id', null);
		

		$whats_inside_data =[];
		$whats_inside_data_value     = \DB::table('whats_inside')
                        ->where('id',$whatsinside_id)
                        ->get();
        if(!empty($whats_inside_data_value))
        {
            $whats_inside_data = $whats_inside_data_value->toArray();
        }
        
		foreach ($whats_inside_data as $row) {
			$menu_id = $row->menu_id;
		}

		
		$arr_data['title']				=	$request->input('title', null);	
		$arr_data['unit']				=	$request->input('unit', null);	
		$arr_data['menu_id']				=	$request->input('menu_id', null);	
		
		
		$status = $this->WhatsInsideModel->where('id',base64_decode($enc_id))->update($arr_data);
		

		if($status)
		{
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/menu/view-whatsinside/'.base64_encode($whatsinside_id));
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}
	
	public function whatsinside_delete(Request $request,$enc_id)
	{

		$arr_rules      = $arr_data = array();
		$status         = false;
		

		$status = $this->WhatsInsideModel->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
			Session::flash('success', 'Record deleted successfully.');
				return redirect($this->module_view_folder.'/view-menu');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}
	
	public function view_specification(Request $request,$enc_id)
    {	
    	$data['id'] = base64_decode($enc_id);

    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('menu_specification')
                        ->where('menu_id',$data['id'])
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data']      = $arr_data;


        /*For Modal*/
        $editarr_data = [];
        $value     = \DB::table('menu_specification')
                        ->where('menu_id',$data['id'])
                        ->get();
        if(!empty($value))
        {
            $editarr_data = $value->toArray();
        }
        $data['editarr_data']      = $editarr_data;

        /*Specification*/
	        $specification_data = [];
	        $specification_value     = \DB::table('specification')
	                        ->orderBy('id','ASC')
	                        ->get();
	        if(!empty($specification_value))
	        {
	            $specification_data = $specification_value->toArray();
	        }

	        $data['specification_data']      = $specification_data;

        $data['page_name'] = "View Specification";
        return view($this->module_view_folder.'.view-specification',$data);

        }else{
           return view('admin/auth/login');
        }
    }


     public function specification_store(Request $request)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['specification_id']      	   		= "required";
		$arr_rules['affiliate_link'] = 'nullable|string';

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		$menu_id = $request->input('menu_id', null);

		$arr_data['specification_id']				=	$request->input('specification_id', null);	
		$arr_data['menu_id']				=	$request->input('menu_id', null);

		if($request->hasFile('icon_image'))
		{         
			$file_extension = strtolower($request->file('icon_image')->getClientOriginalExtension());
			
			if(in_array($file_extension,['png','jpg','jpeg','svg']))
			{
				$file     = $request->file('icon_image');
				$filename = sha1(uniqid().uniqid()) . '.' . $file->getClientOriginalExtension();
				$path     = $this->product_image_base_path. $filename;
				$isUpload = $file->move($this->product_image_base_path , $filename);
				if($isUpload)
				{
					$arr_data['icon_image'] = $filename;
				}
			}    
			else
			{
				Session::flash('error', 'Please use jpg,png or jpeg.');
				return redirect()->back();
			}
		}	
		
		$status = $this->SpecificationMenuModel->create($arr_data);
		if($status)
		{
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/menu/view-specification/'.base64_encode($menu_id));
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}
	
	public function specification_update(Request $request,$enc_id)
	{
		
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['specification_id']      	   		= "required";
		$arr_rules['affiliate_link'] = 'nullable|string';

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		$menu_id = $request->input('menu_id', null);
		
	/*	$specification =[];
		$specification_value     = \DB::table('specification')
                        ->where('id',$menu_id)
                        ->get();
        if(!empty($specification_value))
        {
            $specification_data = $specification_value->toArray();
        }
        
		foreach ($specification_data as $row) {
			$menu_id = $row->menu_id;
		}*/

		$arr_data['specification_id']				=	$request->input('specification_id', null);	
		$arr_data['menu_id']				=	$request->input('menu_id', null);	
		
		if($request->hasFile('icon_image'))
		{         
			$file_extension = strtolower($request->file('icon_image')->getClientOriginalExtension());
			
			if(in_array($file_extension,['png','jpg','jpeg','svg']))
			{
				$file     = $request->file('icon_image');
				$filename = sha1(uniqid().uniqid()) . '.' . $file->getClientOriginalExtension();
				$path     = $this->product_image_base_path. $filename;
				$isUpload = $file->move($this->product_image_base_path , $filename);
				if($isUpload)
				{
					$arr_data['icon_image'] = $filename;
				}
			}    
			else
			{
				Session::flash('error', 'Please use jpg,png or jpeg.');
				return redirect()->back();
			}
		}	
		
		$status = $this->SpecificationMenuModel->where('id',base64_decode($enc_id))->update($arr_data);
	
		if($status)
		{
		    //print_r($menu_id); die;
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/menu/view-specification/'.base64_encode($menu_id));
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

	public function specification_delete(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;
		
		$status = $this->SpecificationMenuModel->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
			Session::flash('success', 'Record deleted successfully.');
				return redirect($this->module_view_folder.'/view-menu');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}
	
	public function upload(Request $request)
	{
		if($request->hasFile('upload')) {
			$originName = $request->file('upload')->getClientOriginalName();

            $fileName = pathinfo($originName, PATHINFO_FILENAME);
            
            $extension = $request->file('upload')->getClientOriginalExtension();

            $fileName = $fileName.'_'.time().'.'.$extension;

         
            $request->file('upload')->move('uploads/ckeditor/images/', $fileName);
   			

            $CKEditorFuncNum = $request->input('CKEditorFuncNum');
           	
            $url = asset('uploads/ckeditor/images/'.$fileName); 
            
            $msg = 'Image uploaded successfully'; 
            $response = "<script>window.parent.CKEDITOR.tools.callFunction($CKEditorFuncNum, '$url', '$msg')</script>";
            @header('Content-type: text/html; charset=utf-8'); 
           	echo $response;
		}
	}
	
	
}