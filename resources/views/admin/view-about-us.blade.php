@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
<script src="{{url('')}}/public/backend/ck/ckeditor/ckeditor.js"></script>
<script src="{{url('')}}/public/backend/ck/ckeditor/js/sample.js"></script>
<link rel="stylesheet" href="{{url('')}}/public/backend/ck/ckeditor/css/samples.css">

<style>
body {font-family: Arial;}

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>
    <div class="container-fluid">
     
      <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
              About Us
               @if(Session::has('success'))
                <div class="alert alert-success">
                  {{ Session::get('success') }}
                </div>
              @endif
            </div>
             <form  action="{{url('/')}}/admin/aboutus/update/{{ base64_encode($arr_data['id']) }}" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
              <!-- Tab panes -->
              
                 
            <div class="card-body">
              <div class="row">
                  <div class="col-lg-4 mb-3">
                      <label class="label-control">Title <span style="color: red;">*</span></label>
                      <input type="text" value="{{ $arr_data['title'] ?? ''}}" class="form-control" name="title" placeholder="Title" required="required">
                  </div>

                  <div class="col-lg-4 mb-3">
                    <label class="label-control">Image - 1 <span style="color: red;">*</span></label>
                    <input type="file" onchange="view_image(this, '<?php echo $arr_data['id']; ?>');" id="p_image_<?php echo $arr_data['id']; ?>" class="form-control" name="image1" @if($arr_data['image1']=='') required="required" @endif>
                    <!--@if($arr_data['image1'])<a href="{{url('')}}/uploads/images/{{$arr_data['image1']}}" target="_tab">View  Image</a>@endif-->
                    <!--<input type="checkbox" id="check<?php echo $arr_data['id']; ?>" name="check" onclick="display(this, '<?php echo $arr_data['id']; ?>');"> Change Image-->
                  </div>
                
                   <div class="col-lg-4 mb-3">
                    <label class="label-control">Image - 2</label>
                    <input type="file" onchange="view_image2(this, '<?php echo $arr_data['id']; ?>');" id="p_image2_<?php echo $arr_data['id']; ?>" class="form-control" name="image2">
                    <!--@if($arr_data['image2'])<a href="{{url('')}}/uploads/images/{{$arr_data['image2']}}" target="_tab">View Image</a>@endif-->
                  </div>

              </div>
              
              <div class="row">
                  <div class="col-lg-4 mb-3">
                      <!--<label class="label-control">Title <span style="color: red;">*</span></label>
                      <input type="text" value="{{ $arr_data['title'] ?? ''}}" class="form-control" name="title" placeholder="Title" required="required">-->
                  </div>

                  <div class="col-lg-4 mb-3">
                    <!--<label class="label-control">Image - 1 <span style="color: red;">*</span></label>-->
                    <!--<input type="file" class="form-control" name="image1" @if($arr_data['image1']=='') required="required" @endif>
                    @if($arr_data['image1'])<a href="{{url('')}}/uploads/images/{{$arr_data['image1']}}" target="_tab">View Image</a>@endif-->
                    <img id="image_<?php echo $arr_data['id']; ?>" src="{{url('')}}/uploads/images/{{$arr_data['image1']}}" alt="" width="200px" height="150px">
				    <img id="pimage_<?php echo $arr_data['id']; ?>" src="" alt="" style="display:none;" width="250px" height="150px">
                  </div>
                
                   <div class="col-lg-4 mb-3">
                    <!--<label class="label-control">Image - 2</label>
                    <input type="file" class="form-control" name="image2">
                    @if($arr_data['image2'])<a href="{{url('')}}/uploads/images/{{$arr_data['image2']}}" target="_tab">View Image</a>@endif-->
                    <img id="image2_<?php echo $arr_data['id']; ?>" src="{{url('')}}/uploads/images/{{$arr_data['image2']}}" alt="" width="200px" height="150px">
				    <img id="pimage2_<?php echo $arr_data['id']; ?>" src="" alt="" style="display:none;" width="250px" height="150px">
                  </div>

              </div>
                <!-- Nav tabs -->
              <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#about">About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#mission">Our Mission</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#goals">Our Goals</a>
                </li>
              </ul>


              <div class="tab-content">
                <div id="about" class="tab-pane active"><br>
                   <textarea name="about" id="editor1" rows="4" class="form-control ckeditor">{{ $arr_data['about'] ?? ''}}</textarea>
                </div>
                <div id="mission" class="tab-pane fade"><br>
                   <textarea name="our_mission" id="editor1" rows="4" class="form-control ckeditor">{{ $arr_data['our_mission'] ?? ''}}</textarea>
                </div>
                <div id="goals" class="tab-pane fade"><br>
                  <textarea name="our_goals" id="editor1" rows="4" class="form-control ckeditor">{{ $arr_data['our_goals'] ?? ''}}</textarea>
                </div>
              </div>
            </div>
                
                <div class="row">
                    <div class="col-lg-12" style="text-align: center;">
                        <br>
                        <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                         <a href="{{url('')}}/admin/index" class="btn btn-danger btn-md"> Cancel </a>
                    </div>
                </div>
                <br>
            </form>

            </div>
      </div>

     </div>
     


<script>
    initSample();
</script>

 <script>
    CKEDITOR.replace('editor1', {
       height: 300,
       filebrowserUploadUrl: "{{route('menu.upload', ['_token' => csrf_token() ])}}",
       filebrowserUploadMethod: 'form'
    });

    CKEDITOR.config.extraPlugins='justify';
    
   
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
    function view_image2(input,id)
		{		
		    var file = "p_image2_"+id;
			var text = "text2_"+id;
			var image2 = "image2_"+id;
			var pimage2 = "pimage2_"+id;
			
		    document.getElementById(image2).style.display = "none";
				document.getElementById(pimage2).style.display = "block";
				document.getElementById(file).removeAttribute('disabled');
				
				
			var image = "#pimage2_"+id;
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

