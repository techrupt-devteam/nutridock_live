@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
        <div class="container-fluid">
          
        	
          <!-- DataTales Example -->
          <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
              All FAQ's
              <div class="float-right">
                <a href="{{url('')}}/admin/create-faq" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm">
                  <i class="fas fa-plus fa-sm text-white-50"></i> Create FAQ
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
                      <th style="width: 5px;">#</th>
                      <th style="width: 20px;">Title</th>
                      <th style="width: 20px;">Description</th>
                      <th style="width: 10px;">Date</th>
                      <th style="width: 15px;">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                     <?php  $cnt=0; foreach($arr_data as $row): $cnt++; 
                       $originalDate=$row->created_at; $newDate=date("d-m-Y",strtotime($originalDate));
                     ?>
                    <tr>
                      <td style="vertical-align: middle;" width="5%">{{$cnt}}</td>
                      <td width="20%">{{$row->title}}</td>
                      <td class="text-center" width="30%">{!!  substr(strip_tags($row->description), 0, 150) !!}</td>
                      <td width="10%">{{$newDate}}</td>
                      <td  width="10%">
                      	<a href="{{url('/')}}/admin/faq/edit/{{ base64_encode($row->id) }}" class="btn btn-sm btn-info">
                      		<i class="far fa-edit" data-toggle="tooltip" data-placement="left" title="Edit"></i></a>
                        <!-- <a href="{{url('/')}}/admin/blog/view-benefits/{{ base64_encode($row->id) }}" class="btn btn-sm btn-primary">
                          <i class="far fa-thumbs-up" data-toggle="tooltip" data-placement="left" title="Benefits"></i></a>
                        <a href="{{url('/')}}/admin/blog/view-comments/{{ base64_encode($row->id) }}" class="btn btn-sm btn-info">
                          <i class="far fa-comments" data-toggle="tooltip" data-placement="left" title="Comments"></i></a> -->
                        <a href="{{url('/')}}/admin/faq/delete/{{ base64_encode($row->id) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure to remove this record ?');"><i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i></a>
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