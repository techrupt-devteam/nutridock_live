@extends('layouts.master')
@section('content')

<section class="breadcrumbs-custom">
        <div class="parallax-container" data-parallax-img="{{url('')}}/public/front/img/bg-blog.jpg">
          <div class="material-parallax parallax">
            <img src="{{url('')}}/public/front/img/bg-blog.jpg" alt="" style="display: block; transform: translate3d(-50%, 149px, 0px);">
          </div>
          <div class="breadcrumbs-custom-body parallax-content context-dark">
            <div class="container">
              <h2 class="breadcrumbs-custom-title">Blog Post</h2>
            </div>
          </div>
        </div>
        <div class="breadcrumbs-custom-footer">
          <div class="container">
            <ul class="breadcrumbs-custom-path">
              <li><a href="{{url('')}}">Home</a></li>
              <li class="active">Blog Detail</li>
            </ul>
          </div>
        </div>
      </section>

      <?php foreach($arr_data as $row); 
      $category_id = $row->category_id;
      $blog_id = $row->id;
      $value  = \DB::table('categories')->where('id',$category_id)->get();
      foreach($value as $cate_row);?>
      <main>   
      <section class="section section-xl bg-default text-md-left mb-5 pt-5">
        <div class="container">
          <div class="row row-50 row-md-60">
            <div class="col-lg-8 col-xl-9">
               <div class="inset-xl-right-70">
                 <div class="row row-50 row-md-60 row-lg-80 row-xl-100">
                  <div class="col-12">
                    <!-- Post Modern-->
                    <article class="post post-modern box-xxl">
                      <div class="post-modern-panel">
                        <div><a class="post-modern-tag" href="#">{{$cate_row->name}}</a></div>
                        <div>
                        <time class="post-modern-time" datetime="2020-08-09">{{ date('F d, Y', strtotime($row->created_at)) }}</time>
                        </div>
                      </div>
                      <h3 class="post-modern-title"><a href="blog-details.php">{{$row->blog_title}}</a></h3><a class="post-modern-figure" href="blog-details.php"><img src="{{url('')}}/public/front/img/post-7-800x394.jpg" alt="" width="800" height="394"></a>
                      <p class="post-modern-text"><?php echo stripslashes($row->blog_description); ?></p>
                    </article>
                  
                    <div class="single-post-bottom-panel">
                      <div class="group-sm group-justify">
                        <div class="mobile-size-adjut">
                          <div class="group-sm group-tags"><a class="link-tag" href="#">Fruits</a>
                          <a class="link-tag" href="#">Vegetables</a><a class="link-tag" href="#">Drinks</a>
                          </div>
                        </div>
                        <div>
                          <div class="group-xs group-middle"><span class="list-social-title">Share</span>
                            <div>
                              <ul class="list-inline list-social list-inline-sm">
                                <li><a class="icon mdi mdi-facebook" href="#"><i class="icofont-facebook"></i></a></li>
                                <li><a class="icon mdi mdi-twitter" href="#"><i class="icofont-twitter"></i></a></li>
                                <li><a class="icon mdi mdi-instagram" href="#"><i class="icofont-instagram"></i></a></li>
                                <li><a class="icon mdi mdi-google-plus" href="#"><i class="icofont-google-plus"></i></a></li>
                              </ul>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <?php if($benefits_data){ ?>
                    <div class="mb-3">
                    <h3 class="text-dark">Top 9 Benefits of Cabbage</h3>
                    </div>
                  <?php } ?>
                    @foreach($benefits_data as $row)
                    
                    
                    <div class="mb-3">
                    <h5 class="mt-2 mb-2" style="font-family: 'Ruda', sans-serif;color: #333;">{{$row->title}}</h5>
                    <img src="{{url('')}}/uploads/images/{{$row->image}}" class="img-fluid d-block mx-auto mt-4 mb-3">
                    <p class="mt-2">{{$row->title_description}}</p>
                   </div>
                   @endforeach
                  </div>

                  <div class="col-12">
                    <h6 class="single-post-title">Related Posts</h6>
                    <div class="row row-30">
                      <?php $random_value = \DB::table('blog')->where('category_id',$category_id)->inRandomOrder()->limit(2)->get();
                      foreach($random_value as $random_blog_row): ?>
                      <div class="col-sm-6">
                        <article class="post post-classic box-md"><a class="post-classic-figure" href="{{url('')}}/blog_detail/{{base64_encode($random_blog_row->id)}}"><img src="{{url('')}}/uploads/images/{{$random_blog_row->image}}" alt="" width="370" height="239"></a>
                          <div class="post-classic-content">
                            <div class="post-classic-time">
                              <time datetime="2020-09-08"> {{ date('F d, Y', strtotime($random_blog_row->created_at)) }}</time>
                            </div>
                            <h5 class="post-classic-title"><a href="{{url('')}}/blog_detail/{{base64_encode($random_blog_row->id)}}">{{$random_blog_row->blog_title}}</a></h5>
                            <p class="post-classic-text">{!!  substr(strip_tags($random_blog_row->blog_description), 0, 150) !!}</p>
                          </div>
                        </article>
                      </div>
                      <?php endforeach; ?>
                    </div>
                  </div>
                  <div class="col-12">
                    <h6 class="single-post-title">Comments</h6>
                    <?php foreach($comment as $key => $comment_row):
                        foreach ($comment_row as $key_dtl => $row) {
                         $getname = \DB::table('comments')->select('name')->where('id',$row->comment_id)->get();
                          foreach($getname as $row_name);
                          $reply_data = end($comment_row);
                          foreach($reply_data as $reply_row);
                          $realArray = (array)$reply_data;
                          $value = array_slice($realArray,4,1);
                          //print_r($value); die; ?>
                    
                    <div class="box-comment">
                      <div class="unit flex-column flex-sm-row unit-spacing-md">
                        <div class="unit-body bg-gray w-100">
                          <?php if($key_dtl==0 ){?>
                          <div class="group-sm group-justify"><!-- group-sm group-justify -->
                            <div>
                              <div class="group-xs group-middle">
                                <h5 class="box-comment-author ml-0" >
                                  <a href="#"><?php echo $row_name->name; ?></a>
                                </h5>
                              </div>
                            </div>
                          </div>
                        <?php } ?>

                          <div class="box-comment-text ml-2"><?php echo $row->message; ?>
                            <div class="box-comment-time">
                             <i class="icofont-clock-time" style="font-size: 13px"></i>
                             <time datetime="2020-08-30">{{ date('F d, Y', strtotime($row->created_at)) }}</time>
                            </div>
                          </div>
                        </div>
                      </div>
                      <?php
                            foreach ($max_record as $max_row); ?>
                      <?php if($row->reply){ ?>
                      <div class="box-comment border-0 admin-reply">
                        <div class="unit flex-column flex-sm-row unit-spacing-md">
                          <div class="unit-body w-100">
                            <div class="group-sm group-justify">
                              <div>
                                <div class="group-xs group-middle">
                                  <h5 class="box-comment-author ml-0 mb-2">
                                    <a href="javascript:;">Admin</a>
                                  </h5>
                                </div>
                              </div>
                                                           
                            </div>
                            <div class="box-comment-text ml-2">
                              <?php echo $row->reply; ?>
                              <?php if($row->reply == $value['reply']){ ?>
                              <div class="box-comment-time custom-border-bottom"><!--custom-border-bottom-->
                                <i class="icofont-clock-time" style="font-size: 15px"></i>
                                <time datetime="2020-08-30">{{ date('F d, Y', strtotime($row->created_at)) }}</time>
                                 <button type="submit" class="reply btn box-comment-reply" data-val="<?php echo $row->comment_reply_id; ?>" >
                                <i class="icofont-chat" style="font-size: 13px"></i> Reply
                              </button>
                              </div>
                               <?php } ?> 
                            </div>
                          </div>
                        </div>
                      </div>
                    <?php } ?>
                    </div>
                    
                    <div style="display: none;" class="divReplyComment divReply<?php echo $row->comment_reply_id; ?>">
                          <form action="{{url('')}}/comment/new_comment" method="post"><!-- {{url('/')}}/comment/update_comment/{{$row->id}} -->
                        <div class="form-row row">
                          <div class="col col-md-12 mb-3 form-group">
                            <!--<textarea type="text" name="reply" class="form-control reply_data" placeholder="Reply"></textarea> -->
                            <input type="hidden" name="_token" id="token" value="{{ csrf_token() }}">
                            <!-- <input type="text" name="message_data" id="msg" value="ererer"> -->
                            <textarea type="text" name="message_data" id="message_data" class="form-control " placeholder="Message"></textarea> 
                            <!-- <input type="text" name="reply_data" class="reply_data form-control" placeholder="Reply"> -->
                            <input type="hidden" name="blog_id" value="{{$row->blog_id}}" class="blog_id_data">
                            <input type="hidden" name="comment_id" class="comment_id_data" value="{{$row->comment_id}}">
                            <input type="hidden" name="id" class="id_data" value="{{$max_row->id}}">
                            <div class="validate"></div>
                          </div>
                        </div>
                        <div class="text-right">
                          <button type="submit" class="submitForm btn btn-success" data-val="<?php echo $row->id; ?>"> Submit</button></div>
                      </form>
                    </div>
                    
                    
                  <?php } endforeach; ?>
                  
                  </div>
                  <div class="col-12 mt-40 pt-4">
                    <h6 class="single-post-title">Leave a comment</h6>
                    <form action="{{url('')}}/comment/store_comment" method="post"><!-- role="form" class="php-email-form" -->
                      {{csrf_field()}}
                      <div class="form-row row">
                        <div class="col-12 col-md-6 mb-3 form-group">
                          <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required="required">
                          <input type="hidden" name="blog_id" value="{{$blog_id}}">
                          <div class="validate"></div>
                        </div>
                        <div class="col-12 col-md-6 mb-3 form-group">
                          <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" required="required">
                          <div class="validate"></div>
                        </div>
                      </div>
                      <div class="form-group mt-3 mb-3">
                        <textarea class="form-control" name="message" rows="5" data-msg="Please write something for us" placeholder="Message" required="required"></textarea>
                        <div class="validate"></div>
                      </div>
                      <div class="text-left"><button type="submit" class="button">Send Message</button></div>
                    </form>
                  </div>
                 </div>
               </div>
            </div>
            <div class="col-lg-4 col-xl-3">
              <div class="aside row row-30 row-md-50 justify-content-md-between">
                <div class="aside-item col-12">
                  <div class="team-info box-sm">
                    <a class="team-info-figure" href="#">
                      <img src="{{url('')}}/public/front/img/user-4-123x123.jpg" alt="" width="123" height="123">
                    </a>
                    <h6 class="team-info-title"><a href="#">Caroline Lopez</a></h6>
                    <p class="team-info-text">I am the leading editor and blogger at Farm website.</p>
                  </div>
                </div>
                <div class="aside-item col-sm-6 col-md-5 col-lg-12">
                  <h6 class="aside-title">Categories</h6>
                  <ul class="list-categories">
                    @foreach($cate_data as $cate_row)
                      <?php $cate_id = $cate_row->id;
                      $value = \DB::table('blog')->where('category_id',$cate_id)->get();
                      ?>
                      <li><a href="#">{{$cate_row->name}}</a><span class="list-categories-number">({{count($value)}})</span></li>
                      @endforeach
                  </ul>
                </div>
                <div class="aside-item col-sm-6 col-lg-12">
                  <h6 class="aside-title">Latest Posts</h6>
                  <div class="row row-20 row-lg-30 gutters-10 mt-4">
                    <div class="col-6 col-lg-12">
                      <article class="post post-minimal">
                        <div class="unit unit-spacing-sm flex-column flex-lg-row align-items-lg-center">
                          <div class="unit-left"><a class="post-minimal-figure" href="blog-details.php">
                            <img src="{{url('')}}/public/front/img/post-mini-1-106x104.jpg" alt="" width="106" height="104"></a>
                          </div>
                          <div class="unit-body">
                            <p class="post-minimal-title"><a href="blog-details.php">Why Organic Food is Full of Benefits</a></p>
                            <div class="post-minimal-time">
                              <time datetime="2020-03-15">March 15, 2020</time>
                            </div>
                          </div>
                        </div>
                      </article>
                    </div>
                    <div class="col-6 col-lg-12">
                      <!-- Post Minimal-->
                      <article class="post post-minimal">
                        <div class="unit unit-spacing-sm flex-column flex-lg-row align-items-lg-center">
                          <div class="unit-left"><a class="post-minimal-figure" href="blog-details.php">
                            <img src="{{url('')}}/public/front/img/post-mini-2-106x104.jpg" alt="" width="106" height="104"></a>
                          </div>
                          <div class="unit-body">
                            <p class="post-minimal-title">
                              <a href="blog-details.php">5 Perfect Fruits for Breakfast</a>
                            </p>
                            <div class="post-minimal-time">
                              <time datetime="2020-03-15">March 15, 2020</time>
                            </div>
                          </div>
                        </div>
                      </article>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>

  
@endsection

