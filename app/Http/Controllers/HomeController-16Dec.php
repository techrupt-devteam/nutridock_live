<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\NewsletterModel;
use App\Models\NotifymeModel;
use App\Models\BlogModel;
use App\Models\SliderModel;
use App\Models\OurHealthyFarmModel;
use App\Models\WhyusModel;
use App\Models\TestimonialsModel;
use App\Models\SubscriptionModel;
use App\Models\MenuModel;
use App\Models\MenuCategoryModel;
use App\Models\SpecificationMenuModel;
use Illuminate\Support\Arr;

use Session;
use Sentinel;
use Validator;
use DB;

class HomeController extends Controller
{
    
    public function __construct()
    {
       $this->NewsletterModel = new NewsletterModel();
       $this->NotifymeModel = new NotifymeModel();
       $this->BlogModel = new BlogModel();
       $this->SliderModel = new SliderModel();
       $this->OurHealthyFarmModel = new OurHealthyFarmModel();
       $this->WhyusModel = new WhyusModel();
       $this->TestimonialsModel = new TestimonialsModel();
       $this->SubscriptionModel = new SubscriptionModel();
       $this->MenuModel         = new MenuModel();
       $this->MenuCategoryModel = new MenuCategoryModel();
       $this->SpecificationMenuModel               = new SpecificationMenuModel();
    }


    /*public function landing()
    {
        return view('landing');
    }
*/

    public function index()
    {
        $data['seo_title'] = "Home";
        $obj_data = $this->SliderModel->get();
        if($obj_data)
        {
            $arr_data = $obj_data->toArray();
        }   
        $data['arr_data'] = $arr_data;

        $single_data = $this->SliderModel->first();
        
        if($single_data)
        {
            $single_arr_data = $single_data->toArray();
        }   
        $data['single_data'] = $single_arr_data;
        
        $healthyfarm_data = $this->OurHealthyFarmModel->get();
        if($healthyfarm_data)
        {
            $healthyfarm_array = $healthyfarm_data->toArray();
        }   
        $data['healthyfarm_arr'] = $healthyfarm_array;
        
        $result1 = \DB::select("SELECT * FROM why_us group by id having mod(id,2) = 1");
        
        $data['whyus_arr1'] = $result1;

        $result2 = \DB::select("SELECT * FROM why_us group by id having mod(id,2) = 0");
        $data['whyus_arr2'] = $result2;

        $whyus_data = \DB::select("SELECT * FROM why_us order by id asc");
        $data['whyus_arr'] = $whyus_data;
        
        $testimonials_data = $this->TestimonialsModel->get();
        if($testimonials_data)
        {
            $testimonials_array = $testimonials_data->toArray();
        }   
        $data['testimonials_arr'] = $testimonials_array;

        /*Menu*/       
        $arr_data = [];
        $obj_data = $this->MenuModel->orderBy('id','ASC')->get();
       
        if($obj_data)
        {
            $arr_data = $obj_data->toArray();
        }
        $data['menu_data']      = $arr_data;

        /*Category*/
        $cate_data = [];
        $sqlQuery = "SELECT * FROM menu_categories JOIN menu ON menu.menu_category_id=menu_categories.id group by menu_categories.name";
        $data['cate_data'] = \DB::select(DB::raw($sqlQuery));

        //print_r($data['cate_data']); die;
        
        /*Recent Data*/
        $recent_data = [];
        $recent_value     = \DB::table('blog')
                        ->orderby('id','DESC')
                        ->limit(3)
                        ->get();
        if($recent_value)
        {
            $recent_data = $recent_value->toArray();
        }
        $data['recent_data']  = $recent_data;
       

        return view('index',$data)->with('no', 1);
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
        $obj_data = $this->NotifymeModel->where('email', $arr_data['email'])->first();

        if($obj_data){
            Session::flash('newsletter_exit_email', 'This email id already exits');
            return redirect('index');
        }else{
            $data['status'] = $this->NewsletterModel->create($arr_data);    
        }
        
        
        
        Session::flash('newsletter_success', 'Thank you for your subscription');
        return redirect('index');
    }
    
