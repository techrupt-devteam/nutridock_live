<?php 
    $filename ="Subscribe Now Plan Export.xls";
    header('Content-type: application/ms-excel');
    header('Content-Disposition: attachment; filename='.$filename); ?>
<table class="table table-striped table-bordered table-hover" id="sample_6" width="100%" border="1">
	<thead>
		<tr>
			<th width="4%" colspan="1" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Rendering engine: activate to sort column ascending" role="columnheader" tabindex="0">Sr. No.</th>
            <th width="11%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Name</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Email</th>
            <th width="15%" colspan="1" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0"> Mobile No</th>
            <th width="15%" colspan="1" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" > Age</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Gender</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Weight</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Height-Feet</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Height-Inch</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Physical Activity</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Avoid / Dislike Food</th> 
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Any lifestyle disease?</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Any food precaution instructions?</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Start Date</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Expiry Date</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Extended Date</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >No. of days</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Type of meals</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Price</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Address 1</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Pincode 1</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Address 2</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Pincode 2</th>
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Link </th>
            
            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Comments </th>

            <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" > Created at</th>
          </tr>
	</thead>
<tbody>
      
    <?php if($arr_data){
        $o = 1;
        
        foreach($user_arr_data as $row);
        foreach($arr_data as $val):
        /*physical_activity start*/
        $physical_activity_id = $val->physical_activity_id;
        if($physical_activity_id!=0){
            $physical_activity_value     = \DB::table('physical_activity')
                      ->where('physical_activity_id',$physical_activity_id)
                      ->get();
            $physical_activity_data = $physical_activity_value->toArray();
            foreach($physical_activity_data as $physical_activity_row);
            $physical_activity_value = $physical_activity_row->physical_activity;
        }else{
            $physical_activity_value = '0';
        }
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
        <td><?php echo $row->email; ?></td>
        <td><?php echo $row->phone_no; ?></td>

        <td><?php echo $val->age; ?></td>
        <td><?php echo $val->gender; ?></td>
        <td><?php echo $val->weight; ?></td>
        <td><?php echo $val->height_in_feet; ?></td>
        <td><?php echo $val->height_in_inches; ?></td>
        <td><?php echo $physical_activity_value; ?></td>
        <td><?php 
        for($i=0;$i<count($explode_data); $i++){
        $food_avoid_data = \DB::table('food_avoid')->select('food_avoid_name')->where('food_avoid_id',$explode_data[$i])->get();
        for($j=0;$j<count($food_avoid_data); $j++){
        foreach($food_avoid_data as $food_avoid_row): 
            echo $food_avoid_row->food_avoid_name.' '; 
            endforeach; }  } ?></td>
        <td><?php echo $val->food_precautions; ?></td>
        <td><?php echo $val->lifestyle_disease; ?></td>
        <td><?php echo $val->start_date; ?></td>
        <td><?php echo $val->expiry_date; ?></td>
        <td><?php echo $val->extended_date; ?></td>
        <td><?php if($subscribe_now_plan_duration_id!=0){
        $subscribe_now_plan_duration_data = \DB::table('subscribe_now_plan_duration')->where('subscribe_now_plan_duration_id',$subscribe_now_plan_duration_id)->get();
        foreach($subscribe_now_plan_duration_data as $subscribe_now_plan_duration_row);
          echo $subscribe_now_plan_duration_row->subscribe_now_duration;}else{
            echo "0"; 
          } ?></td>
        <td><?php for($i=0;$i<count($explode_data); $i++){
        $meal_type_data = \DB::table('meal_type')->select('meal_type_name')->where('meal_type_id',$explode_data[$i])->get();
        for($j=0;$j<count($meal_type_data); $j++){
        foreach($meal_type_data as $meal_type_row): echo $meal_type_row->meal_type_name. ' ';
            endforeach; }  }
         ?></td>
        <td><?php echo $val->price; ?></td>
        <td><?php echo $val->address1; ?></td>
        <td><?php echo $val->pincode1; ?></td>

        <td><?php echo $val->address2; ?></td>
        <td><?php echo $val->pincode2; ?></td>
        <td><?php echo $val->link; ?></td>
        <td width="15%"><?php echo $val->comments; ?></td>
        <td><?php echo $val->created_at; ?></td>
      </tr>
      <?php $o++;
    endforeach;
  }?>
    </tbody>
</table>