<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\SurveyModel;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use \Illuminate\Support\Str;


use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class SurveyController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
	
		$this->SurveyModel					= new SurveyModel();
	}


    public function index(Request $request)
    {	

    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('survey')
                        //->where('id',1)
                        ->orderBy('id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }

        $data['arr_data']      = $arr_data;

        $data['page_name'] = "Survey List";
        //$data['title']     = $this->title;

        return view($this->module_view_folder.'.survey_list',$data);

        }else{
           return view('admin/auth/login');
        }
    }



	/*function export(){
		$data['booking_list'] = $this->common->getAllRow('booking','order BY id DESC');
		$this->load->view('admin/booking_export',$data);
	}
   	*/
   	

   	public function export(Request $request)
	{
		$data     = \DB::table('survey')->orderBy('id','ASC')->get();

        header("Content-type: text/csv");
        header("Content-Disposition: attachment; filename=Survey.csv");
        header("Pragma: no-cache");
        header("Expires: 0");
          echo "Sr. No.";
          echo ',';
          echo "Download";
          echo ',';
          echo "Comments";
          echo ',';
          echo "Refrains";
          echo ',';
          echo "\n"; 
        foreach ($data as $key => $value) 
        {
          echo $key+1;
          echo ',';
          echo $value->download_app;
          echo ',';
          echo $value->comments;
          echo ',';
          echo $value->refrains;
          echo ',';
          echo "\n";
        }
        //print_r($data);
        die;
	}


	public function delete(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;
		/*$value     = \DB::table('survey')
                        //->where('id',1)
                        ->orderBy('id','DESC')
                        ->get();*/
		$status = \DB::table('survey')->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
			Session::flash('success', 'Record deleted successfully.');
				return redirect($this->module_view_folder.'/survey_list');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}

	public function view($enc_id='')
	{
		$arr_data = [];
		if($enc_id=='')
		{
			return redirect()->back();
		}
		
		//print_r($id);die;
		$obj_data = $this->SurveyModel->where('id', base64_decode($enc_id))->first();
		
		//print_r($obj_data); die;
		if($obj_data)
		{
			$arr_data = $obj_data->toArray();
		}
	
		$data['arr_data'] = $obj_data;
		
		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
			return view($this->module_view_folder.'.view-survey',$data);
		 }else{
            return view('admin/auth/login');
        }
	}


	
	public function email($enc_id='')
	{
		$arr_data = [];
		if($enc_id=='')
		{
			return redirect()->back();
		}

		$obj_data = $this->WebinarModel->where('id', base64_decode($enc_id))->first();
		
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
			return view($this->module_view_folder.'.webinar-email',$data);
		 }else{
            return view('admin/auth/login');
        }
	}

	public function send_email($enc_id='')
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
		$arr_data['name']		=	$request->input('name', null);
		$arr_data['email']				=	$request->input('email', null);	
		$arr_data['zoom_link']		=	$request->input('zoom_link', null);	
		$arr_data['title']		=	$request->input('title', null);	
		$arr_data['description']		=	$request->input('description', null);	

		$to = $request->input('email');

		if($to){
			$subject = 'Nutridock Webinar';
            $headers = "From: pagarelaxmi@gmail.com\r\n";
            $headers .= "Reply-To: pagarelaxmi@gmail.com\r\n";
            //$headers .= "CC: it@sevagroup.co.in\r\n";
            //$headers .= "CC: it@techrupt.in\r\n";
            //$headers .= "CC: marketing@nutridock.com\r\n";
            $headers .= "MIME-Version: 1.0\r\n";
            $headers .= "Content-Type: text/html; charset=UTF-8\r\n";
            
            $message = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                <html xmlns="http://www.w3.org/1999/xhtml">
                <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>Receipt</title>
                </head>
                <body>
                    <span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif"><strong>Hello, ,</strong><br><br>Thank you for registring with nutridock webinar. we will sending you the zoom link.Get ready to learn from nutrition on saterday evening. <br><br>Thanks & Regards <br>Nutridock Webinar<br><span style="font-family:arial,helvetica,sans-serif">Nashik: 0253-6643444 ></span></span></span><br /><br />
                </body>
                </html>';
		}
		
		$status = $this->WebinarModel->where('id',base64_decode($enc_id))->update($arr_data);

		if($status)
		{
			Session::flash('success', 'Email send successfully.');
			return redirect($this->module_view_folder.'/blog_list');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}


}