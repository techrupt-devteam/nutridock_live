<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use \Illuminate\Support\Str;
use Illuminate\Support\Arr;

use App\Models\MealType;
use App\Models\SubscribeNow;
use App\Models\CouponcodeModel;
use App\Models\SubscribeNowDetails;

use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class SubscriptionNowController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
		$this->SubscribeNow = new SubscribeNow();
    $this->CouponcodeModel = new CouponcodeModel();
	}


   public function index(Request $request)
    { 

        $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('subscribe_now_user')
                        ->where('is_deleted','No')
                        ->orderBy('id','DESC')
                        ->groupBy('phone_no')
                        ->groupBy('email')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data']      = $arr_data;

        $data['page_name'] = "Subscribe Now List";
        return view($this->module_view_folder.'.view-subscribe-now-user',$data)->with('no', 1);

        }else{
           return view('admin/auth/login');
        }
    }

    public function view_subscribe_now(Request $request,$id)//$value1,$value2,$value3
    {	  

    	  $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
        $subscribe_now_details = [];
        $subscribe_now_details_data = \DB::table('subscribe_now_details')->where('subscribe_now_details.subscribe_now_user_id',$id)->where('subscribe_now_details.is_deleted','No')->get();
        if(!empty($subscribe_now_details_data))
        {
            $subscribe_now_details = $subscribe_now_details_data->toArray();
        }
        $data['subscribe_now_details'] = $subscribe_now_details;
        //print_r($data['subscribe_now_details']); die;

        /*For Modal*/
        $editarr_data = [];
        $value     = \DB::table('subscribe_now_details')->where('subscribe_now_user_id',$id)->get();
        if(!empty($value))
        {
            $editarr_data = $value->toArray();
        }
        $data['editarr_data']      = $editarr_data;
        //print_r($data['editarr_data']); die;
        $data['page_name'] = "Subscribe Now List";
        
        return view($this->module_view_folder.'.view-subscribe-now',$data)->with('no', 1);
        }else{
           return view('admin/auth/login');
        }
    }

    public function view(Request $request,$id1,$id2)
    { 

      
        $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('subscribe_now_details')
                        ->where('id',base64_decode($id1))
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data'] = $arr_data;
         
        $user_arr_data = [];
        $user_value     = \DB::table('subscribe_now_user')
                        ->where('id',base64_decode($id2))
                        ->get();
        if(!empty($user_value))
        {
            $user_arr_data = $user_value->toArray();
        }
        $data['user_arr_data'] = $user_arr_data;
        

        $physical_activity_id = '';
        foreach($arr_data as $row){
          $physical_activity_id = $row->physical_activity_id;
          $coupon_code_id = $row->coupon_code_id;
        }

        /*Coupon Code Data Start*/
        $coupon_code_data = [];
        $coupon_code_value     = \DB::table('coupon_code')
                        ->where('coupon_code_id',$coupon_code_id)
                        ->get();
        if(!empty($coupon_code_value))
        {
            $physical_activity_data = $coupon_code_value->toArray();
        }
        $data['coupon_code_data'] = $coupon_code_data;
        /*Coupon Code Data End*/

        /*Physical Activity Data Start*/
        $physical_activity_data = [];
        $physical_activity_value     = \DB::table('physical_activity')->get();
        if(!empty($physical_activity_value))
        {
            $physical_activity_data = $physical_activity_value->toArray();
        }
        $data['physical_activity_data']      = $physical_activity_data;
        /*Physical Activity Data End*/

        /*Avoid / Deslike Data Start*/
        $food_avoid_data = [];
        $food_avoid_value  = \DB::table('food_avoid')->get();
        if(!empty($food_avoid_value))
        {
            $food_avoid_data = $food_avoid_value->toArray();
        }
        $data['food_avoid_data']      = $food_avoid_data;
        /*Avoid / Deslike Data Start*/

        /*Meal Type Data Start*/
        $meal_type_data = [];
        $meal_type_value  = \DB::table('meal_type')->get();
        if(!empty($meal_type_value))
        {
            $meal_type_data = $meal_type_value->toArray();
        }
        $data['meal_type_data_arr'] = $meal_type_data;
        /*Meal Type Data End*/
        
        /*Subscribe Now Data Start*/
        $subscribe_now_data = [];
        $subscribe_now_value  = \DB::table('subscribe_now_plan_duration')->orderBy('subscribe_now_plan_duration_id','ASC')->get();
        if(!empty($subscribe_now_value))
        {
            $subscribe_now_data = $subscribe_now_value->toArray();
        }
        $data['subscribe_now_data_arr'] = $subscribe_now_data;
        /*Subscribe Now Data End*/
        $data['page_name'] = "Subscribe Now Details";
        return view($this->module_view_folder.'.view-subscribe-now-details',$data)->with('no', 1);
        }else{
           return view('admin/auth/login');
        }
    }

    public function store_comment_link(Request $request,$enc_id)
    {   
        $arr_rules['_token']         = "required";
        $arr_data['link']   =   $request->input('link', null);
        $arr_data['comments']   =   $request->input('comments', null);
        $status = SubscribeNowDetails::where('id',base64_decode($enc_id))->update($arr_data);
        if($status){
          return redirect(url()->previous());
        }
        Session::flash('error', 'Something went wrong.');
        return view('admin/auth/login');
    }

    public function approve_status(Request $request,$enc_id)
    {   
        $blog_id = $request->input('blog_id', null);
        $arr_data['approve_status'] = 'Approve';
        $status = SubscribeNowDetails::where('id',$enc_id)->update($arr_data);
        if($status)
        {
          Session::flash('success', 'Subscriber approve successfully.');
          //return redirect($this->module_view_folder.'/view-subscribe-now');
          return redirect(url()->previous());
        }
        Session::flash('error', 'Something went wrong.');
        return view('admin/auth/login');
    }

    public function disapprove_status(Request $request,$enc_id)
    {
      $arr_data['approve_status'] = 'Disapprove';
      $status = SubscribeNowDetails::where('id',$enc_id)->update($arr_data);
      if($status)
      {
        Session::flash('success', 'Subscriber disapprove successfully.');
        //return redirect($this->module_view_folder.'/view-subscribe-now');
        return redirect(url()->previous());
      }
      Session::flash('error', 'Something went wrong.');
      return redirect('/admin/index');
    }

    function export(){
      $arr_data = [];
      $value     = \DB::table('subscribe_now_user')->orderBy('id','DESC')->get();
      if(!empty($value))
      {
          $arr_data = $value->toArray();
      }
      $data['arr_data']      = $arr_data;

      return view($this->module_view_folder.'.subscribe-now-export',$data)->with('no', 1);
    }

    function export_user(Request $request,$id){
      //$id1,$id2,$id3

      $arr_data = [];
      $value     = \DB::table('subscribe_now_details')->join('subscribe_now_user','subscribe_now_user.id','=','subscribe_now_details.subscribe_now_user_id')->where('subscribe_now_details.subscribe_now_user_id',base64_decode($id))->orderBy('subscribe_now_details.id','ASC')->get();
      if(!empty($value))
      {
          $arr_data = $value->toArray();
      }
      $data['arr_data']      = $arr_data;

      $physical_activity_id = '';
      foreach($arr_data as $row){
        $subscribe_now_user_id = $row->id;
      }

      $arr_details = [];
      $details_value     = \DB::table('subscribe_now_details')->where('subscribe_now_user_id',$subscribe_now_user_id)->orderBy('id','ASC')->get();
      if(!empty($details_value))
      {
          $arr_details = $details_value->toArray();
      }
      $data['arr_details'] = $arr_details;

      $physical_activity_id = '';
      foreach($arr_details as $row){
        $physical_activity_id = $row->physical_activity_id;
      }

      /*Physical Activity Data Start*/
      $physical_activity_data = [];
      $physical_activity_value     = \DB::table('physical_activity')
                      ->where('physical_activity_id',$physical_activity_id)
                      ->get();
      if(!empty($physical_activity_value))
      {
          $physical_activity_data = $physical_activity_value->toArray();
      }
      $data['physical_activity_data']      = $physical_activity_data;
      /*Physical Activity Data End*/

      return view($this->module_view_folder.'.subscribe-now-export-user',$data)->with('no', 1);
    }

    function export_subscriber(Request $request, $enc_id){
      //->join('subscribe_discount','subscribe_discount.subscribe_discount_id','=','subscribe_now_plan_duration.subscribe_discount_id')

      $arr_data = [];
      $value     = \DB::table('subscribe_now_details')->where('id',$enc_id)->get();
      if(!empty($value))
      {
          $arr_data = $value->toArray();
      }
      $data['arr_data']      = $arr_data;
      //print_r($data['arr_data']); die;
      foreach($arr_data as $row){
        $subscribe_now_user_id = $row->subscribe_now_user_id;
      }
     

      $user_arr_data = [];
      $user_value     = \DB::table('subscribe_now_user')->where('id',$subscribe_now_user_id)->get();
      if(!empty($user_value))
      {
          $user_arr_data = $user_value->toArray();
      }
      $data['user_arr_data']      = $user_arr_data;
      //print_r($user_arr_data); die;

      return view($this->module_view_folder.'.subscribe-now-export-subscriber',$data)->with('no', 1);
    }

    public function delete(Request $request,$enc_id)
    {
      //print_r($enc_id); die;
      $arr_data['is_deleted']       = 'Yes';
      $status = SubscribeNowDetails::where('id',$enc_id)->update($arr_data);
      if($status)
      {
          //Session::flash('success', 'Record deleted successfully.');
          return redirect(url()->previous());
          return redirect($this->module_view_folder.'/view-subscribe-now');
      }
      Session::flash('error', 'Something went wrong.');
      return redirect('/admin/index');
    }

    public function update(Request $request,$enc_id)
    {
      $arr_rules      = $arr_data = array();
      $status         = false;

      $arr_rules['_token']        = "required";
      $validator = validator::make($request->all(),$arr_rules);

      if($validator->fails()) 
      {
        return redirect()->back()->withErrors($validator)->withInput();
      }

      $arr_data['address1']       = $request->input('address1', null);  
      $arr_data['address2']        = $request->input('address2', null); 
      $arr_data['pincode1']   = $request->input('pincode1', null);  
      $arr_data['pincode2']   = $request->input('pincode2', null);  
      
      $arr_data['age']       = $request->input('age', null);  
      $arr_data['gender']        = $request->input('gender', null); 
      $arr_data['weight']   = $request->input('weight', null);  
      $arr_data['height_in_feet']   = $request->input('height_in_feet', null);  
      $arr_data['height_in_inches']   = $request->input('height_in_inches', null);  
      
      $arr_data['physical_activity_id']   =   $request->input('physical_activity_id',null);
      $arr_data['food_precautions']  = $request->input('food_precautions',null);
      $arr_data['lifestyle_disease'] = $request->input('lifestyle_disease',null);
      $arr_data['start_date']   = $request->input('start_date', null);            
      
      $expiry_date_value   = $request->input('expiry_date', null);  
      $date = date_create($expiry_date_value);
      $arr_data['expiry_date'] = date_format($date,"Y-m-d");

      $extended_date_value   = $request->input('extended_date', null);  
      $extended_date = date_create($extended_date_value);
      $arr_data['extended_date'] = date_format($extended_date,"Y-m-d");
      
      $arr_data['coupon_code_id']   = $request->input('coupon_code_id', null);
      $arr_data['price']   = $request->input('price', null);
      $arr_data['total']   = $request->input('total', null);  
      $arr_data['discount']   = $request->input('discount', null);  
      $arr_data['payment_status']   = $request->input('payment_status', null);
      $avoid_or_dislike_food_value = $request->input('avoid_or_dislike_food_id'); 
      $avoid_or_dislike_explode = explode(",",$avoid_or_dislike_food_value);
      for($i=0; $i<count($avoid_or_dislike_explode); $i++){
        if($avoid_or_dislike_explode[$i]=="Other"){
          $other_value = $request->input('other_food');
        }else{
          $other_value = '';
        }
      }  

      $arr_data['avoid_or_dislike_food_id'] = $avoid_or_dislike_food_value;
      $arr_data['other_food'] = $other_value; 
      $arr_data['subscribe_now_plan_duration_id'] = $request->input('subscribe_now_plan_duration_id',null);
      $meal_type_id_data   = $request->input('meal_type_id', null);  
    
      if($meal_type_id_data)
      {
          $meal_type_id = "";
          foreach ($meal_type_id_data as $meal_value)
          {
                 $meal_type_id .= $meal_value . ",";
          }
          $arr_data['meal_type_id'] = substr($meal_type_id,0,-1); 
      }else{
          $arr_data['meal_type_id'] = ''; 
      }

      $address1_meal_data = $request->input('address1_meal', null); 
      if($address1_meal_data)
      {
          $address1_meal = "";
          foreach ($address1_meal_data as $value)
          {
                 $address1_meal .= $value . ",";
          }
          $arr_data['address1_meal'] = substr($address1_meal,0,-1); 
      }else{
          $arr_data['address1_meal'] = ''; 
      }

      $address2_meal_data = $request->input('address2_meal', null); 
      if($address2_meal_data)
      {
          $address2_meal = "";
          foreach ($address2_meal_data as $value)
          {
                 $address2_meal .= $value . ",";
          }
          $arr_data['address2_meal'] = substr($address2_meal,0,-1); 
      }else{
          $arr_data['address2_meal'] = ''; 
      }
      
      $status = SubscribeNowDetails::where('id',$enc_id)->update($arr_data);      
      if($status)
      {
        Session::flash('success', 'Record updated successfully.');
        return redirect(url()->previous());
      }

      Session::flash('error', 'Something went wrong.');
      return redirect('/admin/index');
    }   

    public function invoice(Request $request,$enc_id)
    {

      $user = \Sentinel::check();
      $data['session_user']  = Session::get('user');
      //->join('subscribe_discount','subscribe_discount.subscribe_discount_id','=','subscribe_now_plan_duration.subscribe_discount_id')

      if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('subscribe_now_details')->where('id',$enc_id)->get();

        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data']      = $arr_data;


        $physical_activity_id = '';
        
        foreach($arr_data as $row){
          $physical_activity_id = $row->physical_activity_id;
          $subscribe_now_plan_duration_id = $row->subscribe_now_plan_duration_id;
          $subscribe_now_plan_id = $row->subscribe_now_plan_id;
          $subscribe_now_user_id = $row->subscribe_now_user_id;
        }
        
        /*User Data Start*/
        $subscribe_now_user = [];
        $subscribe_now_user_value     = \DB::table('subscribe_now_user')->where('id',$subscribe_now_user_id)
                        ->get();
        if(!empty($subscribe_now_user_value))
        {
            $subscribe_now_user = $subscribe_now_user_value->toArray();
        }
        $data['subscribe_now_user'] = $subscribe_now_user;
        /*User Data End*/
        //print_r($data['subscribe_now_user']); die;

        /*Physical Activity Data Start*/
        $physical_activity_data = [];
        $physical_activity_value     = \DB::table('physical_activity')
                        //->where('physical_activity_id',$physical_activity_id)
                        ->get();
        if(!empty($physical_activity_value))
        {
            $physical_activity_data = $physical_activity_value->toArray();
        }
        $data['physical_activity_data'] = $physical_activity_data;
        /*Physical Activity Data End*/

        /*Avoid / Deslike Data Start*/
        $food_avoid_data = [];
        $food_avoid_value  = \DB::table('food_avoid')->get();
        if(!empty($food_avoid_value))
        {
            $food_avoid_data = $food_avoid_value->toArray();
        }
        $data['food_avoid_data']      = $food_avoid_data;
        /*Avoid / Deslike Data Start*/

        /*Meal Type Data Start*/
        $meal_type_data = [];
        $meal_type_value  = \DB::table('meal_type')->get();
        if(!empty($meal_type_value))
        {
            $meal_type_data = $meal_type_value->toArray();
        }
        $data['meal_type_data_arr'] = $meal_type_data;
        /*Meal Type Data End*/
        
        /*Subscribe Now Data Start*/
        $subscribe_now_data = [];
        $subscribe_now_value  = \DB::table('subscribe_now_plan_duration')->where('subscribe_now_plan_duration_id',$subscribe_now_plan_duration_id)->get();

        if(!empty($subscribe_now_value))
        {
            $subscribe_now_data = $subscribe_now_value->toArray();
        }
        $data['subscribe_now_data_arr'] = $subscribe_now_data;
        /*Subscribe Now Data End*/

        /*Subscribe Now Plan Data Start*/
        $subscribe_now_plan_data = [];
        $ssubscribe_now_plan_value  = \DB::table('subscribe_now_plan')->where('subscribe_now_plan_id',$subscribe_now_plan_id)->get();

        if(!empty($ssubscribe_now_plan_value))
        {
            $subscribe_now_plan_data = $ssubscribe_now_plan_value->toArray();
        }
        $data['subscribe_now_plan_data_arr'] = $subscribe_now_plan_data;
        /*Subscribe Now Plan Data End*/

      return view($this->module_view_folder.'.invoice',$data)->with('no', 1);
       }else{
           return view('admin/auth/login');
        }
    }

    public function SubscribeNowPlanDurationData(Request $request,$enc_id){
        $duration_data = [];
        $duration_value = \DB::table('subscribe_now_plan_duration')->join('subscribe_discount','subscribe_discount.subscribe_discount_id','=','subscribe_now_plan_duration.subscribe_discount_id')->where('subscribe_now_plan_duration_id',$enc_id)->get();
        if($duration_value)
        {
            $duration_data = $duration_value->toArray();
        }
        $data['duration_data'] = $duration_data;
        //print_r($duration_data); die;
        echo json_encode($data);
    }

    public function view_coupon_code(Request $request)
    {
        $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){

        $arr_data = [];
        $value     = \DB::table('coupon_code')
                        ->where('is_deleted','No')
                        ->orderBy('coupon_code_id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data']      = $arr_data;
        
        /*For Modal*/
        $editarr_data = [];
        $value     = \DB::table('coupon_code')->get();
        if(!empty($value))
        {
            $editarr_data = $value->toArray();
        }
        $data['editarr_data']      = $editarr_data;

        return view($this->module_view_folder.'.view-coupon-code',$data);
      }else{
          Session::flash('error', 'Something went wrong.');
          return view('admin/auth/login');
      }
    }

  public function store_coupon_code(Request $request)
  {
    
    $arr_rules['_token']        = "required";

    $validator = validator::make($request->all(),$arr_rules);

    if($validator->fails()) 
    {
      return redirect()->back()->withErrors($validator)->withInput();
    }

    $arr_data['coupon_code']       = $request->input('coupon_code', null);
    $arr_data['extension_days'] = $request->input('extension_days', null);

    $coupon_data = CouponcodeModel::where('coupon_code',$request->input('coupon_code', null))->update($arr_data);
    
    if($coupon_data){
      Session::flash('duplicate_entry', 'Coupon code already exits!'); 
      return redirect($this->module_view_folder.'/view-coupon-code');
    }else{
      $status = $this->CouponcodeModel->create($arr_data);
      if($status)
      {
        Session::flash('success', 'Record added successfully.');
        return redirect($this->module_view_folder.'/view-coupon-code');
      }
    }
    Session::flash('error', 'Something went wrong.');
    return redirect('/admin/index');
  }

  public function update_coupon_code(Request $request,$enc_id)
  {
    $arr_rules['_token']        = "required";

    $validator = validator::make($request->all(),$arr_rules);

    if($validator->fails()) 
    {
      return redirect()->back()->withErrors($validator)->withInput();
    }

    $arr_data['coupon_code']       = $request->input('coupon_code', null);  
    $arr_data['extension_days'] = $request->input('extension_days', null);

    $coupon_data = CouponcodeModel::where('coupon_code',$request->input('coupon_code', null))->update($arr_data);

    if($coupon_data){
      Session::flash('duplicate_entry', 'Coupon code already exits!'); 
      return redirect($this->module_view_folder.'/view-coupon-code');
    }else{
      $status = CouponcodeModel::where('coupon_code_id',base64_decode($enc_id))->update($arr_data);
      if($status)
      {
        Session::flash('success', 'Record updated successfully.');
        return redirect($this->module_view_folder.'/view-coupon-code');
      }
    }

    Session::flash('error', 'Something went wrong.');
    return redirect('/admin/index');
  }
  public function coupon_code_delete(Request $request,$enc_id)
  {
    $arr_data['is_deleted']  = 'Yes';

    $exists_coupon_code = \DB::table('subscribe_now_details')->where('coupon_code_id',base64_decode($enc_id))->get();

    if(!empty($exists_coupon_code))
    {
        $exists_coupon = $exists_coupon_code->toArray();
    }
    
    if($exists_coupon)
    {
      Session::flash('error', 'Coupon code can not be delete as it is used in susbcription plan.');
      return redirect($this->module_view_folder.'/view-coupon-code');
    }else{
      $status = CouponcodeModel::where('coupon_code_id',base64_decode($enc_id))->update($arr_data);
      if($status)
      {
        Session::flash('success', 'Record deleted successfully.');
        return redirect($this->module_view_folder.'/view-coupon-code');
      } 
    }
    Session::flash('error', 'Something went wrong.');
    return redirect('/admin/index');
  }

  public function coupon_code_active(Request $request,$enc_id)
  {

    $arr_rules['_token']        = "required";

    $validator = validator::make($request->all(),$arr_rules);

    if($validator->fails()) 
    {
      return redirect()->back()->withErrors($validator)->withInput();
    }

    $arr_data['status'] = 'Active';
    
    $status = CouponcodeModel::where('coupon_code_id',base64_decode($enc_id))->update($arr_data);

    if($status)
    {
      Session::flash('success', 'Record added successfully.');
      return redirect($this->module_view_folder.'/view-coupon-code');
    }

    Session::flash('error', 'Something went wrong.');
    return redirect('/admin/index');
  }

   public function coupon_code_inactive(Request $request,$enc_id)
  {
  
    $arr_rules['_token']        = "required";

    $validator = validator::make($request->all(),$arr_rules);

    if($validator->fails()) 
    {
      return redirect()->back()->withErrors($validator)->withInput();
    }

    $arr_data['status'] = 'Inactive';
    $exists_coupon_code = \DB::table('subscribe_now_details')->where('coupon_code_id',base64_decode($enc_id))->get();

    if(!empty($exists_coupon_code))
    {
        $exists_coupon = $exists_coupon_code->toArray();
    }

    if($exists_coupon){
      Session::flash('error', 'Coupon code can not be delete as it is used in susbcription plan.');
      return redirect($this->module_view_folder.'/view-coupon-code');
    }else{
      $status = CouponcodeModel::where('coupon_code_id',base64_decode($enc_id))->update($arr_data);

      if($status)
      {
        Session::flash('success', 'Record added successfully.');
        return redirect($this->module_view_folder.'/view-coupon-code');
      }
    }
    
    Session::flash('error', 'Something went wrong.');
    return redirect('/admin/index');
  }

   
}