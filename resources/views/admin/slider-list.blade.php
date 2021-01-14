@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
     
    <!-- DataTales Example -->
          <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
              All Slider List
              <div class="float-right">
                <a href="{{url('')}}/admin/create-slider" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm">
                  <i class="fas fa-plus fa-sm text-white-50"></i> Add Slider
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
                      <th>Image</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($arr_data as $row)
                    <tr>
                      <td>{{ $no++ }}</td>
                      <td style="width: 200px;">{{$row->title}}</td>
                      <td ><img style="height:150px;" src="{{url('')}}/uploads/images/{{$row->image}}"></td>
                      <td class="text-center" style="width: 100px;">
                        <a href="{{url('')}}/admin/slider/edit/{{ base64_encode($row->id) }}" class="btn btn-sm btn-success">
                            <i class="fa fa-pen" data-toggle="tooltip" data-placement="left" title="Edit"></i></a>
                        <a href="{{url('')}}/admin/slider/delete/{{ base64_encode($row->id) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you  to delete this record?');">
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