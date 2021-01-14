<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\WebinarModel;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use \Illuminate\Support\Str;


use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class WebinarController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
	
		$this->WebinarModel					= new WebinarModel();
	}


    public function index(Request $request)
    {	

    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('webinar')
                        //->where('id',1)
                        ->orderBy('id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }

        $data['arr_data']      = $arr_data;

        $data['page_name'] = "Webinar List";
        //$data['title']     = $this->title;

        return view($this->module_view_folder.'.webinar_list',$data);

        }else{
           return view('admin/auth/login');
        }
    }
    
    
    public function view($enc_id='')
	{
		$arr_data = [];
		if($enc_id=='')
		{
			return redirect()->back();
		}
		
		//print_r($id);die;
		$obj_data = $this->WebinarModel->where('id', base64_decode($enc_id))->first();
		
		//print_r($obj_data); die;
		if($obj_data)
		{
			$arr_data = $obj_data->toArray();
		}
	
		$data['arr_data'] = $obj_data;
		
		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
			return view($this->module_view_folder.'.view-webinar',$data);
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

	public function store(Request $request)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		$arr_rules['blog_title']      	   		= "required";
		//$arr_rules['blog_description']      	   	= "required";

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		//$name = $request->input('name', null);

		$arr_data['blog_title']				=	$request->input('blog_title', null);	
		$arr_data['blog_description']		=	$request->input('blog_description', null);	
		$arr_data['sub_title1']		=	$request->input('sub_title1', null);	
		$arr_data['quote_person']		=	$request->input('quote_person', null);	
		$arr_data['quote']		=	$request->input('quote', null);	
		$arr_data['sub_description1']		=	$request->input('sub_description1', null);	
		$arr_data['sub_title2']		=	$request->input('sub_title2');	
		$arr_data['sub_description2']		=	$request->input('sub_description2');
		$arr_data['sub_image1']		=	'1';
		$arr_data['sub_image2']		=	'2';
		

		//print_r($request->hasFile('image')); die;
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

		if($request->hasFile('sub_image1'))
		{         
			$file_extension = strtolower($request->file('sub_image1')->getClientOriginalExtension());

			if(in_array($file_extension,['png','jpg','jpeg']))
			{
				$file     = $request->file('sub_image1');
				$filename = sha1(uniqid().uniqid()) . '.' . $file->getClientOriginalExtension();
				$path     = $this->product_image_base_path. $filename;
				$isUpload = $file->move($this->product_image_base_path , $filename);
				if($isUpload)
				{
					$arr_data['sub_image1'] = $filename;
				}
			}    
			else
			{
				Session::flash('error', 'Please use jpg,png or jpeg.');
				return redirect()->back();
			}
		}

		if($request->hasFile('sub_image2'))
		{         
			$file_extension = strtolower($request->file('sub_image2')->getClientOriginalExtension());

			if(in_array($file_extension,['png','jpg','jpeg']))
			{
				$file     = $request->file('sub_image2');
				$filename = sha1(uniqid().uniqid()) . '.' . $file->getClientOriginalExtension();
				$path     = $this->product_image_base_path. $filename;
				$isUpload = $file->move($this->product_image_base_path , $filename);
				if($isUpload)
				{
					$arr_data['sub_image2'] = $filename;
				}
			}    
			else
			{
				Session::flash('error', 'Please use jpg,png or jpeg.');
				return redirect()->back();
			}
		}

		//print_r($path); die;
		$status = $this->BlogModel->create($arr_data);
		//print_r($status); die;
		if($status)
		{
			Session::flash('success', 'Record added successfully.');
			return redirect($this->module_view_folder.'/blog_list');
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

		$status = $this->WebinarModel->where('id',base64_decode($enc_id))->delete();

		if($status)
		{
			Session::flash('success', 'Record deleted successfully.');
				return redirect($this->module_view_folder.'/webinar_list');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}


	/*function export(){
		$data['booking_list'] = $this->common->getAllRow('booking','order BY id DESC');
		$this->load->view('admin/booking_export',$data);
	}
   	*/
   	public function export(Request $request)
	{


		$data     = \DB::table('webinar')
                        ->orderBy('id','ASC')
                        ->get();
        header("Content-type: text/csv");
        header("Content-Disposition: attachment; filename=Webinar.csv");
        header("Pragma: no-cache");
        header("Expires: 0");
          
          echo "Sr. No.";
          echo ',';
          echo "Name";
          echo ',';
          echo "Email";
          echo ',';
          echo "Mobile No.";
          echo ',';
          echo "City";
          echo ',';
          echo "age";
          echo ',';
          echo "\n"; 
        foreach ($data as $key => $value) 
        {
              echo $key+1;
              echo ',';
              echo $value->name;
              echo ',';
              echo $value->email;
              echo ',';
              echo $value->mobile;
              echo ',';
              echo $value->city;
              echo ',';
              echo $value->age;
              echo ',';
              echo "\n";
        }
        //print_r($data);
        die;
	}


    public function email()
	{
		$obj_data = $this->WebinarModel->where('payment_status', 'Paid')->get();

        if($obj_data)
        {
            $arr_data = $obj_data->toArray();
        }   
        $data['arr_data'] = $arr_data;

        $obj_pending_data = $this->WebinarModel->where('payment_status', 'Initiated')->get();

        if($obj_pending_data)
        {
            $arr_pending_data = $obj_pending_data->toArray();
        }   
        $data['arr_pending_data'] = $arr_pending_data;
        //print_r($data['arr_pending_data']); die;

		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
			return view($this->module_view_folder.'.webinar-email',$data);
		 }else{
            return view('admin/auth/login');
        }
	}



    public function send_email(Request $request)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']				= "required";
		

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		/*$arr_data['name']		=	$request->input('name', null);
		$arr_data['email']				=	$request->input('email', null);	*/
		$arr_data['zoom_link']		=	$request->input('zoom_link', null);	
		$arr_data['title']		=	$request->input('title', null);	
		/*$arr_data['description']		=	$request->input('description', null);	*/
		
		$email_multiple		=	$request->input('email_multiple', null);

		$email_implode_value = implode(",", $email_multiple);
		//print_r($email_implode_value); die;

		//$to = 'laxmipagare99@gmail.com,webdeveloper@techrupt.in';
        $to = $email_implode_value;
        
		if($to){
			 

        $subject = $arr_data['title'];
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
			   <span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif">
			    <strong>Hi,</strong><br><br>
			    This is a <b>reminder</b> that the webinar on "Role of Nutrition on Mental Well Being" will
			    be held tomorrow. <br><br>

			    Date & Time: Sep 12, 2020 05:00 PM Mumbai, Kolkata, New Delhi <br><br>

			    <b>What you can expect in the webinar: </b><br>
			    1. How the lack of nutrition affects our mental health ?<br> 
			    2. Easy diets and daily habits. <br>
			    3. Nutritional intake and its domination over depression.<br>
			    4. The deafening claws of stress.<br>
			    5. Practical tips on how to overcome stress, & much more…<br><br>

			    <b>CLICK HERE TO JOIN </b><br><br>
			    '.$arr_data['zoom_link'].'<br>
			    Note: This link is unique to you and should not be shared with others in all proximity.<br><br> 
			 
			    You can join from a PC, Mac, iPad, iPhone or any other Android device, according to your convenience. <br><br>
			 
			    <b>Kindly remember a few things:</b><br>
			     1. Join 10-min in advance so that you do not miss on anything.<br> 
			     2. Use the chat feature, if you would like to ask any question.<br>
			     3. Close all the other tabs and set all your other devices aside, as we would like to have all of your attention for a better experience. <br><br>
			 
			    We hope you have a pleasant and knowledgeable experience with our experts following with 15-min live questions and answers round. <br><br>
			 
			    If you have any queries, kindly do not hesitate to reach out to us. <br><br>

			    Thanks once again, and we cannot wait to see you at the webinar.<br><br> 
			 
			    
			    <br><br>Regards,  <br>Team NutriDock<br></span></span><br /><br />
			</body>
            </html>';

        mail($to, $subject, $message, $headers);
		}
		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}


	public function send_email_pending(Request $request)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;
		$arr_rules['_token']	= "required";
		$validator = validator::make($request->all(),$arr_rules);
		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		$arr_data['zoom_link']		=	$request->input('zoom_link', null);	
		$arr_data['title']		=	$request->input('title', null);	
		$arr_data['description'] =	$request->input('description', null);
		
		$email_multiple		=	$request->input('email_multiple', null);

		$email_implode_value = implode(",", $email_multiple);
		//print_r($email_implode_value); die;
		//$to = 'laxmipagare99@gmail.com,webdeveloper@techrupt.in';
        $to = $email_implode_value;
		if($to){
        $subject = $arr_data['title'];
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
			    <br><br> 
			 	'.$arr_data['description'].'
			    <br><br>Regards,  <br>Team NutriDock<br></span></span><br /><br />
			</body>
            </html>';

        mail($to, $subject, $message, $headers);
		}

		

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}


}