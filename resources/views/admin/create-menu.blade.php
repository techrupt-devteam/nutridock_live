@extends('admin.layouts.master')
@section('content')
<script src="{{url('')}}/public/backend/ck/ckeditor/ckeditor.js"></script>
<script src="{{url('')}}/public/backend/ck/ckeditor/js/sample.js"></script>
<link rel="stylesheet" href="{{url('')}}/public/backend/ck/ckeditor/css/samples.css">
<!-- Begin Page Content --> 
    <div class="container-fluid">
      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Create Menu
              <a href="{{url('')}}/admin/view-menu" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back" ><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <form  action="{{url('/')}}/admin/menu/store" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Category <span style="color:red;">*</span></label>
                                <select class="form-control" name="menu_category_id" required="required">
                                    <option value="">Select Category</option>
                                    @foreach($arr_data as $row)
                                    <option value="{{$row->id}}">{{$row->name}}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-lg-6 mb-3">
                               <label class="label-control">Title <span style="color:red;">*</span></label>
                               <input type="text" class="form-control" name="menu_title" placeholder="Title" required="required">
                            </div>

                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Specification <span style="color: red">*</span></label>
                                <select class="form-control" name="specification[]" multiple>
                                    <option value="">Select Specification</option>
                                    @foreach($specification_data as $spec_row)
                                    <option value="{{$spec_row->name}}">{{$spec_row->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Short Description</label>
                                <textarea rows="3" class="form-control w-100" name="menu_description" placeholder="Short Description"></textarea>
                            </div>

                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Select multiple images <span style="color: red">*</span></label>
                                <input type="file" name="files[]" multiple="multiple" class="form-control" required="required" />
                            </div>
                            
                            <div class="col-lg-6 mb-3">
                                <label class="label-control">Ingredients </label>
                                <textarea rows="3" class="form-control w-100" name="ingredients" placeholder="Ingredients"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 mb-3">
                        <label class="label-control">Menu Image <span style="color:red;">*</span></label>
                        <div class="mb-12">
                          <div id="image-preview" class="w-100" style="background-size:contain;background-image: url('img/default-img.jpg');height: 280px;">
                            <label for="image-upload1" id="image-label1"><i class="fa fa-camera" aria-hidden="true"></i></label>
                            <input type="file" name="image" class="user-file" id="image-upload" accept="image/x-png,image/gif,image/jpeg,image/png" required="required"/>
                          </div>
                        </div>
                       <!--  <p class="alert-danger alert mt-3 mb-3">
                          <strong>Note</strong>:- Image Size Width:-1200px, Height:- 800px
                      </p> -->
                    </div>

                    <div class="col-lg-12">
                        <div class="row">
                    <div class="col-lg-12 mb-3">
                                <label class="label-control">What makes this dish special <span style="color:red;">*</span></label>
                                <textarea rows="4" id="editor1" class="form-control w-100" name="what_makes_dish_special" placeholder="What makes this dish special?" required="required"></textarea>
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
@endsection
