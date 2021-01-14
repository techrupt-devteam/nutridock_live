<?php

namespace App\Http\Controllers;
use App\Models\CommentModel;
use Illuminate\Http\Request;

use Session;
use Sentinel;
use Validator;
Use Redirect;



class CommentController extends Controller
{
    public function __construct()
    {
       $this->CommentModel = new CommentModel();
    }
    
    
    public function store(Request $request)
    {
        $arr_rules      = $arr_data = array();

        $arr_rules['_token']                = "required";
        $arr_rules['name']                 = "required";

        $validator = validator::make($request->all(),$arr_rules);

        if($validator->fails()) 
        {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $arr_data['name']              =   $request->input('name', null); 
        $arr_data['blog_id']              =   $request->input('blog_id', null);
        $arr_data['email']        =   $request->input('email', null); 
        $arr_data['website']              =   $request->input('website', null); 
        $arr_data['message']              =   $request->input('message', null); 
        


        
        $data['status'] = $this->CommentModel->create($arr_data);
        $id = $data['status']->id;

        Session::flash('comment_success', 'Your message send successfully');
        return Redirect::back();
        
       /* if(  $data['status']){
            Session::flash('comment_success', 'Your message send successfully');
            return Redirect::back();
        }
        return redirect('index');*/
    }

}
