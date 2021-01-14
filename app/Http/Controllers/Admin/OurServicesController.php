<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\OurServicesModel;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use \Illuminate\Support\Str;


use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class OurServicesController extends Controller
{
  function __construct()
  {   
    $this->arr_view_data                = [];
    $this->module_title                 = "Our Services";
    $this->module_view_folder           = "admin";
    $this->product_image_base_path      = base_path().'/uploads/images/';
    $this->product_image_public_path  = url('/').config('app.project.img_path.images');
    $this->OurServicesModel          = new OurServicesModel();
  }


    public function index(Request $request)
    { 

      $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');

        if($data['session_user']){
        $arr_data = [];
        $value     = \DB::table('our_services')
                        //->groupBy('email')
                        ->orderBy('id','DESC')
                        ->get();
        if(!empty($value))
        {
            $arr_data = $value->toArray();
        }

        $data['arr_data']      = $arr_data;

        $data['page_name'] = "Our Services List";
        //$data['title']     = $this->title;

        return view($this->module_view_folder.'.view-our-services',$data)->with('no', 1);

        }else{
           return view('admin/auth/login');
        }
    }

   public function create()
  {

    $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
        return view($this->module_view_folder.'.create-our-services',$data);
      }else{
            return view('admin/auth/login');
        }
  }

  public function store(Request $request)
  {
    $arr_rules      = $arr_data = array();
    $status         = false;

    $arr_rules['_token']    = "required";
    $arr_rules['title']  = "required";

    $validator = validator::make($request->all(),$arr_rules);

    if($validator->fails()) 
    {
      return redirect()->back()->withErrors($validator)->withInput();
    }

    $arr_data['title']  = $request->input('title', null); 
    $arr_data['description']  = $request->input('description', null); 
    $arr_data['title_description']  = $request->input('title_description', null);

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

    $status = $this->OurServicesModel->create($arr_data);
    if($status)
    {
      Session::flash('success', 'Record added successfully.');
      return redirect($this->module_view_folder.'/view-our-services');
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

    $obj_data = $this->OurServicesModel->where('id', base64_decode($enc_id))->first();
    
    if($obj_data)
    {
      $arr_data = $obj_data->toArray();
    }
    
    $data['arr_data'] = $arr_data;
    $data['enc_id']   = $enc_id;
    $data['product_image_public_path']   = $this->product_image_public_path;

    $user = \Sentinel::check();
        $data['session_user']  = Session::get('user');
        if($data['session_user']){
      return view($this->module_view_folder.'.edit-our-services',$data);
     }else{
            return view('admin/auth/login');
        }
  }

  public function update(Request $request,$enc_id)
  {
    $arr_rules      = $arr_data = array();
    $status         = false;

    $arr_rules['_token']        = "required";
    $arr_rules['title']             = "required";

    $validator = validator::make($request->all(),$arr_rules);

    if($validator->fails()) 
    {
      return redirect()->back()->withErrors($validator)->withInput();
    }
    $arr_data['title']  = $request->input('title', null); 
    $arr_data['description']  = $request->input('description', null); 
    $arr_data['title_description']  = $request->input('title_description', null); 
    
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

    $status = $this->OurServicesModel->where('id',base64_decode($enc_id))->update($arr_data);

    if($status)
    {
      Session::flash('success', 'Record updated successfully.');
      return redirect($this->module_view_folder.'/view-our-services');
    }
    Session::flash('error', 'Something went wrong.');
    return redirect('/admin/index');
  }


  public function delete(Request $request,$enc_id)
  {
    $arr_rules      = $arr_data = array();
    $status         = false;
    $status = $this->OurServicesModel->where('id',base64_decode($enc_id))->delete();

    if($status)
    {
      Session::flash('success', 'Record deleted successfully.');
        return redirect($this->module_view_folder.'/view-our-services');
    }

    Session::flash('error', 'Something went wrong.');
    return redirect('/admin/index');
  }

  

}