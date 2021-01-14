<?php

namespace App\Http\Controllers;
use App\Models\MenuModel;
use App\Models\MenuCategoryModel;
use App\Models\SpecificationMenuModel;
use Illuminate\Http\Request;

use Sentinel;
use DB;

class MenuController extends Controller
{
    function __construct()
    {   
        $this->arr_view_data                = [];
        $this->module_title                 = "Menu";
        $this->module_view_folder           = "admin";
        $this->product_image_base_path      = base_path().'/uploads/images/';
        $this->product_image_public_path    = url('/').config('app.project.img_path.images');
        $this->MenuModel                    = new MenuModel();
        $this->MenuCategoryModel            = new MenuCategoryModel();
        $this->SpecificationMenuModel               = new SpecificationMenuModel();
    }


    public function index()
    {
        $data['seo_title'] = "Menu";
        $arr_data = [];
        $obj_data = $this->MenuModel->orderBy('id','ASC')->get();
        if($obj_data)
        {
            $arr_data = $obj_data->toArray();
        }
        $data['arr_data']      = $arr_data;
        /*Menu Category*/
        $cate_data = [];
        $sqlQuery = "SELECT * FROM menu_categories INNER JOIN menu ON menu.menu_category_id=menu_categories.id group by menu_categories.name";
        $data['cate_data'] = \DB::select(DB::raw($sqlQuery));
           
        /*Recent Data*/
        $recent_data = [];
        $recent_value     = \DB::table('blog')->orderby('id','DESC')->limit(3)->get();
        if($recent_value)
        {
            $recent_data = $recent_value->toArray();
        }
        $data['recent_data']  = $recent_data;
        return view('menu',$data);
    }

  
}
