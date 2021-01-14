@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
      
      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Slider Description Page
              <a href="{{url('')}}/admin/slider-list" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back"><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
           
            <div class="card-body">
                <form  action="{{url('/')}}/admin/slider/update/{{base64_encode($arr_data['id'])}}" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Title </label>
                                <input type="text" value="{{$arr_data['title']}}" class="form-control" name="slider_title" placeholder="Slider title">
                            </div>
                            
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Slider Image <span style="color: red;">*</span></label>
                                <div id="image-preview" class="w-100" style="background-size:contain;background-image: url('img/default-img.jpg');height: 250px;">
                                <label for="image-upload1" id="image-label1"><i class="fa fa-camera" aria-hidden="true"></i></label>
                                <input type="file" name="image" class="user-file " onchange="view_image(this, '<?php echo $arr_data['id']; ?>');" id="p_image_<?php echo $arr_data['id']; ?>" accept="image/x-png,image/gif,image/jpeg,image/png" <?php if($arr_data['image']==''){ ?> required="required" <?php } ?>/><!--image-upload-->

                              </div><br>
                              <!--<?php if($arr_data['image']!=''){ ?>
                                <a href="{{url('')}}/uploads/images/{{$arr_data['image']}}" target="_tab">View Image</a>
                              <?php } ?>-->
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-3"></div>
                            
                            <div class="col-lg-12 mb-3" style="margin-top: 7px;"><br><br><br><br>
                                <img id="image_<?php echo $arr_data['id']; ?>" src="{{url('')}}/uploads/images/{{$arr_data['image']}}" alt="" width="100%" height="250px">
				                <img id="pimage_<?php echo $arr_data['id']; ?>" src="" alt="" style="display:none;" width="100%" height="250px">
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-lg-12" style="text-align: center;">
                        <!-- <a href="#" class="btn btn-primary btn-md mr-2"> Sumbit </a> -->
                        <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                         <a href="{{url('')}}/admin/slider-list" class="btn btn-danger btn-md"> Cancel </a>
                    </div>
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
