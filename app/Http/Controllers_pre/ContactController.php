<?php

namespace App\Http\Controllers;
use App\Models\ContactModel;
use Illuminate\Http\Request;
use App\Models\BlogModel;

use Session;
use Sentinel;
use Validator;



class ContactController extends Controller
{
    public function __construct()
    {
       $this->ContactModel = new ContactModel();
       $this->BlogModel    = new BlogModel();
    }
    
    public function index()
    {
        $obj_data = $this->BlogModel->get();

        if($obj_data)
        {
            $arr_data = $obj_data->toArray();
        }
        $data['arr_data']      = $arr_data;

        return view('contact',$data);
    }


    public function store(Request $request)
    {

        $arr_rules      = $arr_data = array();
        //$status         = false;

        $arr_rules['_token']                = "required";
        $arr_rules['name']                 = "required";

        $validator = validator::make($request->all(),$arr_rules);

        if($validator->fails()) 
        {
            return redirect()->back()->withErrors($validator)->withInput();
        }
        
        $arr_data['name']              =   $request->input('name', null); 
        $arr_data['email']        =   $request->input('email', null); 
        $arr_data['subject']              =   $request->input('subject', null); 
        $arr_data['message']              =   $request->input('message', null); 
        
       // print_r($arr_data); die;
        
        $data['status'] = $this->ContactModel->create($arr_data);
        $id = $data['status']->id;
        //print_r($data['status']->id); die;
        //return view('/payment',$data);
        
        Session::flash('contact_success', 'Your message send successfully');
        //return redirect($this->module_view_folder.'/webinar_list');
        return redirect('contact');
    }

}
