<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\FaqModel;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use \Illuminate\Support\Str;

use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class FaqController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "FAQ";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
		$this->FaqModel					= new FaqModel();
	}


    public function index(Request $request)
    {	
    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('faq')
                        ->orderBy('id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data']      = $arr_data;
        $data['page_name'] = "FAQ List";
        return view($this->module_view_folder.'.view-faq',$data);
        }else{
           return view('admin/auth/login');
        }
    }

    public function create()
	{
		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
		    return view($this->module_view_folder.'.create-faq',$data);
	    }else{
            return view('admin/auth/login');
        }
	}

	public function store(Request $request)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['title']      	   		= "required";
		$arr_data['description']            = "required";
		$arr_rules['affiliate_link'] = 'nullable|string';

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		
		$arr_data['title']	 =	$request->input('title', null);	
		$arr_data['description'] =	$request->input('description', null);	
	
		$status = $this->FaqModel->create($arr_data);
		if($status)
		{
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/view-faq');
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

		$obj_data = $this->FaqModel->where('id', base64_decode($enc_id))->first();
		
		if($obj_data)
		{
			$arr_data = $obj_data->toArray();
		}

		$data['arr_data']  = $arr_data;

		$data['enc_id']   = $enc_id;
		$data['product_image_public_path']   = $this->product_image_public_path;
		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
			return view($this->module_view_folder.'.edit-faq',$data);
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

		$arr_data['title']				=	$request->input('title', null);	
		$arr_data['description']		=	$request->input('description', null);	

		$status = $this->FaqModel->where('id',base64_decode($enc_id))->update($arr_data);

		if($status)
		{
			Session::flash('success', 'Record updated successfully.');
			return redirect($this->module_view_folder.'/view-faq');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

	public function delete(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$status = $this->FaqModel->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
			Session::flash('success', 'Record deleted successfully.');
				return redirect($this->module_view_folder.'/view-faq');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}
	
	public function view_benefits(Request $request,$enc_id)
    {	
    	$data['id'] = base64_decode($enc_id);
    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('benefits')
                        ->where('blog_id',$data['id'])
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data']      = $arr_data;


        /*For Modal*/
        $editarr_data = [];
        $value     = \DB::table('benefits')
                        ->where('blog_id',$data['id'])
                        ->get();
        if(!empty($value))
        {
            $editarr_data = $value->toArray();
        }
        $data['editarr_data']      = $editarr_data;



        $cate_data = [];
        $cate_value     = \DB::table('categories')
                        ->orderBy('id','Asc')
                        ->get();
        if(!empty($cate_value))
        {
            $cate_data = $cate_value->toArray();
        }

        $data['cate_data']      = $cate_data;


        $data['page_name'] = "View Benefits";
        return view($this->module_view_folder.'.view-benefits',$data);

        }else{
           return view('admin/auth/login');
        }
    }


	
	public function benefits_store(Request $request)
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
		$blog_id = $request->input('blog_id', null);

		$arr_data['title']				=	$request->input('title', null);	
		$arr_data['blog_id']				=	$request->input('blog_id', null);	
		$arr_data['description']				=	$request->input('description', null);	
		$arr_data['title_description']		=	$request->input('title_description', null);	
		
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
		
		$status = $this->BenefitsModel->create($arr_data);
		if($status)
		{
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/blog/view-benefits/'.base64_encode($blog_id));
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

	public function benefits_update(Request $request,$enc_id)
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
		$blog_id = $request->input('blog_id', null);

		$arr_data['title']				=	$request->input('title', null);	
		$arr_data['blog_id']				=	$request->input('blog_id', null);	
		$arr_data['description']				=	$request->input('description', null);	
		$arr_data['title_description']		=	$request->input('title_description', null);	
		
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
		
		$status = $this->BenefitsModel->where('id',base64_decode($enc_id))->update($arr_data);
		if($status)
		{
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/blog/view-benefits/'.base64_encode($blog_id));
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}


	public function benefits_delete(Request $request,$enc_id)
	{

		$arr_rules      = $arr_data = array();
		$status         = false;
		

		$status = $this->BenefitsModel->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
			Session::flash('success', 'Record deleted successfully.');
				return redirect($this->module_view_folder.'/view-blog');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}


	public function view_comments(Request $request,$enc_id)
    {	
    	$data['id'] = base64_decode($enc_id);

    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        /*Comments*/
        $arr_data = [];
        $value     = \DB::table('comments')
                        ->where('blog_id',$data['id'])
                        //->groupby('email')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data']      = $arr_data;
        /*Blog*/
        $blog_data = [];
        $blog_value     = \DB::table('blog')
                        ->where('id',$data['id'])
                        ->get();
        if(!empty($blog_value))
        {
            $blog_data = $blog_value->toArray();
        }
        $data['blog_data']      = $blog_data;

        $data['page_name'] = "View Comments";
        return view($this->module_view_folder.'.view-comments',$data);

        }else{
           return view('admin/auth/login');
        }
    }

    public function comment_update(Request $request,$enc_id)
	{

		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['reply']      	   		= "required";
		$arr_rules['affiliate_link'] = 'nullable|string';

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		$comment_id = $request->input('comment_id', null);
		

		$comments_data =[];
		$comments_value     = \DB::table('comments')
                        ->where('id',$comment_id)
                        ->get();
        if(!empty($comments_value))
        {
            $comments_data = $comments_value->toArray();
        }
        
		foreach ($comments_data as $row) {
			$blog_id = $row->blog_id;
		}

		
		$arr_data['reply']	= $request->input('reply', null);	
		
		
		$status = $this->CommentModel->where('id',$comment_id)->update($arr_data);
		

		if($status)
		{
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/blog/view-comments/'.base64_encode($blog_id));
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

	public function comment_delete(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;
		
		$status = $this->CommentModel->where('id',base64_decode($enc_id))->delete();
		
		if($status)
		{
			Session::flash('success', 'Record deleted successfully.');
				return redirect($this->module_view_folder.'/view-blog');
		}
		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}
	
}