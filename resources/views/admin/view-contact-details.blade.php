@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
      
    
      <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
              View contact Us Page
              <a href="{{url('')}}/admin/view-contact" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back" style="margin-left: 909px;"><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <form  action="{{url('')}}/admin/whyus/update/{{ base64_encode($arr_data['id']) }}" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-6">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Name <span style="color:red;">*</span></label>
                            <input type="text" class="form-control" value="{{$arr_data['name'] ?? ''}}" name="title" placeholder="Title" required="required" readonly="readonly">
                        </div>

                         <div class="col-lg-12 mb-3">
                            <label class="label-control">Subject</label>
                             <input type="text" class="form-control" value="{{$arr_data['subject'] ?? ''}}" name="subject" placeholder="Title" required="required" readonly="readonly">
                        </div>
                        
                    </div>

                     <div class="col-lg-6">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Email</label>
                            <input type="text" name="email" value="{{$arr_data['email'] ?? ''}}" class="form-control" readonly="readonly"> 
                        </div>

                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Message</label>
                            <textarea name="subject" name="message" rows="3" class="form-control" readonly="readonly">{{$arr_data['message'] ?? ''}}</textarea>
                        </div>

                    </div>
                </div>

               

                <div class="col-lg-12" style="text-align: center;">
                    <!-- <a href="#" class="btn btn-primary btn-md mr-2"> Sumbit </a> -->
                    <!-- <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button> -->
                     <a href="{{url('')}}/admin/view-contact" class="btn btn-danger btn-md"> Cancel </a>
                </div>
            </form>

            </div>
      </div>

     </div>
@endsection
