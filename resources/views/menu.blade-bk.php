@extends('layouts.master')
@section('content')
<section class="breadcrumbs-custom">
  <div class="parallax-container" data-parallax-img="{{url('')}}/public/front/img/faq-bg.jpg">
    <div class="material-parallax parallax"> <img src="{{url('')}}/public/front/img/faq-bg.jpg" alt="" style="display: block; transform: translate3d(-50%, 149px, 0px);"> </div>
    <div class="breadcrumbs-custom-body parallax-content context-dark">
      <div class="container">
        <h2 class="breadcrumbs-custom-title">Our Menu</h2>
      </div>
    </div>
  </div>
  <div class="breadcrumbs-custom-footer">
    <div class="container">
      <ul class="breadcrumbs-custom-path">
        <li><a href="{{url('')}}">Home</a></li>
        <li class="active">Menu</li>
      </ul>
    </div>
  </div>
</section>
<main>
   <section class="">
    <div class="container">
      <div class="row">
        <h2 class="elementor-heading-title mb-3">Top Categories</h2>
        <!-- <p class="elementor-image-box-description text-center">Lorem Ipsum is simply dummy text of the printing and</p> -->
      </div>
      <div class="row" data-aos="fade-up" data-aos-delay="100">
        <div class="col-lg-12 d-flex justify-content-center mt-3"> 
          <!-- Nav pills -->
          <ul class="nav nav-pills Categories-portfolio" role="tablist">
           
            
            
             @foreach($cate_data as $key => $row)
              <li class="nav-item"> 
              <a @if($key == 0) class="nav-link active" @endif  class="nav-link" data-toggle="pill" href="#tab{{$row->menu_category_id}}"> 
              {{$row->name}} </a> </li>
            @endforeach
          </ul>
        </div>
        <div class="col-lg-12 d-flex justify-content-center mt-2"> 
          <!-- Tab panes -->
          <div class="tab-content w-100">
            @foreach($cate_data as $count => $row)
            <div id="tab{{$row->menu_category_id}}"  @if($count == 0) class="container tab-pane active filter-active" @else class="container tab-pane" @endif><br>
              <div class="row">
                 <?php 
                 $menu_data     = \DB::table('menu')->where('menu_category_id',$row->menu_category_id)->get(); 
                 foreach($menu_data as $menu_row): 
                 $menu_id= $menu_row->id; ?>
                <div class="col-lg-4 col-xl-3 col-md-6">
                  <div class="meal-card-wrapper">
                    <div class="meal-card">
                      <div class="meal-img"> 
                        <a href="" data-toggle="modal" data-target="#myModal-{{$menu_row->id}}"> 
                          <img src="{{url('')}}/uploads/images/{{$menu_row->image}}" class="img-fluid"> 
                        </a> 
                      </div>
                      <div>
                        <div class="nutridock-meal mt-2">
                          <div class="nutridock-meal-name text-center"> <span title="{{$menu_row->menu_title}}"> {{$menu_row->menu_title}}</span> </div>
                          <div class="nutridock-meal-ingredients text-center"> <span class="txt-side-dish-s" title="with Sautéed Carrots &amp; French Green Beans">{{$menu_row->menu_description}}</span> </div>
                          <div class="nutridock-icon over-xs-limit">
                            <?php $whats_inside_value     = \DB::table('whats_inside')->where('menu_id',$menu_id)->orderBy('id','Asc')->limit('1')->get();
                                foreach($whats_inside_value as $whats_inside_row);?>
                            <div class="meal-icon">
                             <a href="javascript:;" class="tooltip" title="" style="margin-left: -40px; color:#5cc62b;">  
                              <span class="tooltiptext">Calories<!--469kcal--></span>
                              <?php $string = $whats_inside_row->unit;$s = ucfirst($string);
$bar = ucwords(strtolower($s));
echo $data = preg_replace('/\s+/', '', $bar); ?> </a>  
                            </div>
                            
                            <?php $spec_value     = \DB::table('menu_specification')->where('menu_id',$menu_id)->get(); 
                              foreach($spec_value as $spec_row):
                                $spec_id = $spec_row->specification_id;
                                $specifiction     = \DB::table('specification')->where('id',$spec_id)->get(); 
                                foreach($specifiction as $specifiction_row); ?>
                            <div class="meal-icon">
                             <a href="javascript:;" class="tooltip" title="<?php echo $specifiction_row->name; ?>">  
                              <span class="tooltiptext"><?php echo $specifiction_row->name; ?></span>
                              <img src="{{url('')}}/uploads/images/{{$spec_row->icon_image}}" alt="<?php echo $specifiction_row->name; ?>"> 
                             </a>  
                            </div>
                            <?php endforeach; ?>
                             <div class="meal-icon" ><a href="" class="tooltip" data-toggle="modal" data-target="#myModal-{{$menu_row->id}}">
                               <span class="tooltiptext">show more</span>  <img src="{{url('')}}/public/front/img/designs-menu.png" alt="show more"> </a>  </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
               <?php endforeach; ?>
              </div>
            </div>
             @endforeach
          </div>
        </div>
      </div>

  <!-- Modal Open  -->
  <!-- The Modal -->
