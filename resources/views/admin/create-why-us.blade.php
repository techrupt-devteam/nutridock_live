@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
      

      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Create Why Us Page
              <a href="{{url('')}}/admin/view-why-us" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back"><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <form  action="{{url('/')}}/admin/whyus/store" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-6">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Title <span style="color:red;">*</span></label>
                            <input type="text" class="form-control" name="title" placeholder="Title" required="required">
                        </div>
                    </div>

                     <div class="col-lg-6">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Image <span style="color:red;">*</span></label>
                            <input type="file" class="form-control" name="image" required="required">
                        </div>
                    </div>
                </div>

                <div class="row">
                     <div class="col-lg-6">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Description</label>
                            <textarea rows="5" class="form-control w-100" name="description" placeholder="Description"></textarea>
                        </div>
                    </div>

                     <div class="col-lg-6">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Title Description <span style="color:red;">*</span></label>
                            <textarea rows="5" class="form-control w-100" name="title_description" placeholder="Title Description" required="required"></textarea>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12" style="text-align: center;">
                    <!-- <a href="#" class="btn btn-primary btn-md mr-2"> Sumbit </a> -->
                    <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                     <a href="{{url('')}}/admin/view-why-us" class="btn btn-danger btn-md"> Cancel </a>
                </div>
            </form>

            </div>
      </div>

     </div>
@endsection
