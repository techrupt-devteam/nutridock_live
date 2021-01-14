@extends('layouts.master')
@section('content')
<section class="breadcrumbs-custom">
    <div class="parallax-container" data-parallax-img="{{url('')}}/public/front/img/faq-bg.jpg">
    	<div class="material-parallax parallax">
    		<img src="{{url('')}}/public/front/img/faq-bg.jpg" alt="" style="display: block; transform: translate3d(-50%, 149px, 0px);">
    	</div>
      <div class="breadcrumbs-custom-body parallax-content context-dark">
        <div class="container">
          <h2 class="breadcrumbs-custom-title">Frequently Asked Questions </h2>
        </div>
      </div>
    </div>
    <div class="breadcrumbs-custom-footer">
      <div class="container">
        <ul class="breadcrumbs-custom-path">
          <li><a href="index.html">Home</a></li>
          <li><a href="grid-blog.html">Blog</a></li>
          <li class="active">Faq</li>
        </ul>
      </div>
    </div>
</section>
 <!-- ======= Frequently Asked Questions Section ======= -->
    <section id="faq" class="faq section-bg">
        <!--<div class="w-100 mb-3"> -->
        <!--  <ul class="nav nav-pills Categories-portfolio" role="tablist">-->
        <!--     <li class="nav-item"> -->
        <!--      <a class="nav-link active" data-toggle="pill" href="#tab1"> -->
        <!--        Faq -->
        <!--      </a> -->
        <!--     </li>-->
        <!--     <li class="nav-item"> -->
        <!--      <a class="nav-link" data-toggle="pill" href="#tab2"> -->
        <!--        Subscribe Plan -->
        <!--      </a> -->
        <!--     </li>-->
        <!--    </ul>-->
        <!--</div>-->
        
        <!--<div class="w-100 d-flex justify-content-center mt-2">-->
        <!--    <div class="tab-content w-100">-->
        <!--        <div class="tab-pane filter-active active" id="tab1">-->
        <!--            f-->
        <!--        </div>-->
        <!--        <div class="tab-pane" id="tab2">-->
        <!--            2-->
        <!--        </div>-->
        <!--    </div>-->
        <!--</div>-->
       
      <div class="container" data-aos="fade-up">
        <ul class="faq-list" data-aos="fade-up" data-aos-delay="100">
          
          @foreach($arr_data as $row)
          <li>
            <a data-toggle="collapse" class="text-darkness" href="#faq{{$row['id']}}"> 
              <span class="text-success"> {{ $no++ }}. </span> 
              {{$row['title']}}
                <i class="fa fa-angle-down"></i></a>
            <div id="faq{{$row['id']}}" @if($row['id']==1) class="collapse show" @endif class="collapse" data-parent=".faq-list">
              <p ><?php echo stripslashes($row['description']); ?></p>
                
            </div>
          </li>
          @endforeach


        </ul>

      </div>
    </section>
@endsection