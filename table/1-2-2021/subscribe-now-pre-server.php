@extends('layouts.master') 
<script src="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.18.10/slimselect.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.18.10/slimselect.min.css" rel="stylesheet">
</link>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> --> 
<!-- css -->
<link id="bsdp-css" href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css" rel="stylesheet">
@section('content')
<link rel="stylesheet"href="{{url('')}}/public/css/wizgard.css">
<style type="text/css">
  .datepicker.datepicker-dropdown.dropdown-menu {
    margin-top: 45px !important;
  }
   .offer-price span {
    color: #5e5a5a;
    font-size: 13px;
}
</style>

<!-- For Datepickr -->
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<style type="text/css">
    .mt10px{
        margin-top: 10px;
    }
    .mt20px{
        margin-top: 20px;
    }
  
    p{
        line-height: 25px;
    }
    .wizard-navigation .active {
    text-align: center;
    padding: 12px 11px;
    font-size: 12px;
    text-transform: capitalize;
    -webkit-font-smoothing: subpixel-antialiased;
    background-color: #67d251;
    border-radius: 4px;
    color: #FFFFFF !important;
    cursor: pointer;
    font-weight: 600;
    box-shadow: 0 16px 26px -10px rgba(78, 244, 54, 0.56), 0 4px 25px 0px rgba(0, 0, 0, 0.12), 0 8px 10px -5px rgba(176, 244, 54, 0.2);
}
.bl-0{
	border-left:0px !important
}
.br-0{
	border-right:0px !important	
	}
	.checkbox a , .checkbox {
    color: #222;
    font-size: 14px;
}
.table-bordered thead th {
    border-bottom-width: 1px;
    font-size: 14px;
    color: #262626;
}
</style>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> --> 
<script type="text/javascript" src="{{url('')}}/public/front/dist/date-time-picker.min.js"></script>
<section class="mt-5 pb-0">
  <div class="">
    <div class="image-container set-full-height pb-5" style="background-image: url('{{url('')}}/uploads/images/1.jpeg');"> 
      <!--   Big container   -->
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto"> 
            <!-- Wizard container -->
            <div class="wizard-container">
              <div class="card wizard-card" data-color="red" id="wizard"> 
                <!-- <form action="" method="" class="mb-0"> -->
                <div class="wizard-header">
                  <?php
                    //print_r($session); die;
                     //print_r($data['getSubscribeNowData']); die; ?>
                  <h3 class="wizard-title"> Subscribe Now </h3>
                  <!-- <h5>This information will let us know more about you.</h5> --> 
                </div>
                <div class="wizard-navigation wizzgard-active" id="tabs">
                  <ul>
                    <li class=""> <a href="#details" data-toggle="tab">Personal</a> </li>
                    <li> <a href="#captain" id="tab1" data-toggle="tab">Health</a> </li>
                    <!-- data-toggle="tab" -->
                    <li><a href="#description" data-toggle="tab">Choose Plan </a></li>
                    <!-- data-toggle="tab" -->
                    <li><a href="#payment" data-toggle="tab">Delivery </a></li>
                    <li><a href="#checkout" data-toggle="tab">Checkout </a></li>
                    <!-- data-toggle="tab" -->
                  </ul>
                </div>
                <div class="tab-content">
                  <div class="tab-pane ui-tabs-panel" id="details" >
                    <div class="row">
                      <div class="col-sm-12">
                        <h4 class="info-text"> Let's start with the basic details.</h4>
                        <div class="col-sm-12" style="text-align: center;"> <span id="alreadyexits"></span> </div>
                      </div>
                      <div class="col-sm-12">
                        <div class="input-group mb-0"> 
                          <!-- <span class="input-group-addon"> <i class="fa fa-user-o"></i> </span> -->
                          <div class="form-group label-floating w-100">
                            <label class="control-label">Full Name <span style="color:red;">*</span></label>
                            <div class="input-group mb-3">
                              <div class="input-group-prepend"> <span class="input-group-text"><i class="fa fa-user-circle" aria-hidden="true"></i></span> </div>
                              <input type="text" name="full_name" class="form-control" id="basic-url" aria-describedby="basic-addon3" placeholder="Full Name" required="required">
                            </div>
                            <span id="err_full_name" style="color: red;font-size: 15px;"></span> </div>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="form-group label-floating">
                          <label class="control-label">Email <span style="color:red;">*</span></label>
                          <div class="input-group mb-3">
                            <div class="input-group-prepend"> <span class="input-group-text" id="basic-addon3" ><i class="fa fa-envelope" aria-hidden="true"></i></span> </div>
                            <input type="email" class="form-control" id="basic-url" aria-describedby="basic-addon3" placeholder="Email" name="email" required="required">
                          </div>
                          <span id="err_email" style="color: red;font-size: 15px;"></span> </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="form-group label-floating w-100">
                          <label class="control-label">Mobile <span style="color:red;">*</span></label>
                          <div class="input-group mb-3">
                            <div class="input-group-prepend"> <span class="input-group-text" id="basic-addon3"><i class="fa fa-phone" aria-hidden="true"></i></span> </div>
                            <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3" placeholder="Mobile" name="phone_no" required="required" maxlength="10" minlength="10" onkeypress="return isNumberKey(event)">
                          </div>
                          <span id="err_mobile_no" style="color: red;font-size: 15px;"></span> </div>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane ui-tabs-panel" id="captain">
                    <h4 class="info-text">Let us know more about your Health </h4>
                    <div class="row">
                      <div class="col-sm-4 col-lg-3">
                        <div class="form-group label-floating">
                          <label class="control-label">Age <span style="color: red;">*</span></label>
                          <input name="age" type="text" class="form-control" placeholder="Age" required="required" onkeypress="return isNumberKey(event)" maxlength="3" minlength="3">
                          <span style="color: red;font-size: 15px;" id="err_age"></span>
                        </div>
                      </div>
                      <div class="col-sm-4 col-lg-3">
                        <div class="form-group label-floating w-100">
                          <label class="control-label">Gender <span style="color: red;">*</span></label>
                          <select class="form-control" name="gender" id="gender" required="required" style="min-height:45px">
                            <option selected="selected" disabled="disabled" value="">Select</option>
                            <option value="Female">Female</option>
                            <option value="Male">Male</option>
                            <option value="Other">Other</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-sm-4 col-lg-3">
                        <div class="form-group label-floating">
                          <label class="control-label">Weight <span style="color: red;">*</span></label>
                          <input name="weight" type="text" class="form-control" placeholder="Kgs" required="required" onkeypress="return isNumberKey(event)" maxlength="3" minlength="3">
                        </div>
                      </div>
                      <div class="col-sm-6 col-lg-3">
                        <label class="control-label">Height <span style="color: red;">*</span></label>
                        <div class="row">
                          <div class="col-6 pr-1">
                            <input type="text" name="height_in_feet" class="form-control" placeholder="Feet" required="required" onkeypress="return isNumberKey(event)" maxlength="1" minlength="1">
                          </div>
                          <div class="col-6 pl-1">
                            <input type="text" name="height_in_inches" class="form-control" placeholder="Inch" onkeypress="return isNumberKey(event)" maxlength="2" minlength="2">
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4">
                        <label class="control-label">Physical Activity <span style="color: red;">*</span></label>
                        <select class="form-control" name="physical_activity_id" id="physical_activity_id" required="required">
                          <option selected="selected" disabled="disabled" value="" >Select an option</option>
                           @foreach($data['getPhysicalActivityData'] as $getPhysicalActivity)
                          <option value="{{ $getPhysicalActivity['physical_activity_id'] }}">{{ $getPhysicalActivity['physical_activity'] }}</option>
                           @endforeach   
                        </select>
                      </div>
                      <div class="col-sm-4">
                        <label class="control-label">Avoid / Dislike Food <span style="color: red;">*</span></label>
                        <select id="demo" multiple name="avoid_or_dislike_food_id[]" required="required">
                          <option value="None">None</option>
                              @foreach($data['getFoodAvoidData'] as $getFoodAvoidData)
                          <option value="{{ $getFoodAvoidData['food_avoid_id'] }}"> {{ $getFoodAvoidData['food_avoid_name'] }} </option>
                              @endforeach  
                          <option value="Other">Other</option>
                        </select>
                      </div>
                      <div class="col-sm-4" style="display: none;" id="other_food_div">
                        <label class="control-label">Other Food</label>
                        <input name="other_food" type="text" class="form-control" placeholder="Other">
                      </div>
                      <div class="col-sm-12">
                        <div class="form-group label-floating">
                          <label class="control-label">Any lifestyle disease? (Diabetes,Cholesterol,etc)</label>
                          <textarea class="form-control" rows="2" name="lifestyle_disease" id="lifestyle_disease" placeholder="Any lifestyle disease"></textarea>
                        </div>
                      </div>
                      <div class="col-sm-12">
                        <div class="form-group label-floating">
                          <label class="control-label">Any food preparation instructions?</label>
                          <textarea class="form-control" rows="2" name="food_precautions" id="food_precautions" placeholder="Any Food Precautions"></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <!-- Choose Plane -->
                  <div class="tab-pane ui-tabs-panel" id="description">
                    <h4 class="info-text">{{ $data['getSubscribeNowPlan']['name'] }}  Details</h4>
                    <!-- <form action="" method=""> --> 
                    <!-- {{csrf_field()}} -->
                    <div class="row">
                      <div class="col-sm-6 col-lg-5 mb-1">
                        <label class="control-label">Start Date<span style="color: red;">*</span></label>
                        <input type="text" class="mt10px input form-control" id="start_date" value="<?php echo date("Y-m-d", strtotime("+ 2 day")) ?>">
                      </div>
                      <div class="col-sm-6 mb-1">
                        <label class="control-label">No. of days <span style="color: red;"> *</span></label>
                        <div id="meals" class="radio-toolbar"> @foreach($data['getSubscribeNowPlan']['duration'] as $key => $duration_dtl)
                          <input type="radio" onclick="calculatePrice();" id="rad_{{ $duration_dtl['subscribe_now_duration'] }}" name="radNoOfDays" data-id="{{ $duration_dtl['subscribe_now_duration'] }}" value="{{ $duration_dtl['subscribe_now_plan_duration_id'] }}" 
                              <?php echo ($key == 0) ? 'checked' : '' ?> class="subscribe_now_plan_duration_id" required="required">
                          <label for="rad_{{ $duration_dtl['subscribe_now_duration'] }}">{{ $duration_dtl['subscribe_now_duration'] }}</label>
                          @endforeach </div>
                      </div>
                      <div class="col-sm-12 mb-1">
                        <label class="control-label"> Type of meals <span style="color:red;">*</span></label>
                        <div id="meals">
                          <div class="chk-toolbar"> @foreach($data['getMealTypeData'] as $getMealTypeData)
                            <input type="checkbox" dataname="{{ $getMealTypeData['meal_type_name'] }}" id="radio{{ $getMealTypeData['meal_type_name'] }}" name="radioFruit[]" data-value="radioFruitValue" data-no="1" class="meal_type_id" value="{{ $getMealTypeData['meal_type_id'] }}" dataname="{{ $getMealTypeData['meal_type_name'] }}" onclick="calculatePrice();" required="required">
                            <label for="radio{{ $getMealTypeData['meal_type_name'] }}">{{ $getMealTypeData['meal_type_name'] }}</label>
                            @endforeach </div>
                        </div>
                        <input type="hidden" name="" id="checkout_meal_type_name_value">
                      </div>
                      <div class="col-sm-12 mb-1" style="display: none;" id="only_snack_avoid_div">
                        <span id="only_snack_avoid" style="color: red;font-size: 12px;">To subscribe our Classic Meal Plan, please select one more meal type along with snacks.</span>
                      </div>
                      
                      <div class="col-sm-12 mb-1">
                        <div class="">
                          <label class="control-label">Price</label>
                          <div style="border:dotted" class="p-2">
                            <div class="offer-price"> <del> <span style="display: block;" id="close_value"></span> </del> </div>
                            <span class="og"  id="rs_html"> Rs.</span> <span class="og" id="final_value" ></span> | <span class="og" id="final_value_details"></span> </div>
                          <input type="hidden" name="price" id="price">
                          <input type="hidden" id="total" name="total">
                          <input type="hidden" id="discount_value" name="discount">
                        </div>
                      </div>
                    </div>
                    <span style="font-size: 12px;"><span style="color: #e81212;">*</span> 5% GST applicable</span> 
                    
                    <!-- </form> --> 
                  </div>
                  <!-- Choose Plane End-->
                  <div class="tab-pane ui-tabs-panel" id="payment">
                    <div class="col-sm-12">
                      <div class="col-sm-12" style="text-align: center;"> <span id="alreadyexits"></span> <span style="color: red;font-size: 15px;" id="err_avoid_or_dislike_food"></span> </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-12 mb-1">
                        <label class="control-label">
                        <label class="control-label">Address <span style="color: red;">*</span></label>
                        <textarea class="form-control" placeholder="Address" name="address1" id="address1" rows="2" required="required"></textarea>
                        <span id="err_address1" class="text-danger"></span>
                      </div>
                      <div class="col-sm-4 mb-1">
                        <label class="control-label">Pincode <span style="color: red;">*</span></label>
                        <input type="text" placeholder="Pincode" name="pincode1" id="pincode1" class="form-control" required="required" onkeypress="return isNumberKey(event)" maxlength="6" minlength="6">
                        <span id="err_pincode1" class="text-danger"></span>
                      </div>
                      <div class="col-sm-4 mb-1" id="mealtype_div">
                        <label class="control-label">Select meal type</label>
                        <select multiple id="mealtype1" name="address1_meal[]" onchange="selectSessionValue('mealtype1');">
                          <!-- <option value="Breakfast">Breakfast</option>
                              <option value="Lunch">Lunch</option>
                              <option value="Snack">Snack</option>
                              <option value="Dinner">Dinner</option> -->
                        </select>
                      </div>
                      <input type="hidden" name="" id="checkout_address1_meal1">
                    </div>
                    <div class="row secondaddress">
                      <div class="col-sm-12 mb-1">
                        <label class="control-label">Address 2</label>
                        <textarea class="form-control" placeholder="Address 2" name="address2" id="address2" rows="2"></textarea>
                      </div>
                      <div class="col-sm-4 mb-1">
                        <label class="control-label">Pincode 2</label>
                        <input type="text" placeholder="Pincode 2" name="pincode2" id="pincode2" class="form-control" onkeypress="return isNumberKey(event)" maxlength="6" minlength="6">
                      </div>
                      <div class="col-sm-4 mb-1">
                        <label class="control-label">Select meal type</label>
                        <select multiple id="mealtype2" name="address2_meal[]" onchange="selectSessionValue('mealtype2');">
                          <!--  <option value="Breakfast">Breakfast</option>
                              <option value="Lunch">Lunch</option>
                              <option value="Snack">Snack</option>
                              <option value="Dinner">Dinner</option> -->
                        </select>
                      </div>
                      <input type="hidden" name="" id="checkout_address1_meal2">
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" value="1" name="optionsCheckboxes" class="showDive" id="optionsCheckboxes" onchange="showAddress();">
                          </label>
                          Is your evening address same?</div>
                      </div>
                      <div class="col-md-12">
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" value="1" name="termsConditions" class="showDive" id="termsConditions" required="required">
                          </label>
                          <a href="{{url('')}}/terms_conditions">I Agree With Terms & Conditions? <span style="color: red;">*</span></a><br>
                          <span id="err_termsConditions" style="color: red;font-size: 13px;"></span> </div>
                      </div>
                    </div>
                    <!--<strong style="color: red;">* 5% GST applicable</strong> --> 
                  </div>
                  
                  <!-- Checkout Section Open-->
                  <div class="tab-pane ui-tabs-panel" id="checkout">
                    <div class="row"> 
                      <!-- Invoice -->
                      
                      <div class="row invoice row-printable">
                        <div class="col-md-12"> 
                          <!-- col-lg-12 start here -->
                          <div class="panel panel-default plain" id="dash_0"> 
                            <!-- Start .panel -->
                            <div class="panel-body p30">
                              <div class="row ml-2 mr-2">
                                <div class="col-lg-6"> 
                                  <!-- <div class="invoice-logo"><img width="100" src="https://nutridock.com/public/front/img/logo.png" alt="Invoice logo"></div> --> 
                                </div>
                                <div class="col-lg-6">
                                  <div class="invoice-from">
                                    <ul class="list-unstyled text-right">
                                      <li>Nutridock, Store B-17,MIDC Ambad</li>
                                      <li>Nashik,Maharashtra 422010</li>
                                      <li>GST EU826113958<br>
                                      </li>
                                    </ul>
                                  </div>
                                </div>
                                <div class="col-lg-12 text-right text-danger" ><small>Note : Please check & confirm your plan details</small></div>
                                <div class="col-lg-12 border-top pt-3 mt-2">
                                    <div style="text-align: center; display: none;" id="all_details" >
                                        <span id="err_all_details" style="color: red;"> </span>
                                      </div>
                                  
                                  <div class="invoice-to mt-3 mb-3">
                                    <table>
                                      <tr>
                                        <td>Name</td>
                                        <td class="text-center" style="width:35px"> : </td>
                                        <td style="min-width: 76%;"><span id="checkout_name"></span></td>
                                      </tr>
                                      <tr>
                                        <td> Mobile No.</td>
                                        <td class="text-center" style="width:35px"> : </td>
                                        <td>+91 <span id="checkout_phone_no"></span></td>
                                      </tr>
                                      <tr>
                                        <td>Email</td>
                                        <td class="text-center" style="width:35px"> : </td>
                                        <td><span id="checkout_email"></span></td>
                                      </tr>
                                      <tr>
                                        <td>Address-1 </td>
                                        <td class="text-center" style="width:35px"> : </td>
                                        <td><span id="checkout_address1"></span> <span id="openbrk1" style="display: none;">(</span><span id="checkout_address1_meal"></span><span id="openbrk2" style="display: none;">)</span></td>
                                        <!-- X-46, MIDC,Ambad, Nashik, 4221021 --> 
                                      </tr>
                                      <tr id="checkout_address2_div" style="display: none;">
                                        <td>Address-2</td>
                                        <td class="text-center" style="width:35px"> : </td>
                                        <td><span id="checkout_address2"></span> (<span id="checkout_address2_meal"></span><span id="checkout_address1_meal"></span>)</td>
                                        <!-- Hari om appartment,Nasik road, 4221021 --> 
                                      </tr>
                                    </table>
                                  </div>
                                  <div class="invoice-items mt-3">
                                    <div class="table-responsive" style="overflow: hidden; outline: none;" tabindex="0">
                                      <table class="table table-bordered">
                                        <thead>
                                          <tr>
                                            <th class=" br-0">No. of days</th>
                                            <th class="per70 br-0">Meal Plan</th>
                                            <th class="per5 text-right bl-0 br-0">Meal Type</th>
                                            <th class="per25 text-right bl-0">Total</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td class="br-0"><span id="checkout_no_of_days"></span> Days</td>
                                            <td class="text-left br-0 bl-0">Classic</td>
                                            <td class="text-right br-0 bl-0"><span id="checkout_meal_type_name" ></span></td>
                                            <td class="text-right bl-0"><span id="checkout_price"></span>/-</td>
                                          </tr>
                                          <!--  <tr>
                                          <td>5 Days</td>
                                            <td>Logo design</td>
                                            <td class="text-center">1</td>
                                            <td class="text-center">200.00</td>
                                        </tr> -->
                                          
                                        </tbody>
                                        <tfoot>
                                          <!-- <tr>
                                            <th colspan="3" class="text-right">Sub Total:</th>
                                            <th class="text-right">237.00</th>
                                        </tr> -->
                                          <tr>
                                            <th colspan="3" class="text-right br-0" style="border-bottom: 0px;">GST</th>
                                            <th class="text-right bl-0" style="border-bottom: 0px;">5% </th>
                                          </tr>
                                          <tr>
                                            <th colspan="3" class="text-right br-0" style="border-top: 0px;">Total</th>
                                            <th class="text-right bl-0" style="border-top: 0px;"><span id="checkout_final_gst_value"></span> </th>
                                            <!-- 284.4.40 --> 
                                          </tr>
                                          
                                          <tr>
                                            <td colspan="3" style="border-right: 0;">
                                              <button class="btn float-right btn-sm" onclick="applyCoupon();">Apply coupon</button>
                                            </td>
                                            <td id="empty_td"></td>
                                            <td class="bl-0" style="width: 150px; display: none;" id="coupon_code">
                                             <input type="text" name="coupon_code" id="coupon_code_value" class="mx-auto d-block" onkeyup="couponCodeValue();" style="max-width: 90px;">
                                             <input type="hidden" id="days">
                                             <input type="hidden" id="end_date">
                                             <input type="hidden" id="coupon_code_id">
                                             <span id="err_coupon_code" style="font-size: 10px;color: red;"></span>
                                            </td>
                                        </tr>
                                        <tr style="display: none;" id="extension_message_row"><td colspan="4" style="font-size: 13px; color: green;"><div id="extension_message" style="border: #999 dashed 1px;" class="alert-info p-2 text-center"></div></td></tr>
                                        </tfoot>
                                      </table>
                                    </div>
                                  </div>
                                  <!--  <div class="invoice-footer mt25">
                                        <p class="text-center pb-0"> <a href="#" class="btn btn-success ml15"><i class="fa fa-send mr5"></i> Pay Now  </a></p>
                                    </div> --> 
                                </div>
                                <!-- col-lg-12 end here --> 
                              </div>
                              <!-- End .row --> 
                            </div>
                          </div>
                          <!-- End .panel --> 
                        </div>
                        <!-- col-lg-12 end here --> 
                      </div>
                      <!-- Invoice --> 
                      
                    </div>
                  </div>
                  <!-- Checkout Section Close --> 
                </div>
                <div class="wizard-footer">
                  <div class="pull-right" id="next_butn1">
                    <input type='button' class='btn btn-next btn-fill btn-success btn-wd' name='next' value='Next' onclick="submitFirstForm();" id="" rel=""/>
                  </div>
                  <div class="pull-right" id="next_butn2">
                    <input type='button' class='btn btn-next btn-fill btn-success btn-wd' name='next' value='Next' onclick="submitCheckBox();" id="next_butn2_input" rel="" />
                    <form id="web_order_summery_form" action="{{url('')}}/subscription_payment" method="post">
                      {{csrf_field()}}
                      <input type="hidden" id="razorpay_payment_id" name="razorpay_payment_id">
                      <input type="hidden" id="id" name="id">
                      <input type='button' class='btn btn-finish btn-fill btn-success btn-wd' name='finish' value='Pay Now' onclick="submitFormPersonal();" id="rzp-button"/>
                      <!--  <p class="text-center pb-0"> <a href="#" class="btn btn-success ml15"><i class="fa fa-send mr5"></i> Pay Now  </a></p> -->
                    </form>
                  </div>
                  <div class="pull-left">
                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />
                  </div>
                  <div class="clearfix"></div>
                </div>
                <!-- </form> --> 
                
              </div>
            </div>
            <!-- wizard container --> 
          </div>
        </div>
        <!-- row --> 
      </div>
    </div>
  </div>
