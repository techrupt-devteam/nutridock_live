@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
      <header class="row page-header page-header-compact page-header-light border-bottom mb-3">
        <div class="container-fluid">
            <div class="page-header-content">
                <div class="row align-items-center justify-content-between pt-2">
                    <div class="col-auto mb-2">
                        <h1 class="page-header-title">
                            <div class="page-header-icon"><i class="fas fa-wind"></i></div>
                            Top Categories - Create Top Categories
                        </h1>
                    </div>
                    <div class="col-auto mb-3 ml-auto">
                        <a href="{{url('')}}/admin/view-top-categories" class="btn btn-dark btn-sm" data-toggle="tooltip" data-placement="left" title="Back">
                            <i class="fas fa-long-arrow-alt-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>
      <!-- <div class="card shadow mb-4">
            <div class="card-header py-3">
              Blog
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Blog Title</label>
                                <input type="text" class="form-control" name="blog_title" placeholder="Title">
                            </div>
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Blog Description</label>
                                <textarea rows="4" class="form-control w-100" name="blog_description" placeholder="Description"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-3">
                        <label class="label-control">Blog Image</label>
                        <div class="mb-12">
                          <div id="image-preview" style="background-size:cover;background-image: url('img/default-img.jpg');">
                            <label for="image-upload1" id="image-label1"><i class="fa fa-camera" aria-hidden="true"></i></label>
                            <input type="file" name="image" class="user-file" id="image-upload" accept="image/x-png,image/gif,image/jpeg,image/png" />
                          </div>
                        </div>
                        <p class="alert-danger alert mt-3 mb-3">
                          <strong>Note</strong>:- Image Size Width:-420px, Height:- 502px*
                      </p>
                    </div>
                </div>
            </div>
      </div> -->

      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Create Top Categories Page
            </div>
            <div class="card-body">
                <form  action="{{url('/')}}/admin/healthyfarm/store" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-lg-12 mb-4">
                                <label class="label-control">Type</label>
                                <select class="form-control" name="type">
                                    <option value="">Select</option>
                                    <option value="Feel-Better Food">Feel-Better Food</option>
                                    <option value="Home Bistro">Home Bistro</option>
                                    <option value="One-Bowl Nourishers">One-Bowl Nourishers</option>
                                    <option value="Takeout Twists">Takeout Twists</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="col-lg-12 mb-4">
                            <label class="label-control">Dish Name</label>
                            <input type="text" class="form-control" name="dish_name" placeholder="Dish Name">
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="col-lg-12 mb-4">
                            <label class="label-control">Image</label>
                            <input type="file" class="form-control" name="image">
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Description</label>
                                <textarea rows="3" class="form-control w-100" name="description" placeholder="Description"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">What makes this dish special ?</label>
                                <textarea rows="3" class="form-control w-100" name="dish_special" placeholder="What makes this dish special?"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Mutiple images</label>
                                <input type="file" class="form-control" name="image">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <table id="maintable" border="1" width="100%">
                            <tr>
                                <th>Name</th>
                                <th>Image</th>
                            </tr>
                            <tr>
                                <td><input type="text" name="ingredients_name[]" class="form-control"></td>
                                <td><input type="file" name="ingredients_image[]" class="form-control"></td>
                            </tr>
                            
                        </table>
                        <input type="button" value="add" id="addRows" class="pull-right"/>
                    </div>
                    
                    
                    
                    <div class="col-lg-12" style="text-align: center;">
                        <!-- <a href="#" class="btn btn-primary btn-md mr-2"> Sumbit </a> -->
                        <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                         <a href="{{url('')}}/admin/view-our-healthy-farm" class="btn btn-danger btn-md"> Cancel </a>
                    </div>
                </div>
            </form>

            </div>
      </div>

     </div>


@endsection


