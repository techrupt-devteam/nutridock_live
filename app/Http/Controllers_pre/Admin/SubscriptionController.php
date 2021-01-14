<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\SubscriptionModel;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use \Illuminate\Support\Str;


use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class SubscriptionController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
	
		$this->SubscriptionModel					= new SubscriptionModel();
	}


    public function index(Request $request)
    {	

    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('subscription')
                        ->groupBy('email')
                        ->orderBy('id','DESC')
                        ->get();
                        
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }

        $data['arr_data']      = $arr_data;

        $data['page_name'] = "Subscription List";
        //$data['title']     = $this->title;

        return view($this->module_view_folder.'.subscription-list',$data);

        }else{
           return view('admin/auth/login');
        }
    }

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

  public function delete(Request $request,$enc_id)
  {
    $arr_rules      = $arr_data = array();
    $status         = false;
    /*$value     = \DB::table('survey')
                        //->where('id',1)
                        ->orderBy('id','DESC')
                        ->get();*/
    $status = $this->SubscriptionModel->where('id',base64_decode($enc_id))->delete();

    if($status)
    {
      Session::flash('success', 'Record deleted successfully.');
        return redirect($this->module_view_folder.'/subscription-list');
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
    $obj_data = $this->SubscriptionModel->where('id', base64_decode($enc_id))->first();
    
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

    
  public function email(Request $request)
  {


    $arr_rules      = $arr_data = array();
    $status         = false;

    $validator = validator::make($request->all(),$arr_rules);

    if($validator->fails()) 
    {
      return redirect()->back()->withErrors($validator)->withInput();
    }

    $email_multiple       = $request->input('email', null);  
    $count_email_multiple = count($email_multiple);

    

    for($i=0; $i<$count_email_multiple; $i++){
      $to = $email_multiple[$i];
      
      
      $subject = "Your Nutrition Guide is inside!";
      $headers = "From: admin@nutridock.com\r\n";
      $headers .= "Reply-To: admin@nutridock.com\r\n";
      $headers .= "BCC: marketing@nutridock.com\r\n";
      $headers .= "BCC: it@sevagroup.co.in\r\n";
      $headers .= "BCC: urvashitikmani1310@gmail.com\r\n";
      $headers .= "BCC: geoshinsam@gmail.com\r\n";
        
      /*$headers = "From: webdeveloper@techrupt.in\r\n";
      $headers .= "Reply-To: webdeveloper@techrupt.in \r\n";
      $headers .= "CC: pagarelaxmi@gmail.com\r\n";
      $headers .= "BCC: laxmipagare1991@gmail.com\r\n";
*/
        $headers .= "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=UTF-8\r\n";
        $message = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Your nutrition guide is inside!</title>
        </head>
        <body>
        <span style="font-size:14px"><span style="font-family:arial,helvetica,sans-serif">
        <strong>Hi,</strong><br><br>
          
        We’re so excited to share the guide for <a href="https://nutridock.com/public/landing/pdf/Nutridock Guide.pdf">Creating Healthy Eating Habits </a> with you! <br><br>

        Welcome to Nutridock. We’ve started with a passion to help people adopt a healthy lifestyle.<br><br>

        Creating healthy eating habits is one of the most important skills you can give yourself for your overall wellbeing — especially if you want to feel your best in your daily life.<br><br>

        But creating healthy eating habits that work for you 365 days a year can be challenging.<br><br>

        Our philosophy is based on eating an abundance of whole foods that keep you satiated, supports digestion, keeps your focus sharp, and energy stabilized.<br><br>

        It also includes practicing mindful eating that can help you tune into your body and create a more positive experience with food. <br><br>

        And most importantly, we believe in giving you the skills you need in order to put those two things into practice in your daily life to make healthy eating easy and enjoyable. <br><br>

        After you finish reading this guide, you’ll have a few steps you can practice to make your daily food choices a little easier, more mindful and more enjoyable. <br><br>

        <b><a href="https://nutridock.com/public/landing/pdf/Nutridock Guide.pdf">Here’s the link to access the guide!</a></b><br>
        Excited to be a part of your wellness journey! <br>
        <br>
        Team Nutridock.<br>

        <a href="https://nutridock.com/public/landing/pdf/Nutridock Guide.pdf">Nutridock Guide</a>   
              </body>
            </html>';
        mail($to, $subject, $message, $headers);
        
        
       
    }
     return back();
        
  }

}