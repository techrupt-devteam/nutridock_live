@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
    <header class="row page-header page-header-compact page-header-light border-bottom mb-3">
       
    </header>
     
      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Create How We Work Page
              <a href="{{url('')}}/admin/view-how-we-work" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" title="Back"><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <form  action="{{url('/')}}/admin/howwework/store" method="post" enctype="multipart/form-data">
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
                            <label class="label-control">Icon Image</label>
                            <input type="file" class="form-control" name="icon_image">
                        </div>
                    </div>
                </div>

                <div class="row">
                     <div class="col-lg-6">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Description <span style="color:red;">*</span></label>
                            <textarea rows="5" class="form-control w-100" name="description" placeholder="Description" required="required"></textarea>
                        </div>
                    </div>
                    </div>
                 <div class="col-lg-12" style="text-align: center;">
                    <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Sumbit </button>
                     <a href="{{url('')}}/admin/view-how-we-work" class="btn btn-danger btn-md"> Cancel </a>
                </div>    
                </div>

                
            </form>

            </div>
      </div>

     </div>
@endsection
