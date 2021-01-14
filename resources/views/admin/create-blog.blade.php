@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
<script src="{{url('')}}/public/backend/ck/ckeditor/ckeditor.js"></script>
<script src="{{url('')}}/public/backend/ck/ckeditor/js/sample.js"></script>
<link rel="stylesheet" href="{{url('')}}/public/backend/ck/ckeditor/css/samples.css">

    <div class="container-fluid">
      <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
              Create Blog
              <a href="{{url('')}}/admin/view-blog" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back"><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <form  action="{{url('/')}}/admin/blog/store" method="post" enctype="multipart/form-data" onsubmit="return Validate();">
                {{csrf_field()}}


                <div class="row">
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Category <span style="color:red;">*</span></label>
                                <select class="form-control" name="category_id" required="required">
                                    <option value="">Select Category</option>
                                    @foreach($arr_data as $row)
                                    <option value="{{$row->id}}">{{$row->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                              <div class="col-lg-12 mb-3">
                                <label class="label-control">Title <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="blog_title" placeholder="Title" required="required">
                            </div>
                           
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Link <span style="color:red;">*</span> <small style="color: red;">(Note - Special characters are not allowed !)</small></label>
                                <input type="text" class="form-control" name="link" placeholder="Link" required="required" id="txtName">
                                <div id="err_specialcharacter" style="color: red;"></div>
                                @if(Session::has('err_duplicate'))
                                  <div style="color: red;">{{ Session::get('err_duplicate') }}</div>
                                 @endif
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                              <label class="label-control">Blog Image <span style="color:red;">*</span></label>
                              <div class="mb-12">
                                <div id="image-preview" class="w-100" style="background-size:contain;background-image: url('img/default-img.jpg');height: 150px;">
                                  <label for="image-upload1" id="image-label1"><i class="fa fa-camera" aria-hidden="true"></i></label>
                                  <input type="file" name="image" class="user-file" id="image-upload" accept="image/x-png,image/gif,image/jpeg,image/png" required="required"/>
                                </div>
                              </div>
                              <p class="alert-danger alert mt-3 mb-3" style="font-size: 13px;">
                                <strong>Note</strong>:- Image Size Width:-394px, Height:- 870px
                            </p>
                            </div>
                        </div>
                    </div>

                     <div class="col-lg-6">
                      <div class="row">
                      <div class="col-lg-12 mb-3">
                          <label class="label-control">Meta Title <span style="color:red;">*</span></label>
                          <input type="text" class="form-control" name="meta_title" placeholder="Meta Title" required="required">
                      </div>

                      <div class="col-lg-12 mb-3">
                          <label class="label-control">Meta Keywords <span style="color:red;">*</span></label>
                          <input type="text" class="form-control" name="meta_keywords" placeholder="Meta Keywords" required="required">
                      </div>

                       <div class="col-lg-12 mb-3">
                          <label class="label-control">Meta Description <span style="color:red;">*</span></label>
                          <textarea rows="3" class="form-control w-100" name="meta_description" placeholder="Meta Description" required="required"></textarea>
                      </div>
                    </div>
                    </div>

                    <div class="col-md-6">
                      <div class="row">
                      <div class="col-lg-12 mb-3">
                          <label class="label-control">Image Title <span style="color:red;">*</span></label>
                          <input type="text" class="form-control" name="image_title" placeholder="Image Title" required="required">
                      </div>
                      
                       <div class="col-lg-12 mb-3">
                          <label class="label-control">Image Description <span style="color:red;">*</span></label>
                          <textarea rows="3" class="form-control w-100" name="image_description" placeholder="Image Description" required="required"></textarea>
                      </div>
                      </div>
                    </div>

                    <div class="col-lg-12">
                      <div class="row">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Description <span style="color:red;">*</span></label>
                            <textarea rows="3" id="editor1" class="form-control w-100" name="blog_description" placeholder="Description" required="required"></textarea>
                        </div>
                      </div>
                    </div>

                    <div class="col-lg-12" style="text-align: center;">
                        <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit" onclick="Validate()"> Submit </button>
                         <a href="{{url('')}}/admin/view-blog" class="btn btn-danger btn-md"> Cancel </a>
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
