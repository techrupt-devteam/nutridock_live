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

Route::get('/', function () {
    return view('landing');
});

Auth::routes();
Route::get('/landing', 'HomeController@landing')->name('landing');
Route::get('/index', 'HomeController@index')->name('index');
Route::get('/about', 'AboutController@index')->name('about');
Route::get('/features', 'FeaturesController@index')->name('features');
Route::get('/blog', 'BlogController@index')->name('blog');
Route::get('/blog_detail/{id}', 'BlogController@blog_detail')->name('blog_detail');
Route::post('/store_comment', 'CommentController@store')->name('store_comment');
Route::get('/contact', 'ContactController@index')->name('contact');
Route::post('/store', 'ContactController@store')->name('store');
Route::post('/newsletter_store', 'HomeController@store')->name('store');
Route::post('/notifyme_store', 'HomeController@notifyme_store')->name('notifyme_store');

Route::get('/faq', 'FaqController@index')->name('faq');
Route::get('/privacy_policy', 'PrivacyPolicyController@index')->name('privacy_policy');
Route::get('/bmical/standard', 'BmicalController@standard')->name('bmical/standard');
Route::get('/bmical/index', 'BmicalController@index')->name('bmical/index');
//Route::get('/home', 'HomeController@index')->name('home');

/*Razorpay*/
Route::post('/page/payment','PaymentController@index');
Route::post('/capture_payment','PaymentController@capture_payment');
Route::get('success','PaymentController@success');
Route::get('failed','PaymentController@failed');

Route::post('/survey','LandingController@store_survey');
Route::post('/subscription','LandingController@store_subscription');

Route::any('/register','LandingController@user_register');

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
		
		Route::any('/subscription/email',['as' => $route_slug.'email',	'uses' => $module_controller.'email']);
	});

	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\BlogController@";
		Route::get('/blog_list',['as' => $route_slug.'blog_list','uses' => $module_controller.'index']);
		Route::post('/blog/store',['as' => $route_slug.'blog','uses' => $module_controller.'store']);
		Route::get('/blog_list/store',['as' => $route_slug.'store','uses' => $module_controller.'store']);
		Route::get('/create-blog',['as' => $route_slug.'create-blog','uses' => $module_controller.'create']);
		Route::get('/edit-blog/{id}',['as' => $route_slug.'edit-blog/{id}','uses' => $module_controller.'edit']);
		Route::post('blog/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
		//Route::post('','Admin\CustomizepopartController@update');
		Route::get('/blog/delete/{id}',		['as' => $route_slug.'delete',			'uses' => $module_controller.'delete']);
	});


	/*Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\FeatureController@";
		Route::get('/features-list',['as' => $route_slug.'features-list','uses' => $module_controller.'index']);
	});*/

	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\ContactController@";
		Route::get('/contact-list',['as' => $route_slug.'contact-list','uses' => $module_controller.'index']);
		Route::get('/contact/delete/{id}',['as' => $route_slug.'delete','uses' => $module_controller.'delete']);
		Route::get('/contact/send-mail',['as' => $route_slug.'send-mail','uses' => $module_controller.'send_mail']);
	
	});

	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\NewsletterController@";
		Route::get('/newsletter-list',['as' => $route_slug.'newsletter-list','uses' => $module_controller.'index']);
		Route::get('/newsletter/delete/{id}',		['as' => $route_slug.'delete',			'uses' => $module_controller.'delete']);
	});

	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\NotifyController@";
		Route::get('/notify-list',['as' => $route_slug.'notify-list','uses' => $module_controller.'index']);
	});

	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\EnquiryController@";
		Route::get('/enquiry-list',['as' => $route_slug.'enquiry-list','uses' => $module_controller.'index']);
		/*Route::post('/blog/store',['as' => $route_slug.'blog','uses' => $module_controller.'store']);
		Route::get('/blog_list/store',['as' => $route_slug.'store','uses' => $module_controller.'store']);
		Route::get('/create-blog',['as' => $route_slug.'create-blog','uses' => $module_controller.'create']);
		Route::get('/edit-blog/{id}',['as' => $route_slug.'edit-blog/{id}','uses' => $module_controller.'edit']);
		Route::post('blog/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
		Route::get('/blog/delete/{id}',		['as' => $route_slug.'delete',			'uses' => $module_controller.'delete']);*/
	});


	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\CommentController@";
		Route::get('/comment-list',['as' => $route_slug.'comment-list','uses' => $module_controller.'index']);
		//Route::post('/blog/store',['as' => $route_slug.'blog','uses' => $module_controller.'store']);

	});

	Route::group(array('prefix' => 'admin','middleware'=>'auth_admin'), function (){
		$route_slug 	   = 'admin_';
		$module_controller = "Admin\FaqController@";
		Route::get('/faq',['as' => $route_slug.'faq','uses' => $module_controller.'index']);
		/*Route::post('/blog/store',['as' => $route_slug.'blog','uses' => $module_controller.'store']);
		Route::get('/blog_list/store',['as' => $route_slug.'store','uses' => $module_controller.'store']);
		Route::get('/create-blog',['as' => $route_slug.'create-blog','uses' => $module_controller.'create']);
		Route::get('/edit-blog/{id}',['as' => $route_slug.'edit-blog/{id}','uses' => $module_controller.'edit']);
		Route::post('blog/update/{id}',['as' => $route_slug.'update','uses' => $module_controller.'update']);
		Route::get('/blog/delete/{id}',		['as' => $route_slug.'delete',			'uses' => $module_controller.'delete']);*/
	});

});

