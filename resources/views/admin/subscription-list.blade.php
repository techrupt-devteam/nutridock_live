@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
     
    <!-- DataTales Example -->
          <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
              All Subscription
              <div class="float-right">
                <a href="{{url('')}}/admin/subscription/subscription_email_all" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i class="fa fa-envelope"></i></a>
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
                      <th>#</th>
                      <th style="text-align: center;">Name</th>
                      <th style="text-align: center;">Email</th>
                      <th style="text-align: center;">Created Date</th>
                      <th style="width: 75px;text-align: center;">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $cnt=0; foreach($arr_data as $row): $cnt++; ?>
                    <tr>
                      <td width="5%" style="vertical-align: middle;">{{$cnt}}</td>
                      <td class="text-center" width="10%">{{$row->name}}</td>
                      <td class="text-center" width="10%">{{$row->email}}<input type="hidden" name="email value="{{$row->email}}"></td>
                      <td class="text-center" width="10%">{{date('d-m-Y', strtotime($row->created_at))}}</td>
                     
                      <td  width="10%" style="text-align: center;">
                        <a href="{{url('/')}}/admin/subscription/create/{{ base64_encode($row->id) }}" class="btn btn-sm btn-info">
                          <i class="fa fa-envelope" data-toggle="tooltip" data-placement="left" title="Email"></i></a>
                          <a href="{{url('/')}}/admin/subscription/delete/{{ base64_encode($row->id) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure to remove this record ?');">
                          <i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i></a>
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
