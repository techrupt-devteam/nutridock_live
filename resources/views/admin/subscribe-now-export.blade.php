<?php
    $filename ="All Subscribe Now Export.xls";
    header('Content-type: application/ms-excel');
    header('Content-Disposition: attachment; filename='.$filename); ?>
<table class="table table-striped table-bordered table-hover" id="sample_6" width="100%" border="1">
	<thead>
		<tr>
      <th width="2%" colspan="1" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Rendering engine: activate to sort column ascending" role="columnheader" tabindex="0">Sr. No.</th>
      <th width="11%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Name</th>
      <th width="15%" colspan="1" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0"> Mobile No</th>
      <th width="9%" colspan="1" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" > Email</th>
      <th width="5%" colspan="1" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" > Total Plan</th>
      </tr>
	</thead>
<tbody>
      
    <?php
        if($arr_data){
        $o = 1;
        foreach($arr_data as $val): 
        $id = $val->id;
        $data = \DB::table('subscribe_now_details')->where('is_deleted','No')->where('subscribe_now_user_id',$id)->get(); ?>
      <tr>
        <td><?php echo $o;?></td>
        <td><?php echo $val->name; ?></td>
        <td style="text-align: left;"><?php echo $val->phone_no; ?></td>
        <td style="text-align: left;"><?php echo $val->email; ?></td>
        <td style="text-align: left;"><?php echo count($data); ?></td>
      </tr>
      <?php $o++;
    endforeach;
  }?>
    </tbody>
</table>