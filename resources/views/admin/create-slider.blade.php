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
                <form  action="{{url('/')}}/admin/slider/store" method="post" enctype="multipart/form-data">
                {{csrf_field()}}


                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Title </label>
                                <input type="text" class="form-control" name="slider_title" placeholder="Slider title" >
                            </div>
                            
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Slider Image <span style="color: red;">*</span></label>
                                <div id="image-preview" class="w-100" style="background-size:contain;background-image: url('img/default-img.jpg');height: 250px;">
                                <label for="image-upload1" id="image-label1"><i class="fa fa-camera" aria-hidden="true"></i></label>
                                <input type="file" name="image" class="user-file" id="image-upload" accept="image/x-png,image/gif,image/jpeg,image/png" required="required"/>
                              </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-lg-12" style="text-align: center;">
                        <!-- <a href="#" class="btn btn-primary btn-md mr-2"> Sumbit </a> -->
                        <button class="btn btn-primary btn-md mr-2" name="sumbit" type="submit" value="submit"> Sumbit </button>
                         <a href="{{url('')}}/admin/slider-list" class="btn btn-danger btn-md"> Cancel </a>
                    </div>
                </div>
            </form>

            </div>
      </div>

     </div>
@endsection
