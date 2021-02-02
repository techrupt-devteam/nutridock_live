<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Auth::routes();
/*Route::get('/clear', function() {

   Artisan::call('cache:clear');
   Artisan::call('config:clear');
   Artisan::call('config:cache');
   Artisan::call('view:clear');

   return "Cleared!";

});*/
Route::get('/', 'HomeController@index')->name('index');

Route::get('dynamicModal/{id}',[
    'as'=>'dynamicModal',
    'uses'=> 'HomeController@loadModal'
]);

Route::get('dynamicMenuModal/{id}',[
    'as'=>'dynamicMenuModal',
    'uses'=> 'MenuController@loadModal'
]);

Route::post('/subscribe', 'HomeController@subscription');
Route::get('/mail_test', 'HomeController@mail_test')->name('mail_test');
Route::get('/about', 'AboutController@index')->name('about');
Route::get('/menu', 'MenuController@index')->name('menu');
Route::get('/page-not-found', 'PageNotFoundController@index')->name('page-not-found');

Route::get('/blog', 'BlogController@index')->name('blog');
/*Route::get('/blog_detail/{id}', 'BlogController@blog_detail')->name('blog_detail');*/
Route::get('/blog_detail/{any}', 'BlogController@blog_detail')->name('blog_detail');

Route::post('/comment/store_comment', 'CommentController@store')->name('store_comment');
Route::post('/comment/update_comment/{id}', 'CommentController@update')->name('update_comment');
Route::any('/comment/new_comment', 'CommentController@new_comment')->name('new_comment');

Route::get('/contact', 'ContactController@index')->name('contact');
Route::get('/subscribe-info', 'SubscribeinfoController@index')->name('subscribe-info');
Route::post('/contact-store', 'ContactController@store')->name('store');
Route::any('/mail', 'ContactController@sendMail')->name('sendMail');
Route::post('/newsletter_store', 'HomeController@store')->name('store');

Route::get('/faq', 'FaqController@index')->name('faq');
Route::get('/privacy_policy', 'PrivacyPolicyController@index')->name('privacy_policy');
Route::get('/terms_conditions', 'TermsConditionsController@index')->name('index');



/*Razorpay*/
Route::post('/page/payment','PaymentController@index');
Route::post('/capture_payment','PaymentController@capture_payment');
Route::get('success','PaymentController@success');
Route::get('failed','PaymentController@failed');

Route::post('/survey','LandingController@store_survey');
Route::post('/subscription','LandingController@store_subscription');

Route::any('/register','LandingRegisterController@user_register');
Route::post('/frontend/submitform/submitAddform', 'AjaxController@submitAddform');
Route::get('/thank-you', 'ThankYouController@index')->name('thank_you');

Route::get('/subscribe-now', 'SubscribeController@index')->name('index');
Route::get('getSubscribeNowPlanDuration/{id}', 'SubscribeController@SubscribeNowPlanDuration')->name('SubscribeNowPlanDuration');

Route::post('subscription_payment', 'SubscribeController@subscription_payment')->name('subscription_payment');
Route::get('subscription-success','SubscribeController@subscription_success');
Route::get('subscription-failed','SubscribeController@subscription_failed');
Route::any('search','SubscribeController@search');
Route::any('searchform','SubscribeController@searchform');

Route::get('/subscribe-now', 'SubscribeController@index')->name('index');

//Route::any('postDetails', 'SubscribeController@postDetails')->name('postDetails');
Route::any('postPersonalDetails', 'SubscribeController@postPersonalDetails')->name('postPersonalDetails');
Route::any('postFormDetails', 'SubscribeController@postFormDetails')->name('postFormDetails');
Route::any('getMealTypeDataAjax', 'SubscribeController@getMealTypeDataAjax')->name('getMealTypeDataAjax');
Route::get('subscription-payment/{any}', 'SubscribeController@subscription_payment1')->name('subscription_payment');

