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
                            Survey - View Survey
                        </h1>
                    </div>
                    <div class="col-auto mb-3 ml-auto">
                    	<a href="{{url('')}}/admin/survey_list" class="btn btn-dark btn-sm" data-toggle="tooltip" data-placement="left" title="Back">
                    		<i class="fas fa-long-arrow-alt-left"></i>
                    	</a>
                    </div>
                </div>
            </div>
        </div>
    </header>

      <div class="card shadow mb-4">
            <div class="card-header py-3">
              Survey Description Page
            </div>
            <div class="card-body">
               
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Would you want to download a nutrition app to help you keep a check on your nutritional needs?</label>
                                <input type="text" class="form-control" name="blog_title" placeholder="Post tags title" value="{{ $arr_data['download_app'] ?? ''}}" readonly="readonly">
                            </div>
                            
                            @if($arr_data['download_app'] =='Yes')         
                                  <div class="col-lg-12 mb-3">
                                    <label class="label-control">The most important feature you look in a nutrition app?</label>
                                    <textarea rows="4" class="form-control w-100" name="comments" placeholder="Comments" readonly="readonly">{{ $arr_data['comments'] ?? ''}}</textarea>
                                </div>    
                            @else
                                 <div class="col-lg-12 mb-3">
                                <label class="label-control">What refrains you from using a nutrition app?</label>
                                <textarea rows="4" class="form-control w-100" name="refrains" placeholder="Refrains" readonly="readonly">{{ $arr_data['refrains'] ?? ''}}</textarea>
                            </div>     
                            @endif
                           
                        </div>
                    </div>
                   
                   
                    <div class="col-lg-12" style="text-align: center;">
                       <!--  <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Sumbit </button> -->
                        <a href="{{url('')}}/admin/survey_list" class="btn btn-danger btn-md"> OK </a>
                    </div>
                </div>
          

            </div>
      </div>

     </div>
@endsection
