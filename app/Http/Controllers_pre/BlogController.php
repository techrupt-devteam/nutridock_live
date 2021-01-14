<?php

namespace App\Http\Controllers;
use App\Models\BlogModel;
use App\Models\CommentModel;
use Illuminate\Http\Request;

use Carbon\Carbon;

class BlogController extends Controller
{
    function __construct()
    {   
        $this->arr_view_data                = [];
        $this->module_title                 = "Product";
        $this->module_view_folder           = "admin";
        $this->product_image_base_path      = base_path().'/uploads/images/';
        $this->product_image_public_path    = url('/').config('app.project.img_path.images');
        $this->BlogModel                    = new BlogModel();
        $this->CommentModel                    = new CommentModel();
    }


    public function index()
    {
        $arr_data = [];
        $obj_data = $this->BlogModel->get();

        if($obj_data)
        {
            $arr_data = $obj_data->toArray();
        }


        $data['arr_data']      = $arr_data;
        return view('blog',$data);
    }

    public function blog_detail($enc_id='')
    {
        $arr_data = [];
        if($enc_id=='')
        {
            return redirect()->back();
        }
        $obj_data = $this->BlogModel->where('id', base64_decode($enc_id))->first();

        //$all_obj_data = $this->CommentModel->where('blog_id', base64_decode($enc_id))->first();
        $all_obj_data = $this->CommentModel->where('blog_id',base64_decode($enc_id))->orderBy('id','ASC')->get();
        if($obj_data)
        {
            $arr_data = $obj_data->toArray();
            $all_arr_data = $all_obj_data->toArray();
        }
        $data['arr_data'] = $arr_data;
        $data['all_arr_data'] = $all_arr_data;

        return view('blog_detail',$data);
    }
}
