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
                            Webinar - View Webinar
                        </h1>
                    </div>
                    <div class="col-auto mb-3 ml-auto">
                    	<a href="{{url('')}}/admin/webinar_list" class="btn btn-dark btn-sm" data-toggle="tooltip" data-placement="left" title="Back">
                    		<i class="fas fa-long-arrow-alt-left"></i>
                    	</a>
                    </div>
                </div>
            </div>
        </div>
    </header>

      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Webinar Description Page
            </div>
            <div class="card-body">
               
                <div class="row">
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Name</label>
                                <input type="text" class="form-control" name="name" placeholder="Name" value="{{ $arr_data['name'] ?? ''}}" readonly="readonly">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Mobile</label>
                                <input type="text" class="form-control" name="mobile" placeholder="Mobile" value="{{ $arr_data['mobile'] ?? ''}}" readonly="readonly">
                            </div>
                        </div>

                         <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">City</label>
                                <input type="text" class="form-control" name="city" placeholder="City" value="{{ $arr_data['city'] ?? ''}}" readonly="readonly">
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Email</label>
                                <input type="text" class="form-control" name="email" placeholder="Email" value="{{ $arr_data['email'] ?? ''}}" readonly="readonly">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Age</label>
                                <input type="text" class="form-control" name="age" placeholder="Age" value="{{ $arr_data['age'] ?? ''}}" readonly="readonly">
                            </div>
                        </div>
                    </div>
                   
                   
                    <div class="col-lg-12" style="text-align: center;">
                       <!--  <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Sumbit </button> -->
                        <a href="{{url('')}}/admin/webinar_list" class="btn btn-danger btn-md"> OK </a>
                    </div>
                </div>
           

            </div>
      </div>

     </div>
@endsection
