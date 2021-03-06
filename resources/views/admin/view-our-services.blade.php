@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
      
    <!-- DataTales Example -->
          <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
              All Our Services List
              <div class="float-right">
                <a href="{{url('')}}/admin/create-our-services" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm">
                  <i class="fas fa-plus fa-sm text-white-50"></i> Add Our Services
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
                      <th>#</th>
                      <th>Title</th>
                      <th>Title Description</th>
                      <th>Icon Image</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($arr_data as $row)
                    <tr>
                      <td>{{ $no++ }}</td>
                      <td>{{$row->title}}</td>
                      <td>{{$row->title_description}} </td>
                      <td><img style="width: 50%;" src="{{url('')}}/uploads/images/{{$row->icon_image}}"></td>
                      <td class="text-center">
                        <a href="{{url('')}}/admin/ourservices/edit/{{ base64_encode($row->id) }}" class="btn btn-sm btn-success">
                            <i class="fa fa-pen" data-toggle="tooltip" data-placement="left" title="Edit"></i></a>
                        <a href="{{url('')}}/admin/ourservices/delete/{{ base64_encode($row->id) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you  to delete this record?');">
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