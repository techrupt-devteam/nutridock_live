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
                            Send - Email
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
              Email Description Page
            </div>
            <div class="card-body">
                
                <div class="row">
                    <div class="col-md-12" style="text-align: center;">
                        <label class="">
                          <input type="radio" checked="checked" name="r1" value="2" onchange="show(this.value)">
                          <span class="checkmark"></span> Send mail to paid client
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="">
                          <input type="radio" name="r1" id="e1" value="3" onchange="show2()">
                          <span class="checkmark"></span> Send mail to unpaid client
                        </label>
                    </div>
                </div>
                <hr>

                <form  action="{{url('/')}}/admin/webinar/send_email" method="post" enctype="multipart/form-data">
                {{csrf_field()}}    

            <?php foreach($arr_data as $row):?>
                <input type="hidden" value="<?php echo $row['email']; ?>" name="email_multiple[]"> 
            <?php endforeach; ?>

                <div class="row" id="sh1">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-6">
                                <!-- <div class="col-lg-12 mb-3">
                                    <label class="label-control">Name</label>
                                    <input type="text" class="form-control" name="name" placeholder="Name" readonly="readonly" value="{{ $arr_data['name'] ?? ''}}">
                                </div> -->
                                <div class="col-lg-12 mb-3">
                                    <label class="label-control">Subject</label>
                                    <input type="text" class="form-control" name="title" placeholder="Subject">
                                </div>
                                
                            </div>


                            <div class="col-lg-6">
                                <!-- <div class="col-lg-12 mb-3">
                                    <label class="label-control">Email</label>
                                    <input type="text" class="form-control" name="email" placeholder="Email"  readonly="readonly" value="{{ $arr_data['email'] ?? ''}}">
                                </div> -->
                                <div class="col-lg-12 mb-3">
                                    <label class="label-control">Zoom Link</label>
                                    <input type="text" class="form-control" name="zoom_link" placeholder="Zoom Link">
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <div class="col-lg-12 mb-3">
                                    <label class="label-control">Description</label>
                                    <textarea rows="4" class="form-control w-100" name="email_description" placeholder="Description"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" style="text-align:center;">
                        <!-- <a href="#" class="btn btn-primary btn-md mr-2"> Sumbit </a> -->
                        <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Sumbit </button>
                         <a href="{{url('')}}/admin/webinar_list" class="btn btn-danger btn-md"> Cancel </a>
                    </div>
                </div>
            </form>

             <div class="row" id="sh2" style="display:none;">
                
                <form  action="{{url('/')}}/admin/webinar/send_email_pending" method="post" enctype="multipart/form-data">
                {{csrf_field()}}  

                <?php foreach($arr_pending_data as $pending_row):?>
                    <input type="hidden" value="<?php echo $pending_row['email']; ?>" name="email_multiple[]"> 
                <?php endforeach; ?>
  
                <div class="row" id="sh1">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-12">
                                <!-- <div class="col-lg-12 mb-3">
                                    <label class="label-control">Name</label>
                                    <input type="text" class="form-control" name="name" placeholder="Name" readonly="readonly" value="{{ $arr_data['name'] ?? ''}}">
                                </div> -->
                                <div class="col-lg-12 mb-3">
                                    <label class="label-control">Subject</label>
                                    <input type="text" class="form-control" name="title" placeholder="Subject">
                                </div>
                                
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-12 mb-3">
                                    <label class="label-control">Description</label>
                                    <textarea rows="4" class="form-control w-100" name="email_description" placeholder="Description"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" style="text-align:center;">
                        <!-- <a href="#" class="btn btn-primary btn-md mr-2"> Sumbit </a> -->
                        <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Sumbit </button>
                         <a href="{{url('')}}/admin/webinar_list" class="btn btn-danger btn-md"> Cancel </a>
                    </div>
                </div>
            </form>

             </div>
            </div>
      </div>

     </div>
@endsection


 <script type="text/javascript">
    function show(str){
        document.getElementById('sh2').style.display = 'none';
        document.getElementById('sh1').style.display = 'block';
    }
    function show2(sign){
        document.getElementById('sh2').style.display = 'block';
        document.getElementById('sh1').style.display = 'none';
    }
</script>