</section>
<script type="text/javascript" src="{{url('')}}/public/js/form-wizard.js"></script> 
<script type="text/javascript" src="{{url('')}}/public/front/js/bootstrap-datepicker.min.js"></script> 
<script src="https://checkout.razorpay.com/v1/checkout.js"></script> 
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script> 
<script type="text/javascript">
$('#start_date').dateTimePicker({
    limitMin: new Date($("#start_date").val()),
});
</script> 
<script type="text/javascript">
$(document).ready(function() {
 $('#next_butn2').hide();
});
    
var mySessionId='';
$(document).ready(function() {
var x = new SlimSelect({
  select: '#demo'
});
var mySessionId = '<?php echo Session::getId(); ?>';
var x = new SlimSelect({
  select: '#mealtype1'
});

var x = new SlimSelect({
  select: '#mealtype2'
});
});

var final_value = '';
var no_of_days = '';
var val = [];
function calculatePrice()
{
  $('#final_value').html('Rs.0');
  $('#rs_html').hide();
  var no_of_days =   $('input[name="radNoOfDays"]:checked').attr('data-id');
  
  var subscribe_now_pkg_price_value = '';
  var subscribe_now_price_per_meal_value = '';
  var discount_on_amount_value = '';
  var discount_in_percent_value = '';
  $.ajax({
        type: "GET",
        url: "{{ URL::to('/') }}/getSubscribeNowPlanDuration/"+no_of_days,             
        dataType: "html",
        'async': false,
        success: function(response){
          //console.log(response);                    
          var obj = $.parseJSON(response);
          var i = 0;
           $.each(obj, function() {
            discount_on_amount_value = this[0].discount_on_amount;              
            discount_in_percent_value = this[0].discount_in_percent;              
            subscribe_now_pkg_price_value =  this[0].subscribe_now_pkg_price;
            subscribe_now_price_per_meal_value =  this[0].subscribe_now_price_per_meal;
          });
        }
    });
  var mealtype=0;
  $.each($("input[data-value='radioFruitValue']:checked"), function(i){
    mealtype++;
    val[i] = $(this).attr('dataname');
    
    if(mealtype==1){
    if(val[i] == "Snack"){
      $("#next_butn2_input").attr('disabled','disabled');
      $("#only_snack_avoid_div").show();
      $("#only_snack_avoid").show();
      return false;
    }else if(val[i] == "Dinner"){
      $("#next_butn2_input").attr('disabled',false);
      $("#only_snack_avoid_div").hide();
      $("#only_snack_avoid").hide();
    }else{
      $("#next_butn2_input").attr('disabled',false);
      $("#only_snack_avoid_div").hide();
      $("#only_snack_avoid").hide();
    }
   }else{
      $("#next_butn2_input").attr('disabled',false);
      $("#only_snack_avoid_div").hide();
      $("#only_snack_avoid").hide();
   }
        
    //var cal_value = no_of_days * mealtype * subscribe_now_price_per_meal_value;
    var final_gst_value = '';
    if(no_of_days==7){
      if(subscribe_now_pkg_price_value==0){
      if(discount_on_amount_value == 0){
        var discount_amt = cal_value * 5 / 100;
        var final_value = (cal_value - discount_amt);
        var gst_value = final_value * 5 / 100;
        var final_gst_value = final_value + gst_value;
       
        $('#final_value').html('Rs.'+final_value);
        $('#price').val(final_gst_value);
        $('#total').val(final_value);
        $('#discount_value').val(discount_amt);

        $('#final_value_details').html('Rs. 314.00 per meal');
        $('#close_value').html('Rs.'+ cal_value+' for 7 days | Rs. 330 per meal');
        $("#checkout_price").html(final_value);
        $("#checkout_final_gst_value").html(final_gst_value);  
      }else{
        var final_value = cal_value - discount_on_amount_value;
        var gst_value = final_value * 5 / 100;
        var final_gst_value = final_value + gst_value;
       
        $('#final_value').html('Rs.'+final_value);
        $('#price').val(final_gst_value);
        $('#total').val(final_value);
        $('#discount_value').val(discount_on_amount_value);

        $('#final_value_details').html('Rs. 314.00 per meal');
        $('#close_value').html('Rs.'+ cal_value+' for 7 days | Rs. 330 per meal');
        $("#checkout_price").html(final_value);
        $("#checkout_final_gst_value").html(final_gst_value);  
      }
    }else{
      $('#final_value').html('Rs.'+subscribe_now_pkg_price_value);
      $('#gst_value').val(0);
      $('#price').val(subscribe_now_pkg_price_value);

      $('#final_value_details').html('Rs. 314.00 per meal');
      $('#close_value').html('Rs.'+ cal_value+' for 7 days | Rs. 330 per meal');
      $("#checkout_price").html(subscribe_now_pkg_price_value);
      $("#checkout_final_gst_value").html(subscribe_now_pkg_price_value);
    }
    }
    if(no_of_days==15){
      if(subscribe_now_pkg_price_value==0){
      if(discount_on_amount_value == 0){
      var discount_amt = cal_value * 12 / 100;
      var final_value = (cal_value - discount_amt);
      var gst_value = final_value * 5 / 100;
      var final_gst_value = final_value + gst_value;
      
      $('#final_value').html('Rs.'+final_value);
      $('#price').val(final_gst_value);    
      $('#total').val(final_value);
      $('#discount_value').val(discount_amt);

      $('#final_value_details').html('Rs. 290.00 per meal'); 
      $('#close_value').html('Rs.'+ cal_value+' for 15 days | Rs. 330 per meal');
      $("#checkout_price").html(subscribe_now_pkg_price_value);
      $("#checkout_final_gst_value").html(subscribe_now_pkg_price_value);
    }else{
        var final_value = cal_value - discount_on_amount_value;
        var gst_value = final_value * 5 / 100;
        var final_gst_value = final_value + gst_value;
       
        $('#final_value').html('Rs.'+final_value);
        $('#price').val(final_gst_value);
        $('#total').val(final_value);
        $('#discount_value').val(discount_on_amount_value);

        $('#final_value_details').html('Rs. 290.00 per meal'); 
        $('#close_value').html('Rs.'+ cal_value+' for 15 days | Rs. 330 per meal');
        $("#checkout_price").html(final_value);
        $('#gst_lable').hide();
        $("#checkout_final_gst_value").html(final_gst_value);
    }
      }else{
          $('#final_value').html('Rs.'+subscribe_now_pkg_price_value);
          $('#gst_value').val(0);
          $('#price').val(subscribe_now_pkg_price_value);

          $('#final_value_details').html('Rs. 290.00 per meal'); 
          $('#close_value').html('Rs.'+ cal_value+' for 15 days | Rs. 330 per meal');
          $("#checkout_price").html(subscribe_now_pkg_price_value);
          $("#checkout_final_gst_value").html(subscribe_now_pkg_price_value);
      }
    }

    if(no_of_days==30){
      if(subscribe_now_pkg_price_value==0){
      if(discount_on_amount_value == 0){
      var discount_amt = cal_value * 20 / 100;
      var final_value = (cal_value - discount_amt);
      var gst_value = final_value * 5 / 100;
      var final_gst_value = final_value + gst_value;
      
      $('#final_value').html('Rs.'+final_value);
      $('#price').val(final_gst_value);
      $('#total').val(final_value);
      $('#discount_value').val(discount_amt);

      $('#final_value_details').html('Rs. 264.00 per meal');   
      $('#close_value').html('Rs.'+ cal_value+' for 30 days | Rs. 330 per meal');
      $("#checkout_price").html(final_value);
      $("#checkout_final_gst_value").html(final_gst_value);
    }else{
        var final_value = cal_value - discount_on_amount_value;
        var gst_value = final_value * 5 / 100;
        var final_gst_value = final_value + gst_value;
       
        $('#final_value').html('Rs.'+final_value);
        $('#price').val(final_gst_value);
        $('#total').val(final_value);
        $('#discount_value').val(discount_on_amount_value);

        $('#final_value_details').html('Rs. 264.00 per meal');   
        $('#close_value').html('Rs.'+ cal_value+' for 30 days | Rs. 330 per meal');
        $("#checkout_price").html(final_value);
        $("#checkout_final_gst_value").html(final_gst_value);
    }
      }else{
          $('#final_value').html('Rs.'+subscribe_now_pkg_price_value);
          $('#gst_value').val(0);
          $('#price').val(subscribe_now_pkg_price_value);

          $('#final_value_details').html('Rs. 264.00 per meal');   
          $('#close_value').html('Rs.'+ cal_value+' for 30 days | Rs. 330 per meal');
          $("#checkout_price").html(subscribe_now_pkg_price_value);
          $("#checkout_final_gst_value").html(subscribe_now_pkg_price_value);
      }
    }
  
   if(no_of_days==60){
    if(subscribe_now_pkg_price_value==0){
      if(discount_on_amount_value == 0){
      var discount_amt = cal_value * 25 / 100;
      var final_value = (cal_value - discount_amt);
      var gst_value = final_value * 5 / 100;
      var final_gst_value = final_value + gst_value;
      
      $('#final_value').html('Rs.'+final_value);
      $('#price').val(final_gst_value);  
      $('#total').val(final_value);
      $('#discount_value').val(discount_amt);

      $('#final_value_details').html('Rs. 248.00 per meal');      
      $('#close_value').html('Rs.'+ cal_value+' for 60 days | Rs. 330 per meal');
      $("#checkout_price").html(final_value);
      $("#checkout_final_gst_value").html(final_gst_value);
    }else{
        var final_value = cal_value - discount_on_amount_value;
        var gst_value = final_value * 5 / 100;
        var final_gst_value = final_value + gst_value;
        //console.log(final_gst_value);
       
        $('#final_value').html('Rs.'+final_value);
        $('#price').val(final_gst_value);
        $('#total').val(final_value);
        $('#discount_value').val(discount_on_amount_value);

        $('#final_value_details').html('Rs. 248.00 per meal');      
        $('#close_value').html('Rs.'+ cal_value+' for 60 days | Rs. 330 per meal');
        $("#checkout_price").html(final_value);
        $("#checkout_final_gst_value").html(final_gst_value);
    }
    }else{
          $('#final_value').html('Rs.'+subscribe_now_pkg_price_value);
          $('#gst_value').val(0);
          $('#price').val(subscribe_now_pkg_price_value);

         $('#final_value_details').html('Rs. 248.00 per meal');      
         $('#close_value').html('Rs.'+ cal_value+' for 60 days | Rs. 330 per meal');
         $("#checkout_price").html(subscribe_now_pkg_price_value);
         $("#checkout_final_gst_value").html(subscribe_now_pkg_price_value);
    }
  }
   // }
  });
}

