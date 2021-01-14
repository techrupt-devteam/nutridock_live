@extends('admin.layouts.master')
@section('content')
<script src="{{url('')}}/public/backend/ck/ckeditor/ckeditor.js"></script>
<script src="{{url('')}}/public/backend/ck/ckeditor/js/sample.js"></script>
<link rel="stylesheet" href="{{url('')}}/public/backend/ck/ckeditor/css/samples.css">
<!-- Begin Page Content -->
    <div class="container-fluid">
      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Edit Menu
              <a href="{{url('')}}/admin/view-menu" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back" ><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <form action="{{url('')}}/admin/menu/menu_update/{{ base64_encode($arr_data['id']) }}" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">

                             <div class="col-lg-6 mb-3">
                                <label class="label-control">Category <span style="color:red;">*</span></label>
                                 <select class="form-control" name="menu_category_id" required="required">
                                    <option value="">Select Category</option>
                                    @foreach($cate_data as $row)
                                    <option @if($row->id == $arr_data['menu_category_id']) selected="selected" @endif value="{{$row->id}}" value="{{$row->id}}">{{$row->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Title <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" value="{{$arr_data['menu_title'] ?? ''}}" name="menu_title" placeholder="Title" required="required">
                            </div>

                             <div class="col-lg-6 mb-3">
                                <label class="label-control">Specification <span style="color: red">*</span></label>
                                <select class="form-control" name="specification[]" multiple >
                                     <option value="">Select Specification</option>
                                    <?php $arr_spec = explode(",",$arr_data['specification']);
                                          foreach($specification_data as $spec_row): ?>
                                        <option  <?php if(in_array($spec_row->name, $arr_spec)) { echo "selected"; } ?> value="{{ $spec_row->name }}">{{ $spec_row->name }}</option> 
                                    <?php endforeach; ?>
                                </select>
                            </div>


                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Short Description</label>
                                <textarea rows="4" class="form-control w-100" name="menu_description" placeholder="Short Description">{{$arr_data['menu_description'] ?? ''}}</textarea>
                            </div>
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Select multiple images<span style="color: red">*</span></label>
                                <input type="file" name="files[]" multiple="multiple" class="form-control" @if(!$arr_data['multiple_image']) required="required" @endif/>
                                <input type="hidden" value="{{$arr_data['multiple_image'] ?? ''}}" name="pre_images" >
                            </div>
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Ingredients </label>
                                <textarea rows="3" class="form-control w-100" name="ingredients" placeholder="Ingredients">{{$arr_data['ingredients'] ?? ''}}</textarea>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4 mb-3">
                        <label class="label-control">Menu Image <span style="color:red;">*</span></label>
                        <div class="mb-12">
                          <!--<div id="image-preview" class="w-100" style="background-size:contain;background-image: url('img/default-img.jpg');height: 180px;">-->
                          <div class="w-100" >
                            
                            <input type="file" name="image" class="form-control" onchange="view_image(this, '<?php echo $arr_data['id']; ?>');" id="p_image_<?php echo $arr_data['id']; ?>" accept="image/x-png,image/gif,image/jpeg,image/png" @if(!$arr_data['image'])  required="required" @endif/>
                          </div>
                          <!--<a href="{{url('')}}/uploads/images/{{$arr_data['image']}}" target="_tab">View Image</a>-->
                        </div>
                        <div class="mb-12">
                          <div class="w-100">
                              <br>
                            <img id="image_<?php echo $arr_data['id']; ?>" src="{{url('')}}/uploads/images/{{$arr_data['image']}}" alt="" width="100%" height="150px" style="border:1px solid;">
			                <img id="pimage_<?php echo $arr_data['id']; ?>" src="" alt="" style="display:none;" width="100%" height="150px">
                          </div>
                        </div>
                    </div>

                     <div class="col-lg-12">
                        <div class="row">
                    <div class="col-lg-12 mb-3">
                                <label class="label-control">What makes this dish special <span style="color:red;">*</span></label>
                                <textarea rows="4" id="editor1" class="form-control w-100" name="what_makes_dish_special" placeholder="What makes this dish special>" required="required">{{$arr_data['what_makes_dish_special'] ?? ''}}</textarea>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12" style="text-align: center;">
                        <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                         <a href="{{url('')}}/admin/view-menu" class="btn btn-danger btn-md"> Cancel </a>
                    </div>
                </div>
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

  </script>
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
