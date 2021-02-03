@extends('admin.layouts.master')
@section('content')

<!-- Begin Page Content -->
<style type="text/css">
  .contact-detail {
    color: #1cc88a;
    font-size: 13px;
  }
  h1.plan-name {
    font-size: 16px;
    font-weight: 800;
    color: limegreen;
    text-transform: uppercase;
    margin: 0;
}
.total-days {
    display: flex;
    font-weight: 600;
    color: #222;
}
.total-days span {
    width: 50%;
    font-weight: 400;
    color: #444;
}
.btn-pink{
  background-color: #c81c4c;
  }
 </style>
    <div class="container-fluid">
      <?php  
      $arr_data_row = [];
        foreach($subscribe_now_details as $arr_data_row); 
      ?>
    <!-- DataTales Example -->
          <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
              All Subscription Plan List
              <div class="float-right">
              <?php if($arr_data_row){ ?>
                <a href="{{url('')}}/admin/subscribe-now/export_user/<?php echo base64_encode($arr_data_row->subscribe_now_user_id);  ?>" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i class="fas fa-plus fa-sm text-white-50"></i> Download</a>&nbsp;
              <?php } ?>
                <a href="{{url('')}}/admin/view-subscribe-now-user" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back"><i class="fas fa-long-arrow-alt-right"></i></a>
              </div><br><br>
               @if(Session::has('success'))
                <div class="alert alert-success">
                  {{ Session::get('success') }}
                </div>
              @endif
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <!-- <th >User&nbsp;Details</th> -->
                      <th>Sr.&nbsp;No</th>
                      <th >Name</th>
                      <th >Order&nbsp;Date</th>
                      <th >Start&nbsp;Date</th>
                      <th >Plan</th>
                      <th >Meal</th>
                      <th >Plan&nbsp;Link</th>
                      <th >Amount</th>
                      <th >Payment&nbsp;Status</th>
                      <th>Subscription&nbsp;Id</th>
                      <th >Comments</th>
                      <th >Approved</th>
                      <th>Invoice</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <?php $cnt=0; foreach($subscribe_now_details as $row): $cnt++; ?>
                   <tbody>
                    <tr>
                      <td><?php echo $cnt; ?></td>
                      <td><?php echo $row->name; ?></td>
                      <td><?php echo date('d M', strtotime($row->created_at)); ?></td>
                      <td><?php echo date('d M', strtotime($row->start_date)); ?></td>
                      <td> <?php 
                        $subscribe_now_plan_duration_id = $row->subscribe_now_plan_duration_id;
                        $subscribe_now_plan_duration_data = \DB::table('subscribe_now_plan_duration')->select('*')->where('subscribe_now_plan_duration_id',$subscribe_now_plan_duration_id)->get();
                        if($subscribe_now_plan_duration_data){
                        foreach($subscribe_now_plan_duration_data as $subscribe_now_plan_duration_row); ?>
                        <span>Total&nbsp;</span><?php echo $subscribe_now_plan_duration_row->subscribe_now_duration ?? '0'; ?>&nbsp;Days <?php } ?></td>
                      <td><?php 
                          $meal_type_id = $row->meal_type_id;
                          $explode_data = explode(",",$meal_type_id);
                          $meal_type_data = []; 
                        ?>
                        <?php for($i=0;$i<count($explode_data); $i++){
                        $meal_type_data = \DB::table('meal_type')->select('meal_type_name')->where('meal_type_id',$explode_data[$i])->get(); for($j=0;$j<count($meal_type_data); $j++){ 
                            foreach($meal_type_data as $meal_type_row): 
                                if($meal_type_row->meal_type_name == 'Breakfast'){
                            echo 'B'; }else if($meal_type_row->meal_type_name == 'Lunch'){
                              echo 'L'; }else if($meal_type_row->meal_type_name == 'Snack'){
                                echo 'S'; }else if($meal_type_row->meal_type_name == 'Dinner'){
                                  echo 'D';}
                            endforeach; }
                        } ?>
                        </td>
                       <td><a <?php if($row->link){ ?> href="<?php echo $row->link; ?>" <?php }else{ ?> href="javascript:;" <?php  }?> target="_tab" class="plan-link btn-link">Link</a></td>
                      <td><?php echo $row->price; ?></td>
                      <td><?php echo $row->payment_status; ?></td>
                      <td style="font-size: 13px"><?php echo $row->subscription_id; ?> </td>
                      <td style="font-size: 13px"><?php echo Str::limit($row->comments, 40, ' ...'); ?> </td>
                      <td style="text-align: center;"><?php if($row->approve_status == "Disapprove"){ ?>
                        <form action="{{url('/')}}/admin/subscribe-now/approve_status/<?php echo $row->id; ?>" method="post">
                          {{csrf_field()}}
                          <button class="btn btn-sm btn-primary" type="submit" onclick="return confirm('Are you sure to approve this subscriber ?');"><b><i class="fa fa-times" data-toggle="tooltip" data-placement="top" title="Disapprove"></i></b></button>
                        </form>
                      <?php }else{ ?>
                        <form action="{{url('/')}}/admin/subscribe-now/disapprove_status/<?php echo $row->id; ?>" method="post">
                          {{csrf_field()}}
                            <button class="btn btn-sm btn-success" type="submit" onclick="return confirm('Are you sure to disapprove this subscriber ?');"><b><i class="fa fa-check" data-toggle="tooltip" data-placement="top" title="Approve"></i></b></button>
                        </form>
                      <?php } ?></td>
                      <td><a href="{{url('')}}/admin/invoice/{{ $row->id }}" class="btn btn-sm btn-success" ><i class="fas fa-file-invoice" data-toggle="tooltip" data-placement="left" title="Print Invoice"></i></a></td>
                      <td style="text-align: center; min-width: 150px;">
                        <a href="<?php echo url(''); ?>/admin/view-subscribe-now-details/<?php echo base64_encode($row->id).'/'.base64_encode($row->subscribe_now_user_id); ?>" class="btn btn-sm btn-pink" type="button">
                        <i class="fa fa-binoculars" style="color: #fff;" data-toggle="tooltip" data-placement="left" title="View"></i> </a>
                        <a href="javascript:;" class="btn btn-sm btn-info" data-target="#EditModal<?php echo $row->id; ?>" data-toggle="modal"><i class="fa fa-plus" data-toggle="tooltip" data-placement="left" title="Comment & Link"></i></a>
                        <a href="{{url('/')}}/admin/subscribe-now/export_subscriber/{{ $row->id }}" class="btn btn-sm btn-warning" ><i class="fa fa-download" data-toggle="tooltip" data-placement="top" title="Download Subscriber"></i></a>
                        <a href="{{url('/')}}/admin/subscribe-now/delete/{{ $row->id }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure to remove this record ?');"><i class="far fa-trash-alt" data-toggle="tooltip" data-placement="top" title="Delete"></i></a>
                      </td>
                    </tr>
                  </tbody>
                  <?php endforeach; ?>
                </table>
              </div>
            </div>
          </div>

        <!-- Edit modal -->
        <?php foreach($editarr_data as $row1): ?>
        <div class="modal fade" id="EditModal<?php echo $row1->id; ?>" role="dialog">
          <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title">Add Comment & Link</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              <div class="modal-body">
                <form  action="{{url('/')}}/admin/subscribe-now/store_comment_link/<?php echo base64_encode($row1->id); ?>" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
              <div class="row">
              <div class="col-lg-12">
                  <div class="row">
                      <div class="col-lg-12 mb-3">
                          <label class="label-control">Link <span style="color: red;">*</span></label>
                          <input type="text" class="form-control" name="link" value="<?php echo $row1->link; ?>" placeholder="Link" required="required">
                      </div>
                  </div>
              </div>

              <div class="col-lg-12">
                  <div class="row">
                      <div class="col-lg-12 mb-3">
                          <label class="label-control">Comment </label>
                          <textarea class="form-control" name="comments" placeholder="Comments" rows="4"><?php echo $row1->comments; ?>
                          </textarea>
                      </div>
                  </div>
              </div>
             
              <div class="col-lg-12" style="text-align: center;">
                  <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                   <button type="button" class="btn btn-danger btn-md" data-dismiss="modal">Cancel</button>
              </div>
          </div>
          </form>
              </div>
            </div>
          </div>
        </div>
        <!-- Edit modal close -->
        <?php endforeach; ?>

</div>
@endsection