function showAddress()
{
    if ($('#optionsCheckboxes').is(":checked")){
       $("#mealtype_div").hide();
          $(".secondaddress").hide();
    }else{
      $("#mealtype_div").show();
          $(".secondaddress").show();
    }
}

function submitFirstForm(){
  var $myDiv = $("#next_butn1");
  $("#next_butn1").hide();

  $('#next_butn2').show();
  var full_name = $("input[name='full_name']").val();
  var email = $("input[name='email']").val();
  var phone_no = $("input[name='phone_no']").val();
  
  //$("#checkout_meal_type_id").html(meal_type_id1);
  var _token= '{{csrf_token()}}';

  if(full_name==""){
    $('#err_full_name').html("Please enter full name.");
    return false;
  }else if(email==""){
    $('#err_email').html("Please enter valid email id.");
    return false;
  }else if(phone_no==""){
    $('#err_mobile_no').html("Please enter mobile no.");
    return false;
  }else{

    $("#checkout_name").html(full_name);
    $("#checkout_phone_no").html(phone_no); 
    $("#checkout_email").html(email);
   
    $("#checkout_pincode1").html(pincode1);
    $("#checkout_pincode2").html(pincode2);

  $.ajax({
        type: "POST",
        url: "{{ URL::to('/') }}/postFormDetails",             
        data: {
        _token: _token,full_name: full_name, email: email, phone_no: phone_no
              },
        'async': false,
        success: function(response){
          var data = $.parseJSON(response);

          if(data.message == 'error'){
            
            alert('You are already subscribed with us');
            return false;
          }
        },
    });
  }
}