    public function subscription(Request $request)
    {
        
        $arr_rules      = $arr_data = array();
        $status         = false;

        $arr_rules['_token']    = "required";
        $arr_rules['email']     = "required";

        $validator = validator::make($request->all(),$arr_rules);

        if($validator->fails()) 
        {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $arr_data['email']  =   $request->input('email', null); 
        $arr_data['name']  =   $request->input('name', ''); 
        
        $obj_data = $this->SubscriptionModel->where('email', $arr_data['email'])->first();
        if($obj_data=='')
        {
        $status = $this->SubscriptionModel->create($arr_data);
        $to = $request->input('email', null); 
            
        $subject = 'Your Nutrition Guide is inside!';
        $headers = "From: admin@nutridock.com\r\n";//
        /*$headers .= "Reply-To: admin@nutridock.com\r\n";*/
        $headers .= "CC: info.nutridock@gmail.com\r\n";
        /*$headers .= "BCC: marketing@nutridock.com\r\n";*/
        $headers .= "BCC: it@sevagroup.co.in\r\n";
        
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
          
        We’re so excited to share the guide for <a href="https://nutridock.com/nutridock_restaurant/public/pdf/Nutridock Guide.pdf">Creating Healthy Eating Habits </a> with you! <br><br>

        Welcome to Nutridock. We’ve started with a passion to help people adopt a healthy lifestyle.<br><br>

        Creating healthy eating habits is one of the most important skills you can give yourself for your overall wellbeing — especially if you want to feel your best in your daily life.<br><br>

        But creating healthy eating habits that work for you 365 days a year can be challenging.<br><br>

        Our philosophy is based on eating an abundance of whole foods that keep you satiated, supports digestion, keeps your focus sharp, and energy stabilized.<br><br>

        It also includes practicing mindful eating that can help you tune into your body and create a more positive experience with food. <br><br>

        And most importantly, we believe in giving you the skills you need in order to put those two things into practice in your daily life to make healthy eating easy and enjoyable. <br><br>

        After you finish reading this guide, you’ll have a few steps you can practice to make your daily food choices a little easier, more mindful and more enjoyable. <br><br>

        <b><a href="https://nutridock.com/nutridock_restaurant/public/landing/pdf/Nutridock Guide.pdf">Here’s the link to access the guide!</a></b><br>
        Excited to be a part of your wellness journey! <br>
        <br>
        Team Nutridock.<br>

        <a href="https://nutridock.com/nutridock_restaurant/public/pdf/Nutridock Guide.pdf">Nutridock Guide</a>   
              </body>
            </html>';
                mail($to, $subject, $message, $headers);
                return redirect('/thank-you');
    }else{
        $to = $request->input('email', null); 
            
        $subject = 'Your Nutrition Guide is inside!';
        $headers = "From: admin@nutridock.com\r\n";
        /*$headers .= "Reply-To: admin@nutridock.com\r\n";*/
        $headers .= "CC: info.nutridock@gmail.com\r\n";
        //$headers .= "BCC: marketing@nutridock.com\r\n";
        $headers .= "BCC: it@sevagroup.co.in\r\n";
        
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
          
        We’re so excited to share the guide for <a href="https://nutridock.com/public/pdf/Nutridock Guide.pdf">Creating Healthy Eating Habits </a> with you! <br><br>

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

        <a href="https://nutridock.com/public/pdf/Nutridock Guide.pdf">Nutridock Guide</a>   
              </body>
            </html>';
                mail($to, $subject, $message, $headers);
                return redirect('/thank-you');
    }
    
    
    
    }

    public function loadModal($id)
    {
        $getData = \DB::table('menu')
                    ->where('id',$id)
                    ->first();

        $title = $getData->menu_title;
        $description = $getData->menu_description;
        $menu_main_img = url('/').'/uploads/images/'.$getData->image;

        $getSpecificationData = \DB::table('menu_specification')
                                ->leftJoin('specification', 'menu_specification.specification_id', '=', 'specification.id')
                                ->select('menu_specification.icon_image','specification.name')
                                ->where('menu_specification.menu_id',$id)
                                ->where('menu_specification.status','Active')
                                ->where('menu_specification.is_deleted','No')
                                ->get();

        $getIngredientsData =   \DB::table('ingredients')
                                ->select('name','image')
                                ->where('menu_id',$id)
                                ->where('status','Active')
                                ->where('is_deleted','No')
                                ->orderby('id','ASC')->get();       


        $getWhatsInside =   \DB::table('whats_inside')
                            ->select('title','unit')
                            ->where('menu_id',$id)
                            ->orderby('id','ASC')->get();       

       
        $htmlData = '<div class="modal-header">
        <h3 class="modal-title">'.$title.'<br>
        <small style="font-size:14px;display:block">'.$description.'</small>
        </h3>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body"  style="background-color:#f7f7f7">
            <ul class="list-inline mb-0" data-test="tags">';
            foreach($getSpecificationData as $getSpecificationData_val)
            {
                $htmlData .= '<li class="list-inline-item mr-1 mb-1"><span class="badge-list-item">'.$getSpecificationData_val->name.'</span></li>';
            }                
            $htmlData .= '</ul>';

            $htmlData .= '<div class="MealModal-module">
            <article class="meals-overlay">
                <div class="row">
                    <div class="col-md-5">
                        <div class="position-relative">
                            <img class="mb-3 w-100" src="'.$menu_main_img.'">
                        </div>
                    </div>
                    <div class="col-md-7">
                        <section class="title-wrap" style="padding:11px">
                            <div class="heading-title-">
                            <h2 class="pl-1">What makes this dish special</h2>
                            <p>'.stripslashes($getData->what_makes_dish_special).'</p>
                            </div>
                        </section>
                        <section class="title-wrap">
                            <div class="px-3">
                                <div class="heading-title-">
                                    <h2 class="pl-1">Ingredients</h2>
                                </div>
                                <div class="row m-0">';
                                foreach($getIngredientsData as $getIngredientsData_val)
                                {
                                    $htmlData .= '<div class="col-md-4 col-4 pl-1 pr-1">
                                        <figure class="text-center">
                                            <img class="Ingredients-img" alt="Chicken Breast" src="'.url('/').'/uploads/images/'.$getIngredientsData_val->image.'">
                                            <figcaption class="Ingredients-title">'.$getIngredientsData_val->name.'</figcaption>
                                        </figure>
                                    </div>';
                                }
                                    
                                $htmlData .= '</div>
                            </div>
                            </section>
                            <section class="title-wrap">
                            <div class="px-3">
                                <div class="heading-title-">
                                    <h2 class="pl-1">What’s inside</h2>
                                </div>
                                <div class="row">';
                                    foreach($getWhatsInside as $getWhatsInside_val)
                                    {
                                    $htmlData .= '<div class="col-md-6 col-6">
                                                    <div class="Featured-Nutridock-module">
                                                    <span class="Calories-name">'.$getWhatsInside_val->title.'</span>
                                                    <strong class="d-block">'.$getWhatsInside_val->unit.'</strong>
                                                    <hr>
                                                    </div>
                                                </div>';
                                    }
                                    
                                    $htmlData .='</div>
                            </div>
                        </section>
                    </div>
                </div>
            </article>
            </div>';

        $htmlData .= '</div>';




        //dd($menu_data);
        return($htmlData);
       // return view('index',['data'=>$id]);
    }

    
}
