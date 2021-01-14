@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
     
    <!-- DataTales Example -->
          <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
              All Contact Us List
              <!--<div class="float-right">
                <a href="{{url('')}}/admin/contactus/create_email_all" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i class="fa fa-envelope"></i></a>
              </div><br><br>-->
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
                      <th>Name</th>
                      <th>Email</th>
                      <th>Subject</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($arr_data as $row)
                    <tr>
                      <td>{{ $no++ }}</td>
                      <td>{{$row['name']}}</td>
                      <td>{{$row['email']}} </td>
                      <td>{{$row['subject']}} </td>
                      <td class="text-center" width="15%">
                        <a href="{{url('')}}/admin/contactus/view/{{ base64_encode($row['id']) }}" class="btn btn-sm btn-primary">
                           <i class="fas fa-binoculars" data-toggle="tooltip" data-placement="left" title="View"></i></a>
                        <a href="{{url('')}}/admin/contactus/create_email/{{ base64_encode($row['id']) }}" class="btn btn-sm btn-success">
                            <i class="fa fa-envelope" data-toggle="tooltip" data-placement="left" title="View"></i></a>  
                            
                        <a href="{{url('')}}/admin/contactus/delete/{{ base64_encode($row['id']) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you  to delete this record?');">
                            <i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i></a>
                      </td>
                    </tr>
                    @endforeach
                  </tbody>
                </table>
              </div>
            </div>
          </div>
</div>
@endsection