var meal_type_name = [];
var meal_type_name1 = [];
var meal_type_name2 = [];
function submitCheckBox()
{
$("#checkout_meal_type_name_value").empty();  
$.each($("input[name='radioFruit[]']:checked"), function(){
    meal_type_name.push($(this).attr('dataname'));     
});
    
var unique = [];
unique = meal_type_name.filter(function(itm, i, a) {
    return i == meal_type_name.indexOf(itm);
});

$("#checkout_meal_type_name_value").val(unique);
    var checkout_meal_type_value = $("#checkout_meal_type_name_value").val();
    $("#checkout_meal_type_name").html(checkout_meal_type_value);

var $option = [];
var $mySelect = '';

var selectValues;
selectValues = unique;
$mySelect = $('#mealtype1');

var $option = '';
$('#mealtype1').empty();
$.each(unique, function(key, value) {
  $option = $("<option/>", {
   value:  value,
    text: value
  });
  $("#mealtype1").append($option);
}); 

$mySelect = $('#mealtype2');
$('#mealtype2').empty();
$.each(selectValues, function(key, value) {
  $option = $("<option/>", {
    value: value,
    text: value
  });
  $("#mealtype2").append($option);
  //$.session.set("myVar", "99");

}); 

  var subscribe_now = $('input[name="radNoOfDays"]:checked').attr('data-id');
  $("#checkout_no_of_days").html(subscribe_now);
  $("#checkout_address1").html($('#address1').val());
  
      if($('#address2').val().length!=0){
        $('#checkout_address2_div').show();
        $('#openbrk1').show();
        $('#openbrk2').show();
        $("#checkout_address2").html($('#address2').val());
      }
  
    $("#checkout_address1_meal").html();
    $("#checkout_address2_meal").html();
}


