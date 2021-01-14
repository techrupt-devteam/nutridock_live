<?php $filename ="webinar_export.xls";
header('Content-type: application/ms-excel');
header('Content-Disposition: attachment; filename='.$filename);
?><table class="table table-striped table-bordered table-hover" id="sample_6" width="100%" border="1">
							<thead>
							<tr>
								<th width="4%" colspan="1" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Rendering engine: activate to sort column ascending" role="columnheader" tabindex="0">Sr. No.</th>
                    <th width="11%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Name</th>
                    <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >Email</th>
                    <th width="15%" colspan="1" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" > Mobile No</th>
                    <th width="15%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >age</th>
                    <th width="14%" rowspan="1" class="sorting" aria-controls="dynamic-table" aria-label="Browser: activate to sort column ascending" role="columnheader" tabindex="0" >City</th>
                    
</tr>
							</thead>
							<tbody>
							 <?php if($arr_data){
	                           $i = 1;
	                           foreach($arr_data as $val){	
	                       ?>
  <tr>
    <td><?php echo $i;?></td>
    <td><?php echo $val['name']; ?></td>
   <td><?php echo $val['email']; ?></td>
   <td><?php echo $val['mobile']; ?></td>
   <td><?php echo $val['city']; ?></td>
   <td><?php echo $val['age']; ?></td>
    </tr>
  <?php $i++;}}?>
							
							</tbody>
							</table>