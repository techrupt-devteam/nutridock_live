@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
        <div class="container-fluid">
          
          
          <!-- DataTales Example -->
          <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
              All Menu
              <div class="float-right">
                <a href="{{url('')}}/admin/create-menu" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm">
                  <i class="fas fa-plus fa-sm text-white-50"></i> Create Menu
                </a>
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
                  <tbody>
            <?php $cnt=0; foreach($arr_data as $row): $cnt++;
            //print_r($arr_data); die; 
              $id = $row->id;
              $data = \DB::table('subscribe_now_details')->where('is_deleted','No')->where('subscribe_now_user_id',$id)->get(); ?>
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
                    <?php endforeach; ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
@endsection