function selectSessionValue(id)
{
  var idv = $('#'+id).val();
  //console.log(idv);
  if(id == "mealtype1")
  {
    $("#checkout_address1_meal1").val(idv);
    var checkout_address1_meal1_val = $("#checkout_address1_meal1").val();
    $("#checkout_address1_meal").html(checkout_address1_meal1_val);
  }
  if(id == "mealtype2")
  {
    $("#checkout_address1_meal2").val(idv);
    var checkout_address1_meal2_val = $("#checkout_address1_meal2").val();
    $("#checkout_address2_meal").html(checkout_address1_meal2_val);
  }
}

var razor_amount = '';
var razor_name = '';
var razor_email = '';
var options = '';
var razor_phone_no = '';
var razor_address = '';
var razor_id = '';
function submitFormPersonal()
{
  var full_name = $("input[name='full_name']").val();
  var email = $("input[name='email']").val();
  var phone_no = $("input[name='phone_no']").val();
  var _token= '{{csrf_token()}}';
  var age = $("input[name='age']").val();
  var gender = $("#gender").val();
  var weight = $("input[name='weight']").val();
  var height_in_feet= $("input[name='height_in_feet']").val();
  var height_in_inches= $("input[name='height_in_inches']").val();
  var physical_activity_id= $("#physical_activity_id").val();
  var avoid_or_dislike_food_id= $("#demo").val();
  var address1_meal= $("#checkout_address1_meal1").val();
  var address2_meal= $("#checkout_address1_meal2").val();
  var other_food= $("input[name='other_food']").val();
  var total= $("input[name='total']").val();
  var price= $("input[name='price']").val();
  var discount= $("input[name='discount']").val();
  var food_precautions= $("#food_precautions").val();
  var lifestyle_disease= $("#lifestyle_disease").val();
  var start_date= $("#start_date").val();
  var subscribe_now_plan_duration_id = $('input[name="radNoOfDays"]:checked').val();
  var coupon_code_id  = $("#coupon_code_id").val();
  
  var meal_type_id = [];
    $.each($("input[name='radioFruit[]']:checked"), function(){
      meal_type_id.push($(this).val());
  });
  meal_type_id = meal_type_id.toString();
  //console.log(meal_type_id);


  var address1= $("#address1").val();
  var pincode1= $("#pincode1").val();
  var address2= $("#address2").val();
  var pincode2= $("#pincode2").val();
  

  if(full_name==""){
    $('#err_full_name').html("Please enter full name.");
    $('#all_details').show();
    $('#err_all_details').html("Please fill all your details");
    return false;
  }else if(email==""){
    $('#err_email').html("Please enter email.");
    $('#all_details').show();
    $('#err_all_details').html("Please fill all your details");
    return false;
  }else if(avoid_or_dislike_food_id==""){
    $('#err_avoid_or_dislike_food').html("Please select the details");
    $('#all_details').show();
    $('#err_all_details').html("Please fill all your details");
    return false;
  }else if(age==""){
    $('#err_age').html("Please enter your age");
    $('#all_details').show();
    $('#err_all_details').html("Please fill all your details");
    return false;   
  }else if(phone_no==""){
    $('#err_mobile_no').html("Please enter mobile no.");
    $('#all_details').show();
    $('#err_all_details').html("Please fill all your details");
    return false;
  }else if(address1==""){
    $('#err_address1').html("Please enter address");
    $('#all_details').show();
    $('#err_all_details').html("Please fill all your details");
    return false;
  }else if(pincode1==" "){
    $('#err_pincode1').html("Please enter pincode");
    $('#all_details').show();
    $('#err_all_details').html("Please fill all your details");
    return false;
  }else if($('input[id="termsConditions"]:checked').length == 0 ){
    $('#err_termsConditions').html("This field is required.");
    $('#all_details').show();
    $('#err_all_details').html("Please fill all your details");
    return false;
  }else{
  
  $.ajax({
        type: "POST",
        url: "{{ URL::to('/') }}/postPersonalDetails",             
        data: {_token: _token,full_name: full_name, email: email, phone_no: phone_no,age: age,gender: gender,weight: weight,height_in_feet: height_in_feet,height_in_inches: height_in_inches,physical_activity_id: physical_activity_id,avoid_or_dislike_food_id:avoid_or_dislike_food_id,address1_meal:address1_meal,address2_meal:address2_meal, other_food:other_food, price:price,total:total,discount:discount, food_precautions: food_precautions,lifestyle_disease:lifestyle_disease, start_date: start_date,subscribe_now_plan_duration_id: subscribe_now_plan_duration_id,meal_type_id: meal_type_id,address1: address1,pincode1: pincode1,address2: address2,pincode2: pincode2,coupon_code_id:coupon_code_id
        },
          'async': false,
          success: function(result){
            console.log(result);
            var data = $.parseJSON(result);
            razor_amount = data.amount;
            razor_name = data.name;
            razor_email = data.email;
            razor_phone_no = data.phone_no;
            razor_address = data.address;
            razor_id = data.id;
          
            options = {
              "key": "rzp_live_nIAT6tuTld7O9t",
              /*rzp_live_nIAT6tuTld7O9t*/
              /*rzp_test_KcySdv9YlIpqGP*/
              
              "amount": razor_amount*100,//100 
              "currency": "INR",
              "name": "Nutridock",
              "description": "",
              "image": "{{url('')}}/public/front/img/logo.png",
              "handler": function (response){
                $('#razorpay_payment_id').val(response.razorpay_payment_id);
                $('#id').val(razor_id);
                document.getElementById("web_order_summery_form").submit();
              },
              "prefill": {
                  "name": razor_name,
                  "email": razor_email,
                  "contact": razor_phone_no
              },
              "notes": {
                  "address": razor_address
              },
              "theme": {
                  "color": "#000"
              }
            };

            var rzp1 = new Razorpay(options);
            rzp1.open();
        }
    });
  }
}

