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
                      <th style="width: 5px;">#</th>
                      <th style="width: 20px;">Menu Name</th>
                      <th style="width: 20px;">Title</th>
                      <th style="width: 20px;">Image</th>
                      <th style="width: 10px;">Date</th>
                      <th style="width: 15px;">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                     <?php  $cnt=0; foreach($arr_data as $row): $cnt++; 
                       $originalDate=$row->created_at; $newDate=date("d-m-Y",strtotime($originalDate));
                     ?>
                    <tr>
                      <td style="vertical-align: middle;">{{$cnt}}</td>
                      <?php $menu_id=$row->menu_category_id; $obj_data = \DB::table('menu_categories')->where('id',$menu_id)->get();
                        if($obj_data)
                        {
                          $arr_data = $obj_data->toArray();
                        }
                        $cat_data = $arr_data;
                        foreach ($cat_data as $value);
                       ?>
                      <td width="20%"><?php echo $value->name; ?></td>
                      <td width="20%">{{$row->menu_title}}</td>
                      <td class="text-center" width="10%">
                      	<img src="{{url('')}}/uploads/images/{{$row->image}}" width="40px" class="rounded-circle" />
                      </td>
                       
                      <td width="20%">{{$newDate}}</td>
                      <td  width="20%">
                      	
                      	<a href="{{url('/')}}/admin/menu/edit/{{ base64_encode($row->id) }}" class="btn btn-sm btn-info">
                      		<i class="far fa-edit" data-toggle="tooltip" data-placement="left" title="Edit"></i></a>
                          <a href="{{url('/')}}/admin/menu/view-ingredients/{{ base64_encode($row->id) }}" class="btn btn-sm btn-success">
                          <i class="fas fa-pepper-hot" data-toggle="tooltip" data-placement="left" title="Ingredients"></i></a>
                          <a href="{{url('/')}}/admin/menu/view-whatsinside/{{ base64_encode($row->id) }}" class="btn btn-sm btn-warning">
                          <i class="fa fa-question" data-toggle="tooltip" data-placement="left" title="Whats Inside"></i></a>
                          <a href="{{url('/')}}/admin/menu/view-specification/{{ base64_encode($row->id) }}" class="btn btn-sm btn-dark">
                          <i class="fa fa-list" data-toggle="tooltip" data-placement="left" title="Specification"></i></a>
                        
                        <a href="{{url('/')}}/admin/menu/delete/{{ base64_encode($row->id) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure to remove this record ?');"><i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i></a>
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