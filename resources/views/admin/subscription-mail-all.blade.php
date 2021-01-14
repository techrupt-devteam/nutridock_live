@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
      <header class="row page-header page-header-compact page-header-light border-bottom mb-3">
    </header>
      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Subscription Email to All 
              <a href="{{url('')}}/admin/subscription-list" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" title="Back"><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <form action="{{url('/')}}/admin/subscription/email_all" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <div class="row">
                 <div class="col-lg-6">
                    @foreach($arr_data as $row)
                    <input type="hidden" class="form-control" value="{{$row->email ?? ''}}" name="email[]">
                            @endforeach
                     <div class="col-lg-12 mb-3">
                                <label class="label-control">Subject <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="subject" placeholder="Subject" required="required">
                            </div> 
                    <div class="col-lg-12 mb-3">
                        <label class="label-control">Message <span style="color:red;">*</span></label>
                        <textarea rows="5" class="form-control w-100" name="message" placeholder="Message" required="required"></textarea>
                    </div>
                </div>
                <div class="col-lg-12" style="text-align: center;">
                    <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Send Email </button>
                     <a href="{{url('')}}/admin/subscription-list" class="btn btn-danger btn-md"> Cancel </a>
                </div>
            </form>

            </div>
      </div>

     </div>
@endsection
