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
		$this->module_title                 = "Contact Us";
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
                        ->where('is_deleted','No')
                        ->orderBy('id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data'] = $arr_data;
        
        $data['page_name'] = "Contact List";

        return view($this->module_view_folder.'.view-contact',$data)->with('no', 1);;
        }else{
           return view('admin/auth/login');
        }
    }
    
     public function create_email($enc_id)
  	{
	    $arr_data = [];
	    if($enc_id=='')
	    {
	      return redirect()->back();
	    }

	    $obj_data = $this->ContactModel->where('id', base64_decode($enc_id))->first();
	    
	    if($obj_data)
	    {
	      $arr_data = $obj_data->toArray();
	    }
	     
	    $data['arr_data'] = $arr_data;
	    
	    $user = \Sentinel::check();
	        $data['session_user']  = Session::get('user');
	        if($data['session_user']){
	        return view($this->module_view_folder.'.create-contact-email',$data);
	      }else{
	            return view('admin/auth/login');
	        }
  	}

    
    public function email(Request $request,$enc_id)
    {
       	$arr_rules      = $arr_data = array();
	    $status         = false;

	    $validator = validator::make($request->all(),$arr_rules);

	    if($validator->fails()) 
	    {
	      return redirect()->back()->withErrors($validator)->withInput();
	    }
	     
	    $obj_data = $this->ContactModel->where('id', base64_decode($enc_id))->first();
	    
	    if($obj_data)
	    {
	        $arr_data = $obj_data->toArray();
	    }
	    $to       = $arr_data['email'];
    
	    
	    $subject = $request->input('subject', null);
	    $message = $request->input('message', null);
	     
	    $headers = "From: admin@nutridock.com\r\n";
	    $headers .= "Reply-To: admin@nutridock.com\r\n";
	    $headers .= "BCC: marketing@nutridock.com\r\n";
	    $headers .= "BCC: it@sevagroup.co.in\r\n";
	    $headers .= "BCC: urvashitikmani1310@gmail.com\r\n";
	    $headers .= "BCC: geoshinsam@gmail.com\r\n";
	    $headers .= "BCC: sales@nutridock.com\r\n";
	    
	    /*$headers = "From: pagarelaxmi@gmail.com\r\n";
	    $headers .= "Reply-To: pagarelaxmi@gmail.com \r\n";
	    $headers .= "CC: laxmipagare99@gmail.com\r\n";
	    $headers .= "BCC: laxmipagare1991@gmail.com\r\n";*/
	        
	    $headers .= "MIME-Version: 1.0\r\n";
	    $headers .= "Content-Type: text/html; charset=UTF-8\r\n";
	    
	    if(mail($to, $subject, $message, $headers)){
	        Session::flash('success', 'Email send successfully.');
	        return redirect($this->module_view_folder.'/view-contact');    
	    }
	    

    }
    
    public function create_email_all()
  	{

	   $arr_data = [];
        $value     = \DB::table('contact')
                        ->groupBy('email')
                        ->orderBy('id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }

        $data['arr_data']      = $arr_data;
	    
	    $user = \Sentinel::check();
	        $data['session_user']  = Session::get('user');
	        if($data['session_user']){
	        return view($this->module_view_folder.'.create-contact-email_all',$data);
	      }else{
	            return view('admin/auth/login');
	        }
  	}


  	public function contact_email_all(Request $request)
    {
	    $arr_rules      = $arr_data = array();
        $status         = false;

        $validator = validator::make($request->all(),$arr_rules);
    
        if($validator->fails()) 
        {
          return redirect()->back()->withErrors($validator)->withInput();
        }
        $email_multiple       = $request->input('email', null);  
        
        $subject       = $request->input('subject', null);  
        $message       = $request->input('message', null);  
    
        $count_email_multiple = count($email_multiple);
        
        for($i=0; $i<$count_email_multiple; $i++){
          $to = $email_multiple[$i];
        
          $subject = $subject;
          
          $subject = "Your Nutrition Guide is inside!";
          $headers = "From: admin@nutridock.com\r\n";
          $headers .= "Reply-To: admin@nutridock.com\r\n";
          $headers .= "BCC: marketing@nutridock.com\r\n";
          $headers .= "BCC: it@sevagroup.co.in\r\n";
          $headers .= "BCC: urvashitikmani1310@gmail.com\r\n";
          $headers .= "BCC: geoshinsam@gmail.com\r\n";
          $headers .= "BCC: sales@nutridock.com\r\n";
            
         /* $headers = "From: webdeveloper@techrupt.in\r\n";
          $headers .= "Reply-To: webdeveloper@techrupt.in \r\n";
          $headers .= "BCC: laxmipagare1991@gmail.com\r\n";*/
    
          $headers .= "MIME-Version: 1.0\r\n";
          $headers .= "Content-Type: text/html; charset=UTF-8\r\n";
          $message = $message;
          mail($to, $subject, $message, $headers);
        }
         return back();
        
    }
    
    

	public function view($enc_id='')
	{
		$arr_data = [];
		if($enc_id=='')
		{
			return redirect()->back();
		}
		$obj_data = $this->ContactModel->where('id', base64_decode($enc_id))->first();
		
		if($obj_data)
		{
			$arr_data = $obj_data->toArray();
		}
	
		$data['arr_data']               	    = $arr_data;
		$data['enc_id']                  	= $enc_id;
		
		$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
			return view($this->module_view_folder.'.view-contact-details',$data);
		 }else{
            return view('admin/auth/login');
        }
	}

	
	public function delete(Request $request,$enc_id)
	{
		$arr_rules      = $arr_data = array();
		$status         = false;

		//$status = $this->ContactModel->where('id',base64_decode($enc_id))->delete();

		$arr_data['is_deleted']	= 'Yes'	;	

		$status = $this->ContactModel->where('id',base64_decode($enc_id))->update($arr_data);
        
		if($status)
		{
			Session::flash('success', 'Record deleted successfully.');
			return redirect($this->module_view_folder.'/view-contact');
		}

		Session::flash('error', 'Something went wrong.');
		return redirect('/admin/index');
	}


}