@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
        <div class="container-fluid">
          <header class="row page-header page-header-compact page-header-light border-bottom mb-3">
            <div class="container-fluid">
                <div class="page-header-content">
                    <div class="row align-items-center justify-content-between pt-2">
                        <div class="col-auto mb-2">
                            <h1 class="page-header-title">
                                <div class="page-header-icon"><i class="fas fa-wind"></i></div>
                                Webinar - List
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        	
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              All Webinar
              <div class="float-right">
                <div class="custom-file" style="max-width: 250px">
                    <!-- <input type="file" class="custom-file-input" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label> -->
                     <!-- <a href="{{url('')}}/admin/webiner_excel" class="btn btn-success btn-sm pull-right"><i class="fa fa-envelope" data-toggle="tooltip" data-placement="left" title=""></i></a> -->
                    <a href="{{url('')}}/admin/survey_excel" class="btn btn-primary btn-sm pull-right"><i class="fa fa-download" data-toggle="tooltip" data-placement="left" title=""></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
               <!--  <a href="{{url('')}}/admin/create-blog" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm">
                  <i class="fas fa-plus fa-sm text-white-50"></i> Create Blog
                </a> -->
              </div>
            </div>
            <script>
              @if (session('webinar_success'))
              //Swal.fire( 'You clicked the button!','success')
               Swal.fire("{{ session('webinar_success') }}");
               @endif
            </script>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped table-bordered dt-responsive nowrap" id="example" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Mobile</th>
                      <th>Age</th>
                      <th>City</th>
                      <th style="width: 75px;">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $cnt=0; foreach($arr_data as $row): $cnt++; ?>
                    <tr>
                      <td style="vertical-align: middle;">{{$cnt}}</td>
                      <td class="text-center" width="10%">{{$row->name}}</td>
                      <td width="20%">{{$row->email}}</td>
                      <td width="25%">{{$row->mobile}}</td>
                      <td>{{$row->city}}</td>
                      <td>{{$row->age}}</td>
                      <td  width="15%">
                      	<a href="{{url('/')}}/admin/webinar/delete/{{ base64_encode($row->id) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure to remove this record ?');">
                      		<i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i>
                      	</a>
                      	<a href="{{url('/')}}/admin/webinar-view/{{ base64_encode($row->id) }}" class="btn btn-sm btn-info">
                      		<i class="far fa-edit" data-toggle="tooltip" data-placement="left" title="Edit"></i>
                      	</a>
                         <a href="{{url('')}}/admin/webinar-email/{{  base64_encode($row->id) }}" class="btn btn-success btn-sm pull-right"><i class="fa fa-envelope" data-toggle="tooltip" data-placement="left" title=""></i></a>
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