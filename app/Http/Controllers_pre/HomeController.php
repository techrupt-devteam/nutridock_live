<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\NewsletterModel;
use App\Models\NotifymeModel;
use App\Models\BlogModel;

use Session;
use Sentinel;
use Validator;

class HomeController extends Controller
{
    public function __construct()
    {
       $this->NewsletterModel = new NewsletterModel();
       $this->NotifymeModel = new NotifymeModel();
       $this->BlogModel = new BlogModel();
    }
    
    public function landing()
    {
        
        return view('landing');
    }
    
    public function index()
    {
        $obj_data = $this->BlogModel->get();
        if($obj_data)
        {
            $arr_data = $obj_data->toArray();
        }   
        $data['arr_data'] = $arr_data;

        return view('index',$data);
    }

    public function store(Request $request)
    {
        $arr_rules      = $arr_data = array();

        $arr_rules['_token']                = "required";

        $validator = validator::make($request->all(),$arr_rules);

        if($validator->fails()) 
        {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $arr_data['email']  =  $request->input('email', null); 
        $obj_data = $this->NewsletterModel->where('email', $arr_data['email'])->first();

        if($obj_data){
            Session::flash('newsletter_exit_email', 'This email id already exits');
            return redirect('index');
        }else{
            $data['status'] = $this->NewsletterModel->create($arr_data);    
        }
        
        Session::flash('newsletter_success', 'Thank you for your subscription');
        return redirect('index');
    }


}
