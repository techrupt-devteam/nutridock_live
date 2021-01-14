@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
        <div class="container-fluid">
        	
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              All Whats Inside List
              <div class="float-right">
                <a href="javascript:;" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm" type="button" data-toggle="modal" data-target="#myModal">
                  <i class="fas fa-plus fa-sm text-white-50"></i> Whats Inside </a>&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="{{url('')}}/admin/view-menu" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back" ><i class="fas fa-long-arrow-alt-right"></i></a>
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
                      <th>Unit</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php  $cnt=0; foreach($arr_data as $row): $cnt++; 
                       $originalDate=$row->created_at; $newDate=date("d-m-Y",strtotime($originalDate));?>
                    <tr>
                      <td style="vertical-align: middle;">{{$cnt}}</td>
                      <td><?php echo $row->title; ?></td>
                       <td class="text-center" width="10%"><?php echo $row->unit; ?></td>
                      <td>
                      	<a href="javascript:;" class="btn btn-sm btn-info" data-target="#EditModal<?php echo $row->id; ?>" data-toggle="modal">
                      		<i class="far fa-edit" data-toggle="tooltip" data-placement="left" title="Edit" ></i></a>
                        <!-- <a href="javascript:;" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm" type="button" data-toggle="modal" data-target="#myModal"> -->
                        <a href="{{url('/')}}/admin/menu/whatsinside_delete/{{ base64_encode($row->id) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure to remove this record ?');"><i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i></a>
                      </td>
                    </tr>
                    <?php endforeach; ?>
                  </tbody>
                </table>
              </div>
              
              <!-- Modal -->
              <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-lg">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Whats Inside - Add</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                      <form  action="{{url('/')}}/admin/menu/whatsinside_store" method="post" enctype="multipart/form-data">
                      {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <!--<div class="col-lg-6 mb-3">
                                <label class="label-control">Title <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="title" placeholder="Title" required="required">
                                <input type="hidden" value="{{$id}}" name="menu_id">
                            </div>-->
                            
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Calories <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="title[]" placeholder="Calories" value="Calories" readonly="readonly">
                                <input type="hidden" value="{{$id}}" name="menu_id">
                            </div>
                            
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Unit <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="unit[]" placeholder="Unit" required="required">
                            </div>
                            
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Proteins <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="title[]" value="Proteins" placeholder="Proteins" readonly="readonly">
                                <input type="hidden" value="{{$id}}" name="menu_id">
                            </div>
                            
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Unit <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="unit[]" placeholder="Unit" >
                            </div>
                            
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Carbohydrates <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="title[]" value="Carbohydrates" placeholder="Carbohydrates" readonly="readonly">
                                <input type="hidden" value="{{$id}}" name="menu_id">
                            </div>
                            
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Unit <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="unit[]" placeholder="Unit" >
                            </div>
                            
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Fats <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="title[]" placeholder="Fats" value="Fats" readonly="readonly">
                                <input type="hidden" value="{{$id}}" name="menu_id">
                            </div>
                            

                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Unit <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="unit[]" placeholder="Unit" >
                            </div>
                        </div>
                    </div>
                    </div><br>
                    <div class="row">
                    <div class="col-lg-12" style="text-align: center;">
                        <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                         <button type="button" class="btn btn-danger btn-md" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </form>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Close Modal -->

              

              <!-- Edit modal -->
              <?php foreach($editarr_data as $row1): ?>
              <div class="modal fade" id="EditModal<?php echo $row1->id; ?>" role="dialog">
                <div class="modal-dialog modal-lg">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Whats Inside - Edit</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                      <form  action="{{url('/')}}/admin/menu/whatsinside_update/<?php echo base64_encode($row1->id); ?>" method="post" enctype="multipart/form-data">
                      {{csrf_field()}}
                    <div class="row">
                    <div class="col-lg-12">
                         <div class="row">
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Title <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="title" placeholder="Title" value="<?php echo $row1->title; ?>" required="required" readonly="readonly">
                                <input type="hidden" value="{{$id}}" name="menu_id">
                            </div>

                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Unit <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="unit" placeholder="Unit"  value="<?php echo $row1->unit; ?>" required="required">
                            </div>
                        </div>
                    </div>
                   
                    <div class="col-lg-12" style="text-align: center;">
                        <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                         <button type="button" class="btn btn-danger btn-md" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
                </form>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Edit modal close -->
              <?php endforeach; ?>


            </div>
          </div>
        </div>
@endsection