@foreach($cate_data as $key => $row)
<?php 
$id = $row->id;

$menu_data     = \DB::table('menu')->get();//->where('menu_category_id',$id)

foreach($menu_data as $menu_row):  ?>

  <div class="modal" id="myModal-{{$menu_row->id}}">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="modal-title">{{$menu_row->menu_title}} <br/>
            <small style="font-size: 14px;display: block;">{{$menu_row->menu_description}}</small>
          </h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
            <div class="modal-body" style="background-color: #f7f7f7;">
              <div>
                <ul class="list-inline mb-0" data-test="tags">
                  <?php $menu_data_id = $menu_row->id;
                   $menu_data     = \DB::table('menu')->where('id',$menu_data_id)->get(); 
                   foreach($menu_data as $menu_row);
                   $speci = $menu_row->specification;
                   $abc = explode(",",$speci);
                   //$string_version = implode(',', $abc);
                   //print_r($abc[0]); die;
                   for($i=0;$i<count($abc); $i++){?>
                      
                   <li class="list-inline-item mr-1 mb-1"><span class="badge-list-item"><?php echo $abc[$i]; ?></span></li>
                  <?php } ?>
                  <!-- <li class="list-inline-item mr-1 mb-1"><span class="badge-list-item">&lt;500 Cal</span></li>
                  <li class="list-inline-item mr-1 mb-1"><span class="badge-list-item">Gluten Free</span></li>
                  <li class="list-inline-item mr-1 mb-1"><span class="badge-list-item">&lt;35g Carbs</span></li>
                  <li class="list-inline-item mr-1 mb-1"><span class="badge-list-item">High Protein</span></li>
                  <li class="list-inline-item mr-1 mb-1"><span class="badge-list-item">Soy Free</span></li> -->
                </ul>
              </div>
              <div class="MealModal-module">
                <article class="meals-overlay">
                 <div>
                    <div class="row">
                      <div class="col-md-5">
                      <?php $mult_image = $menu_row->multiple_image;
                        $exp = explode(",", $mult_image);
                        for($i=0; $i<count($exp); $i++){?>
                      <div class="position-relative">
                        <img class="mb-3 w-100" src="{{url('')}}/uploads/images/{{$exp[$i]}}">
                      </div>
                      <?php } ?>
                       <!-- <div class="position-relative">
                         <img class="mb-3 w-100" src="https://res.cloudinary.com/freshly/image/upload/c_fill,dpr_2,f_auto,w_580/v1574619598/production-meal-image-7424ee00-d9d6-4038-b190-a5d22da8ac56.jpg">
                       </div>
                       <div class="position-relative">
                         <img class="mb-3 w-100" src="https://res.cloudinary.com/freshly/image/upload/c_fill,dpr_2,f_auto,w_580/v1574619627/production-meal-image-17aa62ca-008b-4680-a2d7-4b274820065b.jpg">
                       </div>
                       <div class="position-relative">
                         <img class="mb-3 w-100" src="https://res.cloudinary.com/freshly/image/upload/c_fill,dpr_2,f_auto,w_580/v1574619652/production-meal-image-d09b8cb8-70ef-4b0d-8995-59420fc8c9da.jpg">
                       </div>
                       <div class="position-relative">
                         <img class="mb-3 w-100" src="https://res.cloudinary.com/freshly/image/upload/c_fill,dpr_2,f_auto,w_580/v1589575861/production-meal-image-09d83596-0409-4e39-9b3b-9b512c12c6e1.jpg">
                       </div> -->
                     </div>


                     <div class="col-md-7">
                      <section class="title-wrap" style="padding: 11px;">
                       <div class="heading-title-">
                         <h2 class="pl-3" style="margin-left: -17px;">What makes this dish special</h2>
                         <p><?php echo stripslashes($menu_row->what_makes_dish_special); ?></p>
                       </div>
                      </section> 
                      <section class="title-wrap">
                         <div class="heading-title-">
                           <h2 class="pl-3">Ingredients</h2>
                        </div>
                        <div class="row m-0">
                          <?php $menu_id = $menu_row->id;
                                $ingredients     = \DB::table('ingredients')->where('menu_id',$menu_id)->limit(6)->get();
                                foreach($ingredients as $ingredients_value): ?>
                          <div class="col-md-4 col-4 pl-1 pr-1">
                            <figure class="text-center">
                              <img class="Ingredients-img" alt="Chicken Breast" src="{{url('')}}/uploads/images/{{$ingredients_value->image}}">
                              <figcaption class="Ingredients-title">{{$ingredients_value->name}}</figcaption>
                            </figure>
                          </div>
                        <?php endforeach; ?>
                        </div>
                        <button class="show-all-ingredients" data-toggle="collapse" data-target="#demo">
                      Show all ingredients
                    </button>
                    <div id="demo" class="collapse">
                      <div class="heading-title-">
                       <h2 class="pl-3" style="margin-bottom: -9px;">
                         All ingredients
                       </h2>
                        <?php  $name=array(); $menu_value_id = $menu_row->id;
                                $ingredients     = \DB::table('ingredients')->where('menu_id',$menu_value_id)->get();
                                foreach($ingredients as $ingredients_value1){
                                $name[] = $ingredients_value1->name;
                              }
                              //echo implode(',', $name); 
                              $array = implode(',', $name); ?>
                       <p class="ingredients-p" style="font-family: 'Open Sans'; color:#000;"> <?php echo $menu_row->ingredients; ?></p>
                     </div>
                   </div>
                      </section>
                       <section class="title-wrap">
                        <div class="px-3">
                         <div class="heading-title-">
                           <h2 class="pl-0">What’s inside</h2>
                        </div>
                        <div class="row">
                          <?php $menu_id=$menu_row->id;
                                $whats_inside     = \DB::table('whats_inside')->where('menu_id',$menu_id)->orderby('id','ASC')->limit(4)->get();
                                foreach($whats_inside as $whatsinside_row):
                                $title = $whatsinside_row->title;?>
                          <div class="col-md-6 col-6">
                            <div class="Featured-Nutridock-module">
                              <span class="Calories-name"><?php echo $whatsinside_row->title; ?></span>
                              <strong class="d-block"><?php echo $whatsinside_row->unit; ?></strong>
                              <!-- Graph Open --><hr>
                              <!-- <div class="progress" style="height: 0.3rem;">
                                <div class="progress-bar bg-success" style="width:<?php echo $whatsinside_row->unit; ?>%"></div>
                              </div> -->
                              <!-- Graph close -->
                              <!-- <small>25DV</small> -->
                            </div>
                          </div>
                        <?php endforeach; ?>

                          <!-- <div class="col-md-6">
                            <div class="Featured-Nutridock-module border-0">
                              <span class="Calories-name">Carbs</span>
                              <strong class="d-block">440</strong>
                              <div class="progress" style="height: 0.3rem;">
                                <div class="progress-bar bg-success" style="width:60%"></div>
                              </div>
                              <small>25DV</small>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="Featured-Nutridock-module pt-4" style="border-top: 1px solid #e1e1e1;">
                              <span class="Calories-name">Total Fat</span>
                              <strong class="d-block">170Kg</strong>
                              <div class="progress" style="height: 0.3rem;">
                                <div class="progress-bar bg-success" style="width:60%"></div>
                              </div>
                              <small>25DV</small>
                            </div>
                          </div> -->
                        </div>
                        <!--<button class="show-all-ingredients" data-toggle="collapse" data-target="#demo2">Show complete nutrition facts</button>-->
                    <div id="demo2" class="collapse">
                      <h2 class="Facts-ingredients">Nutrition Facts</h2>
                      <p class="ingredients-p pt-0">
                        1 Serving Per Container
                      </p>
                      <table class="table">
                        <!-- <tr>
                          <th>Serving Size</th>
                          <th class="text-right">Serving Size 347 (g)</th>
                        </tr>
                        <tr>
                          <th colspan="2">
                            Amount Per Serving
                          </th>
                        </tr> -->
                         <?php $menu_id=$menu_row->id;
                                $whats_inside     = \DB::table('whats_inside')->where('menu_id',$menu_id)->orderby('id','ASC')->get();
                                foreach($whats_inside as $whatsinside_row):
                                $title = $whatsinside_row->title; ?>
                        <tr>
                          <th>
                            <?php echo $whatsinside_row->title; ?>
                          </th>
                          <th class="text-right" style="color: #28A745;"><?php echo $whatsinside_row->unit; ?><br/>
                            <!-- % Daily Value* -->
                          </th>
                        </tr>
                      <?php endforeach; ?>
                       <!--  <tr>
                          <td>
                            Total Fat 17g
                          </td>
                          <td>22%</td>
                        </tr>
                        <tr>
                          <td>
                            Saturated Fat 2.5g
                          </td>
                          <td>13%</td>
                        </tr> -->
                      </table>
                      <!-- <p class="ingredients-p">
                        Manufactured in a facility that uses egg, tree nuts, milk, fish, shellfish, and soy.
                      </p> -->
                  </div>
                      </div>
                    </section>
                   </div>
                 </div> 
                </article>
              </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer"  style="justify-content: flex-start;">
              <!--<button type="button" class="btn btn-success" data-dismiss="modal">Order Now</button>-->
              <a href="http://order.nutridock.com/" target="_tab" class="btn btn-success">Order Now</a>
            </div>
          </div>
        </div>
      </div>
      <?php endforeach; ?>
      @endforeach

      <!-- Modal Close -->
    </div>
  </section>
</main>
 
@endsection