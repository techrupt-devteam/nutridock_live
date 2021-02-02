<?php
    $filename ="Subscribe Now Export Pr User All Data.xls";
    header('Content-type: application/ms-excel');
    header('Content-Disposition: attachment; filename='.$filename); ?>
<table class="table table-striped table-bordered table-hover" id="sample_6" width="100%" border="1">
	<thead>
		<tr>
			<th width="4%" colspan="1" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Rendering engine: activate to sort column ascending" role="columnheader" tabindex="0">Sr.No.</th>
            <th width="11%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Name</th>
            <th width="15%" colspan="1" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0"> Mobile No</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Order Date</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Start Date</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Expiry Date</th>
            <th width="15%" colspan="1" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" > Plan</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Meal</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Plan Link</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0">Amount</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0">Payment Status</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0">Subscription Id</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Comments</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Approve Status</th>
      </tr>
	</thead>
<tbody>
    <?php
    //print_r($arr_data); die;

     if($arr_details){
        $o = 1;
        foreach($arr_data as $row);
        foreach($arr_details as $val): 
        /*physical_activity start*/
        $physical_activity_id = $val->physical_activity_id;
        $physical_activity_value     = \DB::table('physical_activity')
                      ->where('physical_activity_id',$physical_activity_id)
                      ->get();
        $physical_activity_data = $physical_activity_value->toArray();
        foreach($physical_activity_data as $physical_activity_row);
        /*physical_activity end*/

        /*food_avoid_data start*/
        $food_id = $val->avoid_or_dislike_food_id;
        $explode_data = explode(",",$food_id);
        $food_avoid_data = [];
        /*food_avoid_data end*/

        /*subscribe_now_plan_duration start*/
        $subscribe_now_plan_duration_id = $val->subscribe_now_plan_duration_id;
        /*subscribe_now_plan_duration end*/

        /*meal_type start*/
        $meal_type_id = $val->meal_type_id;
        $explode_data = explode(",",$meal_type_id);
        $meal_type_data = [];
        /*meal_type end*/
    ?>
      <tr>
        <td><?php echo $o;?></td>
        <td><?php echo $val->name; ?></td>
        <td style="text-align: left;"><?php echo $row->phone_no; ?></td>
        <td style="text-align: left;"><?php echo date('d M', strtotime($val->created_at)); ?></td>
        <td style="text-align: left;"><?php echo date('d M', strtotime($val->start_date)); ?> </td>
        <td style="text-align: left;"><?php echo date('d M', strtotime($val->expiry_date)); ?> </td>
        <td><?php
        $subscribe_now_plan_duration_id = $val->subscribe_now_plan_duration_id;
        $subscribe_now_plan_duration_data = \DB::table('subscribe_now_plan_duration')->select('*')->where('subscribe_now_plan_duration_id',$subscribe_now_plan_duration_id)->get();
        if($subscribe_now_plan_duration_data){
        foreach($subscribe_now_plan_duration_data as $subscribe_now_plan_duration_row); ?>
        <span>Total&nbsp;</span><?php echo $subscribe_now_plan_duration_row->subscribe_now_duration ?? '0'; ?>&nbsp;Days <?php } ?></td>

        <td><?php 
           ?>
            <?php for($i=0;$i<count($explode_data); $i++){
            $meal_type_data = \DB::table('meal_type')->select('meal_type_name')->where('meal_type_id',$explode_data[$i])->get(); for($j=0;$j<count($meal_type_data); $j++){ 
                foreach($meal_type_data as $meal_type_row): 
                if($meal_type_row->meal_type_name == 'Breakfast'){
                echo 'B'; }else if($meal_type_row->meal_type_name == 'Lunch'){
                  echo 'L'; }else if($meal_type_row->meal_type_name == 'Snack'){
                    echo 'S'; }else if($meal_type_row->meal_type_name == 'Dinner'){
                      echo 'D';}
                  endforeach; 
                } } ?>
        </td>
        <td>
            <a <?php if($val->link){ ?> href="<?php echo $val->link; ?>" <?php }else{ ?> href="javascript:;" <?php  }?> target="_tab" class="plan-link btn-link">Link</a>
        </td>
        <td><?php echo $val->price; ?></td>
        <td><?php echo $val->payment_status; ?></td>
        <td><?php echo $val->subscription_id; ?></td>
        <td><?php echo $val->comments; ?></td>
        <td><?php echo $val->approve_status; ?></td>
      </tr>
      <?php $o++;
    endforeach;
  }?>
    </tbody>
</table>