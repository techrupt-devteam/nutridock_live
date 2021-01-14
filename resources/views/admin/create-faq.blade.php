
@extends('admin.layouts.master')
@section('content')
<script src="{{url('')}}/public/backend/ck/ckeditor/ckeditor.js"></script>
<script src="{{url('')}}/public/backend/ck/ckeditor/js/sample.js"></script>
<link rel="stylesheet" href="{{url('')}}/public/backend/ck/ckeditor/css/samples.css">

<!-- Begin Page Content -->
    <div class="container-fluid">
      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Create FAQ
              <a href="{{url('')}}/admin/view-faq" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back" ><i class="fas fa-long-arrow-alt-right"></i></a>
            </div>
            <div class="card-body">
                <form  action="{{url('/')}}/admin/faq/store" method="post" enctype="multipart/form-data" onsubmit="return submitData()">
                {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Title <span style="color:red;">*</span></label>
                                <input type="text" class="form-control" name="title" placeholder="Title" required="required">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Description <span style="color:red;">*</span></label>
                                <textarea rows="4" id="editor1" class="form-control w-100 editor_value" name="description" placeholder="Description" required="required"></textarea>
                            </div>
                            <div id="err_edit" style="color:red; margin-left: 12px;"></div>
                        </div>
                    </div>

                    <div class="col-lg-12" style="text-align: center;">
                        <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                         <a href="{{url('')}}/admin/view-faq" class="btn btn-danger btn-md"> Cancel </a>
                    </div>
                </div>
            </form>
            </div>
      </div>
     </div>

<script>
    initSample();
</script>
 <script>
    CKEDITOR.replace('editor1', {
       height: 300,
       filebrowserUploadUrl: "{{route('menu.upload', ['_token' => csrf_token() ])}}",
       filebrowserUploadMethod: 'form'
    });

    CKEDITOR.config.extraPlugins='justify';
    
    function submitData(){
        var editor1 = $('.editor_value').val();
    
        if(editor1 != ""){
            //alert(editor1);
            
            return true;
        }else{
            $('#err_edit').html('Please enter description');
            return false;
        }
    }
  </script>
@endsection
