@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
    <header class="row page-header page-header-compact page-header-light border-bottom mb-3">
       
    </header>
     
      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Edit How We Work Page
              <a href="{{url('')}}/admin/view-how-we-work" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" title="Back" style="margin-left: 785px;"><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <form action="{{url('/')}}/admin/howwework/update/{{base64_encode($arr_data['id'])}}" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-6">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Title <span style="color:red;">*</span></label>
                            <input type="text" value="{{ $arr_data['title'] ?? ''}}" class="form-control" name="title" placeholder="Title" required="required">
                        </div>
                    </div>

                     <div class="col-lg-6">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Icon Image</label>
                            <input type="file" class="form-control" name="icon_image" onchange="view_image(this, '<?php echo $arr_data['id']; ?>');" id="p_image_<?php echo $arr_data['id']; ?>">
                            <!--@if($arr_data['icon_image'])<a href="{{url('')}}/uploads/images/{{$arr_data['icon_image']}}" target="_tab">View Image</a>@endif-->
                        </div>
                    </div>
                </div>

                <div class="row">
                     <div class="col-lg-6">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Description <span style="color:red;">*</span></label>
                            <textarea rows="5" class="form-control w-100" name="description" placeholder="Description" required="required">{{ $arr_data['description'] ?? ''}}</textarea>
                        </div>
                    </div>
                    
                    <div class="col-lg-6">
                        <div class="col-lg-7 mb-3">
                            <img id="image_<?php echo $arr_data['id']; ?>" src="{{url('')}}/uploads/images/{{$arr_data['icon_image']}}" alt="" width="100%" height="150px" style="border:1px solid;">
			                <img id="pimage_<?php echo $arr_data['id']; ?>" src="" alt="" style="display:none;" width="100%" height="150px">
                        </div>
                    </div>
                    </div>
                </div>

                <div class="col-lg-12" style="text-align: center;">
                    <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                     <a href="{{url('')}}/admin/view-how-we-work" class="btn btn-danger btn-md"> Cancel </a>
                </div><br>
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
