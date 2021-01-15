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


use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class SubscribeNowController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
		$this->SubscribeNow = new SubscribeNow();
	}

    public function index(Request $request)
    {	
    	$user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('subscribe_now')
                        ->where('is_deleted','No')
                        ->orderBy('id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }

        $data['arr_data']      = $arr_data;

        /*For Modal*/
        $editarr_data = [];
        $value     = \DB::table('subscribe_now')
                        ->get();
        if(!empty($value))
        {
            $editarr_data = $value->toArray();
        }
        $data['editarr_data']      = $editarr_data;
        //print_r($data['editarr_data']); die;

        $data['page_name'] = "Subscribe Now List";
        //$data['title']     = $this->title;
        return view($this->module_view_folder.'.view-subscribe-now',$data)->with('no', 1);

        }else{
           return view('admin/auth/login');
        }
    }

    public function view(Request $request,$enc_id)
    { 

      $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('subscribe_now')
                        ->where('id',$enc_id)
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }
        $data['arr_data']      = $arr_data;
        $physical_activity_id = '';
        
        foreach($arr_data as $row){
          $physical_activity_id = $row->physical_activity_id;
        
        }

        /*Physical Activity Data Start*/
        $physical_activity_data = [];
        $physical_activity_value     = \DB::table('physical_activity')
                        //->where('physical_activity_id',$physical_activity_id)
                        ->get();
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
        $status = SubscribeNow::where('id',base64_decode($enc_id))->update($arr_data);
        //return view($this->module_view_folder.'.view-subscribe-now',$data)->with('no', 1);
        if($status){
          return redirect($this->module_view_folder.'/view-subscribe-now');
        }
        Session::flash('error', 'Something went wrong.');
        return view('admin/auth/login');
    }

    public function approve_status(Request $request,$enc_id)
    {   
        $blog_id = $request->input('blog_id', null);

        $arr_data['approve_status'] = 'Approve';

        $status = SubscribeNow::where('id',$enc_id)->update($arr_data);

        if($status)
        {
          Session::flash('success', 'Subscriber approve successfully.');
          return redirect($this->module_view_folder.'/view-subscribe-now');
        }

        Session::flash('error', 'Something went wrong.');
        return view('admin/auth/login');
    }

    public function disapprove_status(Request $request,$enc_id)
    {
      $arr_data['approve_status'] = 'Disapprove';

      $status = SubscribeNow::where('id',$enc_id)->update($arr_data);

      if($status)
      {
        Session::flash('success', 'Subscriber disapprove successfully.');
        return redirect($this->module_view_folder.'/view-subscribe-now');
      }

      Session::flash('error', 'Something went wrong.');
      return redirect('/admin/index');
      
    }

    function export(){
      $arr_data = [];
      $value     = \DB::table('subscribe_now')->orderBy('id','DESC')->get();
      if(!empty($value))
      {
          $arr_data = $value->toArray();
      }
      $data['arr_data']      = $arr_data;

      $physical_activity_id = '';
        
      foreach($arr_data as $row){
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

      return view($this->module_view_folder.'.subscribe-now-export',$data)->with('no', 1);
    }

    function export_subscriber($enc_id){
      $arr_data = [];
      $value     = \DB::table('subscribe_now')->where('id',$enc_id)->get();
      if(!empty($value))
      {
          $arr_data = $value->toArray();
      }
      $data['arr_data']      = $arr_data;
      //print_r($data['arr_data']); die;
      return view($this->module_view_folder.'.subscribe-now-export-subscriber',$data)->with('no', 1);
    }

    public function delete(Request $request,$enc_id)
    {
      //print_r($enc_id); die;
      $arr_data['is_deleted']       = 'Yes';
      // $status = $this->SubscriptionModel->where('id',base64_decode($enc_id))->delete();
      //SubscribeNow::where('id',$enc_id)->update($arr_data);
      $status = SubscribeNow::where('id',$enc_id)->update($arr_data);
      if($status)
      {
        Session::flash('success', 'Record deleted successfully.');
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
      /*$arr_rules['address1']      = "required";*/

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
      $arr_data['price']   = $request->input('price', null);
      $arr_data['total']   = $request->input('total', null);  
      $arr_data['discount']   = $request->input('discount', null);  
      $arr_data['payment_status']   = $request->input('payment_status', null);

      $avoid_or_dislike_food_value = $request->input('avoid_or_dislike_food_id'); 

      
      // if($avoid_or_dislike_food){
      //     $avoid_or_dislike_food_value = implode(',',$avoid_or_dislike_food);    
      // }else{
      //     $avoid_or_dislike_food_value = '';
      // }  
      $arr_data['avoid_or_dislike_food_id'] = $avoid_or_dislike_food_value;
      $arr_data['other_food'] = $request->input('other_food'); 

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
          //print_r($arr_data['address1_meal']); die;
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

      
      $status = SubscribeNow::where('id',$enc_id)->update($arr_data);      
      if($status)
      {
        Session::flash('success', 'Record updated successfully.');
        return redirect($this->module_view_folder.'/view-subscribe-now');
      }

      Session::flash('error', 'Something went wrong.');
      return redirect('/admin/index');
    }   

    public function invoice(Request $request,$enc_id)
    {
      $user = \Sentinel::check();
      $data['session_user']  = Session::get('user');

      if($data['session_user']){
      
      $arr_data = [];
        $value     = \DB::table('subscribe_now')
                        ->where('id',$enc_id)
                        ->get();
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
        }
        //print_r($subscribe_now_plan_duration_id); die;
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
        //$value = request()->segment(2);
        //print_r($enc_id); die;

        $duration_data = [];
        $duration_value     = \DB::table('subscribe_now_plan_duration')
                        ->where('subscribe_now_plan_duration_id',$enc_id)
                         //->where('subscribe_now_plan_duration_id',$value)
                        ->get();
        if($duration_value)
        {
            $duration_data = $duration_value->toArray();
        }
        $data['duration_data'] = $duration_data;
        //print_r($duration_data); die;
        echo json_encode($data);
    }

   
}