Route::get('getCouponCode', 'SubscribeController@getCouponCode')->name('getCouponCode');



Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
	$route_slug 	   = 'admin_';
	$module_controller = "Admin\SubscribeNowController@";
	
	Route::get('/view-subscribe-now-user',['as' => $route_slug.'view-subscribe-now-user','uses' => $module_controller.'index']);
	
	Route::any('/view-subscribe-now1/{value1}/{value2}',['as' => $route_slug.'view_subscribe_now1','uses' => $module_controller.'view_subscribe_now1']);

	Route::get('/view-subscribe-now-details/{id1}/{id2}',['as' => $route_slug.'view','uses' => $module_controller.'view']);

	Route::post('/subscribe-now/store_comment_link/{id}',['as' => $route_slug.'store_comment_link','uses' => $module_controller.'store_comment_link']);

	Route::post('/subscribe-now/approve_status/{id}',['as' => $route_slug.'approve_status','uses' => $module_controller.'approve_status']);

	Route::post('/subscribe-now/disapprove_status/{id}',['as' => $route_slug.'disapprove_status','uses' => $module_controller.'disapprove_status']);

	Route::get('/subscribe-now/export/',['as' => $route_slug.'export','uses' => $module_controller.'export']);

	Route::get('/subscribe-now/export_user/{id1}/{id2}/{id3}',['as' => $route_slug.'export_user','uses' => $module_controller.'export_user']);

	
	Route::get('/subscribe-now/export_subscriber/{id}',['as' => $route_slug.'export_subscriber','uses' => $module_controller.'export_subscriber']);

	Route::get('/subscribe-now/delete/{id}',['as' => $route_slug.'delete',	'uses' => $module_controller.'delete']);

	Route::get('/getSubscribeNowPlanDurationData/{id}',['as' => $route_slug.'SubscribeNowPlanDurationData','uses' => $module_controller.'SubscribeNowPlanDurationData']);
	
	Route::post('subscribe-now/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);

	Route::get('/invoice/{id}',['as' => $route_slug.'invoice','uses' => $module_controller.'invoice']);

	Route::get('/view-coupon-code',['as' => $route_slug.'view_coupon_code','uses' => $module_controller.'view_coupon_code']);

	Route::post('/store_coupon_code',['as' => $route_slug.'store_coupon_code','uses' => $module_controller.'store_coupon_code']);

	Route::get('/coupon_code_delete/{id}',['as' => $route_slug.'coupon_code_delete','uses' => $module_controller.'coupon_code_delete']);

	Route::post('/update_coupon_code/{id}',['as' => $route_slug.'update_coupon_code','uses' => $module_controller.'update_coupon_code']);

	Route::post('/coupon_code_active/{id}',['as' => $route_slug.'coupon_code_active','uses' => $module_controller.'coupon_code_active']);

	Route::post('/coupon_code_inactive/{id}',['as' => $route_slug.'coupon_code_inactive','uses' => $module_controller.'coupon_code_inactive']);
});

