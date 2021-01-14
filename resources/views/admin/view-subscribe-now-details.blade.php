
@extends('admin.layouts.master')
@section('content')

<!-- Begin Page Content -->
    <div class="container-fluid">
      
      <div class="card shadow mb-4">
            <div class="card-header py-3">
             View Subscribe Now Details
              <a href="{{url('')}}/admin/view-subscribe-now" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back"><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <?php foreach($arr_data as $row); ?>
                <form action="{{url('')}}/admin/subscribe-now/update/{{$row->id }}" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <h6 style="color:black;">Personal Details</h6>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Full Name</label>
                                <input type="text" class="form-control" name="" placeholder="Full Name" value="<?php echo $row->name ?? '' ?>" readonly="readonly">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Email</label>
                                <input type="text" class="form-control" name="" placeholder="Email" value="<?php echo $row->email ?? '' ?>" readonly="readonly">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Mobile</label>
                                <input type="text" class="form-control" name="" placeholder="Mobile" value="<?php echo $row->phone_no ?? '' ?>" readonly="readonly">
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <h6 style="color:black;">Health Details</h6>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Age </label>
                                <input type="text" class="form-control" name="age" placeholder="Age" value="<?php echo $row->age ?? '' ?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Gender</label>
                                 <select class="form-control" name="gender">
                                    <option selected="selected" disabled="disabled" value="">Select</option>
                                    <option <?php if($row->gender=='Female'){ ?> selected="selected"<?php } ?> value="Female">Female</option>
                                    <option <?php if($row->gender=='Male'){ ?> selected="selected"<?php } ?> value="Male">Male</option> 
                                    <option <?php if($row->gender=='Other'){ ?> selected="selected"<?php } ?> value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Weight</label>
                                <input type="text" class="form-control" name="weight" placeholder="Weight" value="<?php echo $row->weight ?? '' ?>">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                <div class="col-lg-6 mb-2">
                                    <label class="label-control">Height - Feet </label>
                                    <input type="text" class="form-control" name="height_in_feet" placeholder="Feet" value="<?php echo $row->height_in_feet ?? '' ?>" >
                                </div>
                                <div class="col-lg-6 mb-2">
                                    <label class="label-control">Height - Inch</label>
                                    <input type="text" class="form-control" name="height_in_inches" placeholder="Inch" value="<?php echo $row->height_in_inches ?? '' ?>">
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                   
                    <div class="col-lg-3">
                        <div class="row">
                           <div class="col-lg-12 mb-3">
                                <label class="label-control">Physical Activity</label>
                                <select class="form-control" name="physical_activity_id">
                                    @foreach($physical_activity_data as $physical_activity_row)
                                        <option <?php if($row->physical_activity_id==$physical_activity_row->physical_activity_id ){ ?> selected="selected"<?php } ?> value="{{ $physical_activity_row->physical_activity_id }}">{{ $physical_activity_row->physical_activity }}</option> 
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-lg-3">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Avoid / Dislike Food </label><br>
                                <?php 
                                /*$var = array_diff( [312, 401, 15, 401, 3], [401] );
                                print_r($var); die;*/
                                $avoid_or_dislike_food_id = $row->avoid_or_dislike_food_id;
                                $abc = explode(",",$avoid_or_dislike_food_id);
                                $var_value = array_diff( $abc, ['Other'] );

                                
                                //if($avoid_or_dislike_food_id!="Other") {
                                    for($i=0;$i<count($abc); $i++){ 

                                        if($abc[$i]!='Other'){
                                            $foodavoiddata = \DB::table('food_avoid')->select('food_avoid_name')->where('food_avoid_id',$abc[$i])->get();
                                            //print_r(count($foodavoiddata)); die;
                                            for($j=0;$j<count($foodavoiddata); $j++){
                                            foreach($foodavoiddata as $food_avoid_row):
                                            //print_r($food_avoid_row->food_avoid_name); die; ?>
                                            <strong><?php echo $food_avoid_row->food_avoid_name; ?></strong><?php endforeach;
                                         }
                                        }else{ ?>
                                          <strong><?php echo " Other"; ?></strong> 
                                       <?php  }
                                       if($abc[$i]=='None'){ ?>
                                        <strong><?php echo "None"; ?></strong> 
                                       <?php } 
                                    } ?>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-2">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Other </label><br>
                                <span style="padding: 4px;"><b><?php echo $row->other_food ?? '' ?></b></span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-2">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Avoid / Dislike Food
                                </label><br>
                                <select multiple class="form-control" id="demo" name="avoid_or_dislike_food_id[]" onchange="onChangeAvoid();">
                                    <option value="None">None</option>
                                    <?php foreach($food_avoid_data as $row_food){ ?>
                                        <option value="<?php echo $row_food->food_avoid_id; ?>"><?php echo $row_food->food_avoid_name; ?></option>
                                    <?php } ?>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-2" style="display: none;" id="other_food_div">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Other&nbsp;Food</label><br>
                                <input type="text" name="other_food" class="form-control" placeholder="Other Food">
                            </div>
                        </div>
                    </div>
                   
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                            <label class="label-control">Any&nbsp;food&nbsp;preparation&nbsp;instructions?</label>
                                <textarea name="food_precautions" class="form-control" rows="3" placeholder="Any Food Precautions"><?php echo $row->food_precautions ?? '' ?></textarea>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Any&nbsp;lifestyle&nbsp;disease?&nbsp;(Diabetes,Cholesterol,etc)</label>
                                <textarea name="lifestyle_disease" class="form-control" rows="3" placeholder="Anylifestyle disease"><?php echo $row->lifestyle_disease ?? '' ?></textarea>
                            </div>
                        </div>
                    </div>
                
                </div>
                <hr>
                <h6 style="color:black;">Choose Plan</h6>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Start Date </label>
                                 <input type="date" class="form-control" name="start_date" placeholder="Start Date" value="<?php echo strftime('%Y-%m-%d',strtotime($row->start_date)); ?>">
                            </div>
                        </div>
                    </div>
                   
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">No. of days</label>
                                <select class="form-control" name="subscribe_now_plan_duration_id" id="subscribe_now_plan_duration_id" onchange="calculatePrice();">
                                    @foreach($subscribe_now_data_arr as $subscribe_now_data_row)
                                        <option data-id="{{ $subscribe_now_data_row->subscribe_now_duration }}" <?php if($row->subscribe_now_plan_duration_id==$subscribe_now_data_row->subscribe_now_plan_duration_id ){ ?> selected="selected"<?php } ?> value="{{ $subscribe_now_data_row->subscribe_now_plan_duration_id }}">{{ $subscribe_now_data_row->subscribe_now_duration }}</option> 
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <?php 
                        $meal_type_id = $row->meal_type_id;
                        $explode_data = explode(",",$meal_type_id);
                        $meal_type_data = []; ?>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Type of meals </label><br>
                               <select class="form-control" multiple name="meal_type_id[]" id="meal_type_id" onchange="calculatePrice();" data-value="radioFruitValue">
                                    <?php foreach($meal_type_data_arr as $arr_row){  ?>
                                        <option <?php if(in_array($arr_row->meal_type_id, $explode_data)) { echo "selected"; } ?> value="<?php echo $arr_row->meal_type_id; ?>"><?php echo $arr_row->meal_type_name; ?></option> 
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Total</label>
                                <input type="text" id="total" name="total" class="form-control" value="<?php echo $row->total ?? '' ?>" >
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Total GST</label>
                                <input type="text" id="gst_value" name="discount" class="form-control" value="<?php echo $row->discount ?? '' ?>">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Net Total</label>
                                <input type="text" class="form-control" name="price" placeholder="Price" value="<?php echo $row->price ?? '' ?>" id="price">
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Payment Status</label>
                                <input type="text" class="form-control" name="payment_status" placeholder="Payment Status" value="<?php echo $row->payment_status ?? '' ?>">
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <h6 style="color:black;">Delivery Details</h6>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Address 1 </label>
                                <textarea name="address1" class="form-control" rows="3" placeholder="Address 1"><?php echo $row->address1 ?? '' ?></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Address 2 </label>
                                 <textarea name="address2" class="form-control" rows="3" placeholder="Address 2"><?php echo $row->address2 ?? '' ?></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 ">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Pincode 1 </label>
                                <input type="text" class="form-control" name="pincode1" placeholder="Pincode 1" value="<?php echo $row->pincode1 ?? '' ?>">
                            </div>
                        </div>
                    </div>
                    <?php 
                        $address1_meal = $row->address1_meal;
                        $explode_meal_data1 = explode(",",$address1_meal);
                        $meal_type_data1 = []; ?>
                    <div class="col-lg-3 ">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Meal Type - </label>
                                <select class="form-control" multiple name="address1_meal[]">
                                    <?php foreach($meal_type_data_arr as $arr_row){ ?>
                                        <option <?php if(in_array($arr_row->meal_type_name, $explode_meal_data1)) { echo "selected"; } ?> value="<?php echo $arr_row->meal_type_name; ?>"><?php echo $arr_row->meal_type_name; ?></option> 
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 ">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Pincode 2 </label>
                                <input type="text" class="form-control" name="pincode2" placeholder="Pincode 2" value="<?php echo $row->pincode2 ?? '' ?>">
                            </div>
                        </div>
                    </div>
                     <?php 
                        $address2_meal = $row->address2_meal;
                        $explode_meal_data2 = explode(",",$address2_meal);
                        $meal_type_data2 = []; ?>
                    <div class="col-lg-3">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Meal Type - </label>
                                <select class="form-control" multiple name="address2_meal[]">
                                    <?php foreach($meal_type_data_arr as $arr_row){ ?>
                                        <option <?php if(in_array($arr_row->meal_type_name, $explode_meal_data2)) { echo "selected"; } ?> value="<?php echo $arr_row->meal_type_name; ?>"><?php echo $arr_row->meal_type_name; ?></option> 
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <div class="col-lg-12" style="text-align: center;">
                    <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit" > Submit </button>
                    <a href="{{url('')}}/admin/view-subscribe-now" class="btn btn-danger btn-md"> Cancel </a>
                </div>
                
                </div>
            </form>

            </div>
      </div>

     </div>

<script type="text/javascript">


function calculatePrice()
{

  var no_of_days =   $("#subscribe_now_plan_duration_id").val();
  
  var subscribe_now_pkg_price_value = '';
  var subscribe_now_price_per_meal_value = '';
  var no_of_days_value = '';
  $.ajax({
        type: "GET",
        url: "{{ URL::to('/') }}/admin/getSubscribeNowPlanDurationData/"+no_of_days,             
        dataType: "html",
        'async': false,
        success: function(response){
          var obj = $.parseJSON(response);
          var i = 0;
           $.each(obj, function() {
            no_of_days_value =  this[0].subscribe_now_duration;
            subscribe_now_pkg_price_value =  this[0].subscribe_now_pkg_price;
            subscribe_now_price_per_meal_value =  this[0].subscribe_now_price_per_meal;
          });
        }
    });

  var mealtype=0;
  if(subscribe_now_pkg_price_value==0){
    var mealtype = $('#meal_type_id option:selected').length;
    //     console.log(mealtype);
    var cal_value = no_of_days_value * mealtype * subscribe_now_price_per_meal_value;
    
    /*console.log(no_of_days_value);
    console.log(mealtype);
    console.log(subscribe_now_price_per_meal_value);
    console.log(cal_value);*/

    if(no_of_days_value==7){
      var percente_amt = cal_value * 5 / 100;
      var final_value = (cal_value - percente_amt);
      
      var gst_value = final_value * 5 / 100;
      var final_gst_value = final_value + gst_value;
      //console.log(final_gst_value);
      $('#total').val(final_value);
      $('#price').val(final_gst_value);
      $('#gst_value').val(percente_amt);
    }else if(no_of_days_value==15){
      var percente_amt = cal_value * 12 / 100;
      var final_value = (cal_value - percente_amt);
      var gst_value = final_value * 5 / 100;
      var final_gst_value = final_value + gst_value;
      
      $('#total').val(final_value);
      $('#price').val(final_gst_value);
      $('#gst_value').val(percente_amt);
    }else if(no_of_days_value==30){
      var percente_amt = cal_value * 20 / 100;
      var final_value = (cal_value - percente_amt);
      var gst_value = final_value * 5 / 100;
      var final_gst_value = final_value + gst_value;
      
      $('#total').val(final_value);
      $('#price').val(final_gst_value);
      $('#gst_value').val(percente_amt);
    }else if(no_of_days_value==60){
      var percente_amt = cal_value * 25 / 100;
      var final_value = (cal_value - percente_amt);
      var gst_value = final_value * 5 / 100;
      var final_gst_value = final_value + gst_value;
      
     $('#total').val(final_value);
     $('#price').val(final_gst_value);
     $('#gst_value').val(percente_amt);
    }
   

  }else{
        alert(2);
  }
}

function onChangeAvoid(){
 $('#other_food_div').hide();
 var avoid_dislike_food = $('#demo').val();
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
}

</script>
@endsection
