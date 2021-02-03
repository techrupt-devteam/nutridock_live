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
		$this->SubscriptionModel = new SubscriptionModel();
	}

    public function index(Request $request)
    {	
    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('subscription')
                        ->groupBy('email')
                        ->where('is_deleted','No')
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

  public function delete(Request $request,$enc_id)
  {
    $arr_rules      = $arr_data = array();
    $status         = false;
   
    $arr_data['is_deleted']       = 'Yes';
   // $status = $this->SubscriptionModel->where('id',base64_decode($enc_id))->delete();
   $status = $this->SubscriptionModel->where('id',base64_decode($enc_id))->update($arr_data);

    if($status)
    {
      Session::flash('success', 'Record deleted successfully.');
        return redirect($this->module_view_folder.'/subscription-list');
    }

    Session::flash('error', 'Something went wrong.');
    return redirect('/admin/index');
  }

  public function create($enc_id)
  {
    $arr_data = [];
    if($enc_id=='')
    {
      return redirect()->back();
    }

    $obj_data = $this->SubscriptionModel->where('id', base64_decode($enc_id))->first();
    
    if($obj_data)
    {
      $arr_data = $obj_data->toArray();
    }
     
    $data['arr_data'] = $arr_data;

    $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
        return view($this->module_view_folder.'.create-subscription-email',$data);
      }else{
            return view('admin/auth/login');
        }
  }

  public function email(Request $request,$enc_id='')
  {
    $arr_rules      = $arr_data = array();
    $status         = false;

    $validator = validator::make($request->all(),$arr_rules);

    if($validator->fails()) 
    {
      return redirect()->back()->withErrors($validator)->withInput();
    }
     
    $obj_data = $this->SubscriptionModel->where('id', base64_decode($enc_id))->first();
    
    if($obj_data)
    {
        $arr_data = $obj_data->toArray();
    }
    $to       = $arr_data['email'];
    $subject = $request->input('subject', null);
     
    $headers = "From: admin@nutridock.com\r\n";
    $headers .= "Reply-To: admin@nutridock.com\r\n";
    $headers .= "BCC: marketing@nutridock.com\r\n";
    $headers .= "BCC: it@sevagroup.co.in\r\n";
    $headers .= "BCC: urvashitikmani1310@gmail.com\r\n";
    $headers .= "BCC: geoshinsam@gmail.com\r\n";
    $headers .= "BCC: sales@nutridock.com\r\n";
    
    /*$headers = "From: webdeveloper@techrupt.in\r\n";
    $headers .= "Reply-To: webdeveloper@techrupt.in \r\n";
    $headers .= "CC: pagarelaxmi@gmail.com\r\n";
    $headers .= "BCC: laxmipagare1991@gmail.com\r\n";*/
        
    $headers .= "MIME-Version: 1.0\r\n";
    $headers .= "Content-Type: text/html; charset=UTF-8\r\n";
    $message = $request->input('message', null);
    mail($to, $subject, $message, $headers); 
    return redirect($this->module_view_folder.'/subscription-list');
  }
    
    public function subscription_email_all(Request $request)
    {
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
        
        $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
        return view($this->module_view_folder.'.subscription-mail-all',$data);
      }else{
            return view('admin/auth/login');
        }
    }  
    
    
    public function email_all(Request $request)
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
  
  

}