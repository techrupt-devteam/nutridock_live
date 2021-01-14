@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
      <header class="row page-header page-header-compact page-header-light border-bottom mb-3">
    </header>


      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Email Contact User
              <a href="{{url('')}}/admin/view-contact" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" title="Back"><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <form  action="{{url('/')}}/admin/contactus/email/{{base64_encode($arr_data['id'])}}" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-6">
                        <div class="row">
                        <div class="col-lg-12 mb-3">
                            <label class="label-control">Email <span style="color:red;">*</span></label>
                            <input type="text" class="form-control" value="{{$arr_data['email'] ?? ''}}" name="email" placeholder="Title" required="required" readonly="readonly">
                        </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Subject</label>
                                <input type="text" class="form-control" name="subject" placeholder="Subject" required="required">
                            </div> 
                        </div>
                    </div>
                
                 <div class="col-lg-6">
                    <div class="col-lg-12 mb-3">
                        <label class="label-control">Message</label>
                        <textarea rows="5" class="form-control w-100" name="message" placeholder="Message" required="required"></textarea>
                    </div>
                </div>
                

                <div class="col-lg-12" style="text-align: center;">
                    <!-- <a href="#" class="btn btn-primary btn-md mr-2"> Sumbit </a> -->
                    <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Send Email </button>
                     <a href="{{url('')}}/admin/view-contact" class="btn btn-danger btn-md"> Cancel </a>
                </div>
            </form>

            </div>
      </div>

     </div>
@endsection
