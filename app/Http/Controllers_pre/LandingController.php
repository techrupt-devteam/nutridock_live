<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Models\SurveyModel;
use App\Models\SubscriptionModel;
use App\Models\WebinarModel;

use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

use Sentinel;
use Session;
//use Cookie;
use DB;
use Validator;

class LandingController extends Controller
{
	function __construct()
	{  	
		$this->arr_view_data                = [];
		$this->module_title                 = "Product";
		$this->module_view_folder           = "admin";
		$this->product_image_base_path      = base_path().'/uploads/images/';
		$this->product_image_public_path 	= url('/').config('app.project.img_path.images');
	
		$this->SurveyModel					= new SurveyModel();
		$this->SubscriptionModel			= new SubscriptionModel();
		$this->WebinarModel			= new WebinarModel();
		
	}

    public function store_survey(Request $request)
	{
	    
		$arr_rules      = $arr_data = array();
		

		$arr_rules['_token']				= "required";
		$arr_rules['download_app']      	   		= "required";
		//$arr_rules['blog_description']      	   	= "required";

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		
		
	    
        $refrains = $request->input('refrains');
        $comments = $request->input('comments');
        if($refrains){
        	$arr_data['download_app']	=	$request->input('download_app', null);	
    		$arr_data['comments']		=	'';
    		$arr_data['refrains']		=	$request->input('refrains');
        }else{
            $arr_data['download_app']	=	$request->input('download_app', null);	
    		$arr_data['comments']		=	$request->input('comments');
    		$arr_data['refrains'] =	'';
        }
	
		
		$status = $this->SurveyModel->create($arr_data);
		if($status)
		{
			Session::flash('success', 'Thank you for your feedback.');
			
			//return redirect('/landing');
			return redirect()->back();
		}
		//Session::flash('error', 'Something went wrong.');
		return redirect('/landing');
	}

	

	public function store_subscription(Request $request)
	{
	    
		$arr_rules      = $arr_data = array();
		$status         = false;

		$arr_rules['_token']	= "required";
		$arr_rules['email']     = "required";
		//$arr_rules['blog_description']      	   	= "required";

		$validator = validator::make($request->all(),$arr_rules);

		if($validator->fails()) 
		{
			return redirect()->back()->withErrors($validator)->withInput();
		}
		//$name = $request->input('name', null);

		$arr_data['email']	=	$request->input('email', null);	
			
		
		$status = $this->SubscriptionModel->create($arr_data);
		if($status)
		{
			$to = $status->email;
			
			//$to = "webdeveloper@techrupt.in";
            $subject = 'Nutridock';
            $headers = "From: admin@nutridock.com\r\n";//
            $headers .= "Reply-To: admin@nutridock.com\r\n";
            $headers .= "BCC: marketing@nutridock.com\r\n";
            $headers .= "BCC: it@sevagroup.co.in\r\n";
            $headers .= "BCC: urvashitikmani1310@gmail.com\r\n";
            $headers .= "BCC: geoshinsam@gmail.com\r\n";
            
            /*$headers = "From: webdeveloper@techrupt.in\r\n";//
            $headers .= "Reply-To: webdeveloper@techrupt.in\r\n";
            $headers .= "CC: laxmipagare99@gmail.com\r\n";*/
            
           /* $headers .= "BCC: marketing@nutridock.com\r\n";
            $headers .= "BCC: it@sevagroup.co.in\r\n";
            $headers .= "BCC: urvashitikmani1310@gmail.com\r\n";
            $headers .= "BCC: geoshinsam@gmail.com\r\n";*/
            
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
                
				Session::flash('subscription_success', 'Subscribed successfully.');
				return redirect()->back();
			
		}
		//Session::flash('error', 'Something went wrong.');
		return redirect('/landing');
	}
	
	
	public function user_register(Request $request)
	{
	     echo"1"; die;
	}
	
	
}