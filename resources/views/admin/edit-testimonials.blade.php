@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
      
      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Create Testimonials Page
              <a href="{{url('')}}/admin/view-testimonials" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back"><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <form  action="{{url('')}}/admin/testimonials/update/{{ base64_encode($arr_data['id']) }}" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-6">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Name <span style="color:red;">*</span></label>
                            <input type="text" class="form-control" name="name" value="{{$arr_data['name'] ?? ''}}" placeholder="Name" required="required">
                        </div>

                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Post <span style="color:red;">*</span></label>
                            <input type="text" class="form-control" name="post" value="{{$arr_data['post'] ?? ''}}" placeholder="Post" required="required">
                        </div>
                        
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Details <span style="color:red;">*</span></label>
                            <textarea rows="5" class="form-control w-100" name="details" placeholder="Details" required="required">{{$arr_data['details'] ?? ''}}</textarea>
                        </div>
                    </div>

                     <div class="col-lg-6">
                         
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Image <span style="color:red;">*</span></label>
                            <input type="file" class="form-control" name="image"  onchange="view_image(this, '<?php echo $arr_data['id']; ?>');" id="p_image_<?php echo $arr_data['id']; ?>">
                             <!--@if($arr_data['image'])
                                <a href="{{url('')}}/uploads/images/{{$arr_data['image']}}" target="_tab" required="required">View Image</a>
                            @endif-->
                        </div>
                        
                        <div class="col-lg-7 mb-3">
                            <img id="image_<?php echo $arr_data['id']; ?>" src="{{url('')}}/uploads/images/{{$arr_data['image']}}" alt="" width="100%" height="150px" style="border:1px solid;">
			                <img id="pimage_<?php echo $arr_data['id']; ?>" src="" alt="" style="display:none;" width="100%" height="150px">
                        </div>
                        
                    </div>
                </div>

              
                <div class="col-lg-12" style="text-align: center;">
                    <!-- <a href="#" class="btn btn-primary btn-md mr-2"> Sumbit </a> -->
                    <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                     <a href="{{url('')}}/admin/view-testimonials" class="btn btn-danger btn-md"> Cancel </a>
                </div>
            </form>

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