Route::group(array('prefix' => ''), function ()
{
	$route_slug 	   = 'admin';
	$module_controller = 'Admin\AuthController@';
	Route::get('/admin', ['as' => $route_slug,'uses' => $module_controller.'login']);
	Route::post('/validate_login', ['as' => $route_slug.'validate','uses' => $module_controller.'validate_login']);
	Route::any('/logout', 			 		 ['as' => $route_slug.'logout',	    				'uses' => $module_controller.'logout']);
	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\DashboardController@";
		Route::get('/index',['as' => $route_slug.'index','uses' => $module_controller.'index']);
	});


	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\WebinarController@";
		Route::get('/webinar_list',['as' => $route_slug.'webinar_list','uses' => $module_controller.'index']);
		Route::get('/webiner_excel',['as' => $route_slug.'webiner_excel','uses' => $module_controller.'export']);
		/*Route::get('/webinar-email/{id}',['as' => $route_slug.'webinar-email','uses' => $module_controller.'email']);*/

		Route::get('/webinar-email',['as' => $route_slug.'webinar-email','uses' => $module_controller.'email']);

		Route::post('/webinar/send_email',['as' => $route_slug.'send_email','uses' => $module_controller.'send_email']);

		Route::post('/webinar/send_email_pending',['as' => $route_slug.'send_email_pending','uses' => $module_controller.'send_email_pending']);

		Route::get('/webinar-view/{id}',['as' => $route_slug.'webinar-view','uses' => $module_controller.'view']);
		Route::get('/webinar/delete/{id}',['as' => $route_slug.'delete',			'uses' => $module_controller.'delete']);
		
	});

	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\SurveyController@";
		Route::get('/survey_list',['as' => $route_slug.'survey_list','uses' => $module_controller.'index']);
		
		Route::get('/view/{id}',['as' => $route_slug.'view','uses' => $module_controller.'view']);

		Route::get('/survey/delete/{id}',['as' => $route_slug.'delete',	'uses' => $module_controller.'delete']);
		Route::get('/survey_excel',['as' => $route_slug.'survey_excel','uses' => $module_controller.'export']);
	});

	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\SubscriptionController@";
		Route::get('/subscription-list',['as' => $route_slug.'subscription-list','uses' => $module_controller.'index']);
		
		Route::get('/subscription-view/{id}',['as' => $route_slug.'subscription-view','uses' => $module_controller.'view']);

		Route::get('/subscription/delete/{id}',['as' => $route_slug.'delete',	'uses' => $module_controller.'delete']);
        Route::get('/subscription/create/{id}',['as' => $route_slug.'create','uses' => $module_controller.'create']);
		
		
	    Route::any('/subscription/subscription_email_all',['as' => $route_slug.'subscription_email_all',	'uses' => $module_controller.'subscription_email_all']);

		Route::any('/subscription/email_all',['as' => $route_slug.'email_all',	'uses' => $module_controller.'email_all']);
		
		Route::any('/subscription/email/{id}',['as' => $route_slug.'email',	'uses' => $module_controller.'email']);

	});

	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\SliderController@";
		Route::get('/slider-list',['as' => $route_slug.'slider-list','uses' => $module_controller.'index']);
		Route::post('/slider/store',['as' => $route_slug.'slider','uses' => $module_controller.'store']);
		Route::get('slider/edit/{id}',['as' => $route_slug.'edit/{id}','uses' => $module_controller.'edit']);
		Route::get('/create-slider',['as' => $route_slug.'create-slider','uses' => $module_controller.'create']);
		Route::post('slider/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
		Route::get('/slider/delete/{id}',['as' => $route_slug.'delete',	'uses' => $module_controller.'delete']);
	});

	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\OurHealthyFarmController@";
		Route::get('/view-our-healthy-farm',['as' => $route_slug.'view-our-healthy-farm','uses' => $module_controller.'index']);
		Route::get('/create-healthy-farm',['as' => $route_slug.'create-healthy-farm','uses' => $module_controller.'create']);
		Route::post('/healthyfarm/store',['as' => $route_slug.'healthyfarm','uses' => $module_controller.'store']);
		Route::get('healthyfarm/edit/{id}',['as' => $route_slug.'edit/{id}','uses' => $module_controller.'edit']);
		Route::post('healthyfarm/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
		Route::get('/healthyfarm/delete/{id}',['as' => $route_slug.'delete',	'uses' => $module_controller.'delete']);
	});


	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\WhyusController@";
		Route::get('/view-why-us',['as' => $route_slug.'view-why-us','uses' => $module_controller.'index']);
		Route::get('/create-why-us',['as' => $route_slug.'create-why-us','uses' => $module_controller.'create']);
		Route::post('/whyus/store',['as' => $route_slug.'whyus','uses' => $module_controller.'store']);
		Route::get('/whyus/edit/{id}',['as' => $route_slug.'edit/{id}','uses' => $module_controller.'edit']);
		Route::post('whyus/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
		Route::get('/whyus/delete/{id}',['as' => $route_slug.'delete',	'uses' => $module_controller.'delete']);
	});
	
	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\TestimonialsController@";
		Route::get('/view-testimonials',['as' => $route_slug.'view-testimonials','uses' => $module_controller.'index']);
		Route::get('/create-testimonials',['as' => $route_slug.'create-testimonials','uses' => $module_controller.'create']);
		Route::post('/testimonials/store',['as' => $route_slug.'testimonials','uses' => $module_controller.'store']);
		Route::get('testimonials/edit/{id}',['as' => $route_slug.'edit/{id}','uses' => $module_controller.'edit']);
		Route::post('testimonials/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
		Route::get('/testimonials/delete/{id}',['as' => $route_slug.'delete',	'uses' => $module_controller.'delete']);
	});
	
	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\AboutusController@";
		Route::get('aboutus/view-about-us/{id}',['as' => $route_slug.'view-about-us/{id}','uses' => $module_controller.'index']);
		Route::post('aboutus/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
	});
	
	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\HowWeWorkController@";
		Route::get('/view-how-we-work',['as' => $route_slug.'view-how-we-work','uses' => $module_controller.'index']);
		Route::get('/create-how-we-work',['as' => $route_slug.'create-how-we-work','uses' => $module_controller.'create']);
		Route::post('/howwework/store',['as' => $route_slug.'howwework','uses' => $module_controller.'store']);
		Route::get('howwework/edit/{id}',['as' => $route_slug.'edit/{id}','uses' => $module_controller.'edit']);
		Route::post('howwework/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
		Route::get('/howwework/delete/{id}',['as' => $route_slug.'delete',	'uses' => $module_controller.'delete']);
	});
	
	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\OurServicesController@";
		Route::get('/view-our-services',['as' => $route_slug.'view-our-services','uses' => $module_controller.'index']);
		Route::get('/create-our-services',['as' => $route_slug.'create-our-services','uses' => $module_controller.'create']);
		Route::post('/ourservices/store',['as' => $route_slug.'ourservices','uses' => $module_controller.'store']);
		Route::get('ourservices/edit/{id}',['as' => $route_slug.'edit/{id}','uses' => $module_controller.'edit']);
		Route::post('ourservices/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
		Route::get('/ourservices/delete/{id}',['as' => $route_slug.'delete',	'uses' => $module_controller.'delete']);
	});
	
	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\OurChefsController@";
		Route::get('/view-our-chefs',['as' => $route_slug.'view-our-chefs','uses' => $module_controller.'index']);
		Route::get('/create-our-chefs',['as' => $route_slug.'create-our-chefs','uses' => $module_controller.'create']);
		Route::post('/ourchefs/store',['as' => $route_slug.'ourchefs','uses' => $module_controller.'store']);
		Route::get('ourchefs/edit/{id}',['as' => $route_slug.'edit/{id}','uses' => $module_controller.'edit']);
		Route::post('ourchefs/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
		Route::get('/ourchefs/delete/{id}',['as' => $route_slug.'delete',	'uses' => $module_controller.'delete']);
	});
    
    Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\CategoryController@";
		
		Route::get('/view-category-list',['as' => $route_slug.'view-category-list','uses' => $module_controller.'index']);
		Route::post('/category/category_store',['as' => $route_slug.'category_store','uses' => $module_controller.'category_store']);
		Route::post('/category/category_update/{id}',['as' => $route_slug.'category_update','uses' => $module_controller.'category_update']);
		Route::get('/category/category_delete/{id}',['as' => $route_slug.'category_delete','uses' => $module_controller.'category_delete']);
	});
	
	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\BlogController@";
		Route::get('/view-blog',['as' => $route_slug.'view-blog','uses' => $module_controller.'index']);
		Route::post('/blog/store',['as' => $route_slug.'blog','uses' => $module_controller.'store']);
		Route::get('/create-blog',['as' => $route_slug.'create-blog','uses' => $module_controller.'create']);
		Route::get('blog/edit/{id}',['as' => $route_slug.'edit/{id}','uses' => $module_controller.'edit']);
		Route::post('blog/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
		Route::get('/blog/delete/{id}',		['as' => $route_slug.'delete',			'uses' => $module_controller.'delete']);
		Route::get('blog/view-benefits/{id}',['as' => $route_slug.'view-benefits/{id}','uses' => $module_controller.'view_benefits']);
		Route::post('/blog/benefits_store',['as' => $route_slug.'benefits_store','uses' => $module_controller.'benefits_store']);
		Route::post('/blog/benefits_update/{id}',['as' => $route_slug.'benefits_update','uses' => $module_controller.'benefits_update']);
		Route::get('/blog/benefits_delete/{id}',['as' => $route_slug.'benefits_delete','uses' => $module_controller.'benefits_delete']);
		Route::get('/blog/view-comments/{id}',['as' => $route_slug.'view-comments/{id}','uses' => $module_controller.'view_comments']);
		Route::post('/blog/comment_update/{id}',['as' => $route_slug.'comment_update','uses' => $module_controller.'comment_update']);
		Route::get('/blog/comment_delete/{id}',['as' => $route_slug.'comment_delete','uses' => $module_controller.'comment_delete']);
		Route::post('/blog/approve_comments/{id}',['as' => $route_slug.'approve_comments','uses' => $module_controller.'approve_comments']);
		Route::post('/blog/disapprove_comments/{id}',['as' => $route_slug.'disapprove_comments','uses' => $module_controller.'disapprove_comments']);
	});
	
	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\MenuController@";
		Route::get('/view-menu',['as' => $route_slug.'view-menu','uses' => $module_controller.'index']);
		Route::get('/create-menu',['as' => $route_slug.'create-menu','uses' => $module_controller.'create']);
		Route::post('/menu/store',['as' => $route_slug.'menu','uses' => $module_controller.'store']);
		Route::get('menu/edit/{id}',['as' => $route_slug.'edit/{id}','uses' => $module_controller.'edit']);
		Route::post('menu/menu_update/{id}',['as' => $route_slug.'menu_update','uses' => $module_controller.'menu_update']);
		Route::get('/menu/delete/{id}',		['as' => $route_slug.'delete','uses' => $module_controller.'delete']);
	    Route::get('/menu/view-ingredients/{id}',['as' => $route_slug.'view-ingredients/{id}','uses' => $module_controller.'view_ingredients']);
		Route::post('/menu/ingredients_store',['as' => $route_slug.'ingredients_store','uses' => $module_controller.'ingredients_store']);
		Route::post('/menu/ingredients_update/{id}',['as' => $route_slug.'ingredients_update','uses' => $module_controller.'ingredients_update']);
		Route::get('/menu/ingredients_delete/{id}',['as' => $route_slug.'ingredients_delete','uses' => $module_controller.'ingredients_delete']);
	    Route::get('/menu/view-whatsinside/{id}',['as' => $route_slug.'view-whatsinside/{id}','uses' => $module_controller.'view_whatsinside']);
		Route::post('/menu/whatsinside_store',['as' => $route_slug.'whatsinside_store','uses' => $module_controller.'whatsinside_store']);
		Route::post('/menu/whatsinside_update/{id}',['as' => $route_slug.'whatsinside_update','uses' => $module_controller.'whatsinside_update']);
		Route::get('/menu/whatsinside_delete/{id}',['as' => $route_slug.'whatsinside_delete','uses' => $module_controller.'whatsinside_delete']);
		Route::get('/menu/view-specification/{id}',['as' => $route_slug.'view-specification/{id}','uses' => $module_controller.'view_specification']);
		Route::post('/menu/specification_store',['as' => $route_slug.'specification_store','uses' => $module_controller.'specification_store']);
		Route::post('/menu/specification_update/{id}',['as' => $route_slug.'specification_update','uses' => $module_controller.'specification_update']);
		Route::get('/menu/specification_delete/{id}',['as' => $route_slug.'specification_delete','uses' => $module_controller.'specification_delete']);
		
		Route::post('menu/upload', 'Admin\MenuController@upload')->name('menu.upload');
	});
	
	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\FaqController@";
		Route::get('/view-faq',['as' => $route_slug.'view-faq','uses' => $module_controller.'index']);
		Route::get('/create-faq',['as' => $route_slug.'create-faq','uses' => $module_controller.'create']);
		Route::post('/faq/store',['as' => $route_slug.'faq','uses' => $module_controller.'store']);
		Route::get('faq/edit/{id}',['as' => $route_slug.'edit/{id}','uses' => $module_controller.'edit']);
		Route::post('faq/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
		Route::get('/faq/delete/{id}',		['as' => $route_slug.'delete','uses' => $module_controller.'delete']);
	});
	
	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\SpecificationController@";
		Route::get('/view-specification-list',['as' => $route_slug.'view-specification-list','uses' => $module_controller.'index']);
		Route::post('/specification/specification_store',['as' => $route_slug.'specification','uses' => $module_controller.'specification_store']);
		Route::post('specification/specification_update/{id}',['as' => $route_slug.'specification_update/{id}','uses' => $module_controller.'specification_update']);
		Route::get('/specification/specification_delete/{id}',		['as' => $route_slug.'specification_delete','uses' => $module_controller.'specification_delete']);
	});

	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\ContactController@";
		Route::get('/view-contact',['as' => $route_slug.'view-contact','uses' => $module_controller.'index']);
		Route::get('/contactus/view/{id}',['as' => $route_slug.'view','uses' => $module_controller.'view']);
		Route::get('/contactus/delete/{id}',['as' => $route_slug.'delete','uses' => $module_controller.'delete']);
		Route::get('/contactus/send-mail',['as' => $route_slug.'send-mail','uses' => $module_controller.'send_mail']);
		Route::get('/contactus/create_email/{id}',['as' => $route_slug.'create_email','uses' => $module_controller.'create_email']);
		Route::post('/contactus/email/{id}',['as' => $route_slug.'email','uses' => $module_controller.'email']);
		
		Route::any('/contactus/create_email_all',['as' => $route_slug.'create_email_all',	'uses' => $module_controller.'create_email_all']);
		Route::any('/contactus/contact_email_all',['as' => $route_slug.'contact_email_all',	'uses' => $module_controller.'contact_email_all']);
		
	
	});

	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
	$route_slug 	   = 'admin_';
	$module_controller = "Admin\SubscriptionNowController@";
	
	Route::get('/view-subscribe-now-user',['as' => $route_slug.'view-subscribe-now-user','uses' => $module_controller.'index']);
	
	Route::any('/view-subscribe-now/{id}',['as' => $route_slug.'view_subscribe_now','uses' => $module_controller.'view_subscribe_now']);

	Route::get('/view-subscribe-now-details/{id1}/{id2}',['as' => $route_slug.'view','uses' => $module_controller.'view']);

	Route::post('/subscribe-now/store_comment_link/{id}',['as' => $route_slug.'store_comment_link','uses' => $module_controller.'store_comment_link']);

	Route::post('/subscribe-now/approve_status/{id}',['as' => $route_slug.'approve_status','uses' => $module_controller.'approve_status']);

	Route::post('/subscribe-now/disapprove_status/{id}',['as' => $route_slug.'disapprove_status','uses' => $module_controller.'disapprove_status']);

	Route::get('/subscribe-now/export/',['as' => $route_slug.'export','uses' => $module_controller.'export']);

	//Route::get('/subscribe-now/export_user/{id1}/{id2}/{id3}',['as' => $route_slug.'export_user','uses' => $module_controller.'export_user']);

	Route::get('/subscribe-now/export_user/{id}',['as' => $route_slug.'export_user','uses' => $module_controller.'export_user']);
	
	Route::get('/subscribe-now/export_subscriber/{id}',['as' => $route_slug.'export_subscriber','uses' => $module_controller.'export_subscriber']);

	Route::get('/subscribe-now/delete/{id}',['as' => $route_slug.'delete',	'uses' => $module_controller.'delete']);

	Route::get('/getSubscribeNowPlanDurationData/{id}',['as' => $route_slug.'SubscribeNowPlanDurationData','uses' => $module_controller.'SubscribeNowPlanDurationData']);
	
	Route::post('subscribe-now/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);

	Route::get('/invoice/{id}',['as' => $route_slug.'invoice','uses' => $module_controller.'invoice']);

	Route::get('/view-coupon-code',['as' => $route_slug.'view_coupon_code','uses' => $module_controller.'view_coupon_code']);

	Route::post('/store_coupon_code',['as' => $route_slug.'store_coupon_code','uses' => $module_controller.'store_coupon_code']);

	Route::get('/coupon_code_delete/{id}',['as' => $route_slug.'coupon_code_delete','uses' => $module_controller.'coupon_code_delete']);

	Route::post('/update_coupon_code/{id}',['as' => $route_slug.'update_coupon_code','uses' => $module_controller.'update_coupon_code']);

	Route::post('/coupon_code_active/{id}',['as' => $route_slug.'coupon_code_active','uses' => $module_controller.'coupon_code_active']);

	Route::post('/coupon_code_inactive/{id}',['as' => $route_slug.'coupon_code_inactive','uses' => $module_controller.'coupon_code_inactive']);
});

	$route_slug 	   = 'user';
	$module_controller = 'User\UserController@';
	Route::get('/user', ['as' => $route_slug,'uses' => $module_controller.'login']);
	Route::post('/validate_login1', ['as' => $route_slug.'validate','uses' => $module_controller.'validate_login1']);
	Route::any('/logout', ['as' => $route_slug.'logout','uses' => $module_controller.'logout']);

	Route::group(array('prefix' => 'user','middleware'=>'auth_user'), function (){
		$route_slug 	   = 'user_';
		$module_controller = "User\DashboardController@";
		Route::get('/index',['as' => $route_slug.'index','uses' => $module_controller.'index']);
	});

});

