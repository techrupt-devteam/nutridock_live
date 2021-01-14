@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
      <header class="row page-header page-header-compact page-header-light border-bottom mb-3">
        <div class="container-fluid">
            <div class="page-header-content">
                <div class="row align-items-center justify-content-between pt-3">
                    <div class="col-auto mb-2">
                        <h1 class="page-header-title">
                            <div class="page-header-icon">
                                <i class="fas fa-rss" style="font-size: 18px;"></i>
                            </div>
                            Top Categories List
                        </h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              All Top Categories List
              <div class="float-right">
                <a href="{{url('')}}/admin/create-top-categories" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm">
                  <i class="fas fa-plus fa-sm text-white-50"></i> Add Top Categories
                </a>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Title</th>
                      <th>Description</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($arr_data as $row)
                    <tr>
                      <td>{{ $no++ }}</td>
                      <td>{{$row->title}}</td>
                      <td>{{$row->description}} </td>
                      <td class="text-center">
                        <a href="{{url('')}}/admin/edit/{{ base64_encode($row->id) }}" class="btn btn-sm btn-success">
                            <i class="fa fa-pen" data-toggle="tooltip" data-placement="left" title="Edit"></i></a>
                        <a href="{{url('')}}/admin/healthyfarm/delete/{{ base64_encode($row->id) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you  to delete this record?');">
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