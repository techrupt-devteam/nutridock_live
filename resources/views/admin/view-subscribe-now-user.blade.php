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
 </style>
    <div class="container-fluid">
    <!-- DataTales Example -->
    <div class="card shadow mb-4 mt-4">
      <div class="card-header py-3">
        All Subscriber User List
        <div class="float-right">
          <a href="{{url('')}}/admin/subscribe-now/export" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i class="fas fa-plus fa-sm text-white-50"></i> Download</a>
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
                <th>Sr.No</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Total Plan</th>
                <th>Action</th>
              </tr>
            </thead>
            <?php $cnt=0; foreach($arr_data as $row): $cnt++; 
              $id = $row->id;
              $data = \DB::table('subscribe_now_details')->where('is_deleted','No')->where('subscribe_now_user_id',$id)->get(); ?>
             <tbody>
              <tr>
                <td><?php echo $cnt; ?></td>
                <td><?php echo $row->name; ?></td>
                <td><?php echo $row->phone_no; ?></td>
                <td><?php echo $row->email; ?></td>
                <td><?php echo count($data); ?></td>
                <td style="text-align: center; min-width: 101px;">
                  <a href="<?php echo url(''); ?>/admin/view-subscribe-now/<?php echo base64_encode($row->name).'/'.base64_encode($row->phone_no).'/'.base64_encode($row->email); ?>" class="btn btn-sm btn-info"><i class="fa fa-binoculars" data-toggle="tooltip" data-placement="left" title="View"></i></a>
                </td>
              </tr>
            </tbody>
            <?php endforeach; ?>
          </table>
        </div>
      </div>
    </div>
</div>
@endsection