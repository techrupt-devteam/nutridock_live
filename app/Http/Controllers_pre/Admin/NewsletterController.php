<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\NewsletterModel;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class NewsletterController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
		$this->NewsletterModel = new NewsletterModel();
	}


    public function index(Request $request)
    {	
    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = $this->NewsletterModel
                        //->where('id',1)
                        ->orderBy('id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }

        $data['arr_data']      = $arr_data;

        $data['page_name'] = "Newsletter List";

        return view($this->module_view_folder.'.newsletter-list',$data);

        }else{
           return view('admin/auth/login');
        }
    }

	
	public function delete(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$status = $this->NewsletterModel->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
			Session::flash('newsletter_delete', 'Record deleted successfully.');
				return redirect($this->module_view_folder.'/newsletter-list');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}


}