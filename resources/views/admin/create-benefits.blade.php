@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
      
      
      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Create Benefits
              <a href="{{url('')}}/admin/view-blog" class="btn btn-dark btn-sm" data-toggle="tooltip" data-placement="left" title="Back" style="margin-left: 885px;"><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <form  action="{{url('/')}}/admin/blog/benefits_store" method="post" enctype="multipart/form-data">
                {{csrf_field()}}


                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                            <?php foreach($cate_data as $row);  ?>
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Blog Name</label>
                                <input type="text" class="form-control" value="{{$row->name ?? ''}}" name="" placeholder="Blog Title">
                            </div>

                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Title</label>
                                <input type="text" class="form-control" value="{{$arr_data['blog_title'] ?? ''}}" name="blog_title" placeholder="Title">
                            </div>
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Description</label>
                                <textarea rows="4" class="form-control w-100" name="blog_description" placeholder="Description">{{$arr_data['blog_description'] ?? ''}}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-3">
                        <label class="label-control">Blog Image</label>
                        <div class="mb-12">
                          <div id="image-preview" class="w-100" style="background-size:contain;background-image: url('img/default-img.jpg');height: 350px;">
                            <label for="image-upload1" id="image-label1"><i class="fa fa-camera" aria-hidden="true"></i></label>
                            <input type="file" name="image" class="user-file" id="image-upload" accept="image/x-png,image/gif,image/jpeg,image/png" />
                          </div>
                        </div>
                        <a href="{{url('')}}/uploads/images/{{$arr_data['image'] ?? ''}}" target="_tab">View image</a>
                        <p class="alert-danger alert mt-3 mb-3">
                          <strong>Note</strong>:- Image Size Width:-1200px, Height:- 800px
                      </p>
                    </div>

                    <div class="col-lg-12" style="text-align: center;">
                        <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                         <a href="{{url('')}}/admin/view-blog" class="btn btn-danger btn-md"> Cancel </a>
                    </div>
                </div>
            </form>

            </div>
      </div>

     </div>
@endsection
