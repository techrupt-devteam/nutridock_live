@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
        <div class="container-fluid">
        	
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              All Benefits
              <div class="float-right">
                <a href="javascript:;" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm" type="button" data-toggle="modal" data-target="#myModal">
                  <i class="fas fa-plus fa-sm text-white-50"></i> Create Benefits </a>&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="{{url('')}}/admin/view-blog" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back" ><i class="fas fa-long-arrow-alt-right"></i></a>
              </div><br><br>
               @if(Session::has('success'))
                <div class="alert alert-success">
                  {{ Session::get('success') }}
                </div>
              @endif
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped table-bordered dt-responsive nowrap" id="example" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Title</th>
                      <th>Image</th>
                      <th>Description</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                     <?php  $cnt=0; foreach($arr_data as $row): $cnt++; 
                       $originalDate=$row->created_at; $newDate=date("d-m-Y",strtotime($originalDate));
                     ?>
                    <tr>
                      <td style="vertical-align: middle;">{{$cnt}}</td>
                      <?php $blog_id=$row->blog_id; $obj_data = \DB::table('blog')->where('id',$blog_id)->get();
                        if($obj_data)
                        {
                          $arr_data = $obj_data->toArray();
                        }
                        $cat_data = $arr_data;
                        foreach ($cat_data as $value);
                       ?>
                      <td ><?php echo $row->title; ?></td>
                      <td class="text-center" width="10%">
                      	<img src="{{url('')}}/uploads/images/{{$row->image}}" width="40px" class="rounded-circle" />
                      </td>
                      <td width="30%">{!!  substr(strip_tags($row->title_description), 0, 100) !!}</td>
                      
                      <td >
                      	<a href="javascript:;" class="btn btn-sm btn-info" data-target="#EditModal<?php echo $row->id; ?>" data-toggle="modal">
                      		<i class="far fa-edit" data-toggle="tooltip" data-placement="left" title="Edit" ></i></a>
                          <!-- <a href="javascript:;" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm" type="button" data-toggle="modal" data-target="#myModal"> -->
                        <a href="{{url('/')}}/admin/blog/benefits_delete/{{ base64_encode($row->id) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure to remove this record ?');"><i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i></a>
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
                      <h4 class="modal-title">Blog Benefits</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                      <form  action="{{url('/')}}/admin/blog/benefits_store" method="post" enctype="multipart/form-data">
                      {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                             <div class="col-lg-12 mb-3">
                                <label class="label-control">Description</label>
                                <textarea rows="4" class="form-control w-100" name="description" placeholder="Description"></textarea>
                                <input type="hidden" value="{{$id}}" name="blog_id">
                            </div>
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Title <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="title" placeholder="Title" required="required">
                            </div>
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Title Description</label>
                                <textarea rows="4" class="form-control w-100" name="title_description" placeholder="Description"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-3">
                        <label class="label-control">Image</label>
                        <div class="mb-12">
                          <div id="image-preview" class="w-100" style="background-size:contain;background-image: url('img/default-img.jpg');height: 150px;">
                            <label for="image-upload1" id="image-label1"><i class="fa fa-camera" aria-hidden="true"></i></label>
                            <input type="file" name="image" class="user-file" id="image-upload" accept="image/x-png,image/gif,image/jpeg,image/png" />
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
              <!-- Close Modal -->

              

              <!-- Edit modal -->
              <?php foreach($editarr_data as $row1): ?>
              <div class="modal fade" id="EditModal<?php echo $row1->id; ?>" role="dialog">
                <div class="modal-dialog modal-lg">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Blog Benefits</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                      <form  action="{{url('/')}}/admin/blog/benefits_update/<?php echo base64_encode($row1->id); ?>" method="post" enctype="multipart/form-data">
                      {{csrf_field()}}
                    <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                             <div class="col-lg-12 mb-3">
                                <label class="label-control">Description</label>
                                <textarea rows="4" class="form-control w-100" name="description" placeholder="Description"><?php echo $row1->description; ?></textarea>
                                <input type="hidden" value="{{$id}}" name="blog_id">
                            </div>
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Title <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="title" value="<?php echo $row1->title; ?>" placeholder="Title" required="required">
                            </div>
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Title Description</label>
                                <textarea rows="4" class="form-control w-100" name="title_description" placeholder="Description"><?php echo $row1->title_description; ?></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-3">
                        <label class="label-control">Image</label>
                        <div class="mb-12">
                          <div id="image-preview" class="w-100" style="background-size:contain;background-image: url('img/default-img.jpg');height: 150px;">
                            <label for="image-upload1" id="image-label1"><i class="fa fa-camera" aria-hidden="true"></i></label>
                            <input type="file" name="image" class="user-file" accept="image/x-png,image/gif,image/jpeg,image/png" onchange="view_image(this, '<?php echo $row1->id; ?>');" id="p_image_<?php echo $row1->id; ?>"/>
                          </div>
                        </div>
                        
                        <div class="mb-12">
                            <br><br>
                          <div id="" class="w-100">
                            <img id="image_<?php echo $row1->id; ?>" src="{{url('')}}/uploads/images/{{$row1->image}}" alt="" width="100%" height="150px" style="border:1px solid;">
			                <img id="pimage_<?php echo $row1->id; ?>" src="" alt="" style="display:none;" width="100%" height="150px">
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
<script>
    function view_image(input,id)
	{		
	    var file = "p_image_"+id;
		var text = "text_"+id;
		var image = "image_"+id;
		var pimage = "pimage_"+id;
		
	    document.getElementById(image).style.display = "none";
			document.getElementById(pimage).style.display = "block";
			document.getElementById(file).removeAttribute('disabled');
			
			
		var image = "#pimage_"+id;
		if(input.files && input.files[0])
		{
			//alert('hi');
			var reader = new FileReader();
			reader.onload = function(e)
			{
				var oimg = document.createElement('img');
				$(image)
					   .attr('src',e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
@endsection