$('#demo').on('change', function (e) {
$('#other_food_div').hide();
    var avoid_dislike_food = $('#demo').val();
    //console.log(avoid_dislike_food);
    $("#demo :selected").each(function() {
      if(this.value == "Other")
      {
        $('#other_food_div').show();
      }else if(this.value != "Other"){
        //console.log(this.value);
        $('#other_food_div').hide();
      }else{
        $('#other_food_div').hide();
      }
    });
     
});

function applyCoupon()
{
  $("#coupon_code").show();
  $("#empty_td").hide();
}

function couponCodeValue(){
  var coupon_code_value = $("#coupon_code_value").val();
  var _token= '{{csrf_token()}}';
  $.ajax({
      type: "GET",
      url: "{{ URL::to('/') }}/getCouponCode",             
      data: {_token: _token,coupon_code_value: coupon_code_value
      },
      'async': false,
      success: function(result){
       if(result.length === 2){
        $('#err_coupon_code').html("Coupon code not available");
       }else{
        $('#err_coupon_code').hide();
        var data = $.parseJSON(result);
        var coupon = data[0].coupon_code_id;
        var extension_days = data[0].extension_days;
        $("#coupon_code_id").val(coupon);
        var extension_msg  = "Coupon code applied successfully.You have got "+extension_days+" days of extension.";
        $("#extension_message_row").show();
        var date = new Date($("#start_date").val());
        $("#extension_message").html(extension_msg);
       }
    }
  });
}

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
</script> 
@endsection 