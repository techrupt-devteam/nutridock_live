@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <?php foreach($blog_data as $blog_row); ?>
            <div class="card-header py-3">
              <span style="color: black;"><b> Blog Title -</b></span> {{$blog_row->blog_title}}
              <div class="float-right">
                 <a href="{{url('')}}/admin/view-blog" class="btn btn-dark btn-sm float-right" data-toggle="tooltip" data-placement="left" title="Back"><i class="fas fa-long-arrow-alt-right"></i></a>
              </div><br><br>
               @if(Session::has('success'))
                <div class="alert alert-success">
                  {{ Session::get('success') }}
                </div>
              @endif
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th style="width: 5px;">#</th>
                      <th style="width: 20px;">Name</th>
                      <th style="width: 10px;">Email</th>
                      <th style="width: 10px;">Message</th>
                      <th style="width: 10px;">Reply</th>
                      <th style="width: 10px;">Date</th>
                      <th style="width: 10px;">Approve&nbsp;Status</th>
                      <th style="width: 15px;">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $cnt=0; foreach($arr_data as $row): $cnt++;
                      ?>
                    <tr>
                      <td style="vertical-align: middle;"><?php echo $cnt; ?></td>
                      <td width="15%"><?php echo $row->name; ?></td>
                      <td class="text-center" width="4%"><?php echo $row->email; ?></td>
                      <td width="25%">{!!  substr(strip_tags($row->message), 0, 50) !!}</td>
                      <td width="25%">{!!  substr(strip_tags($row->reply), 0, 50) !!}</td>
                      <td width="15%"><?php $originalDate = $row->created_at; $newDate=date("d-m-Y",strtotime($originalDate)); echo $newDate; ?></td>
                      <td><?php if($row->approve_status == "Disapprove"){ ?>
                        <form action="{{url('/')}}/admin/blog/approve_comments/<?php echo $row->comment_reply_id; ?>" method="post">
                          {{csrf_field()}}
                          <input type="hidden" value="<?php echo base64_encode($row->blog_id); ?>" name="blog_id">
                          <button class="btn btn-sm btn-primary" type="submit" onclick="return confirm('Are you sure to approve this comment ?');"><b>Disapprove</b></button>
                        </form>
                      <?php }else{ ?>
                        <form action="{{url('/')}}/admin/blog/disapprove_comments/<?php echo $row->comment_reply_id; ?>" method="post">
                          {{csrf_field()}}
                            <input type="hidden" value="<?php echo base64_encode($row->blog_id); ?>" name="blog_id">
                            <button class="btn btn-sm btn-success" type="submit" style="width: 90px;" onclick="return confirm('Are you sure to disapprove this comment ?');"><b>Approve</b></button>
                        </form>
                      <?php } ?></td>
                      <td width="15%">
                      	<a href="javascript:;" data-toggle="modal" data-target="#myModal<?php echo $row->comment_reply_id; ?>" class="btn btn-sm btn-info">
                      		<i class="far fa-comments" data-toggle="tooltip" data-placement="left" title="Comment"></i></a>
                        <a href="{{url('/')}}/admin/blog/comment_delete/{{base64_encode($row->id)}}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure to remove this record ?');"><i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i></a>
                      </td>
                    </tr>
                    <?php endforeach; ?>
                  </tbody>
                </table>
              </div>

              <!-- Modal -->
              <?php  foreach($arr_data as $row): ?>
              <div class="modal fade" id="myModal<?php echo $row->comment_reply_id; ?>" role="dialog">
                <div class="modal-dialog modal-lg">
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Give Reply</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                      <form  action="{{url('/')}}/admin/blog/comment_update/{{$row->comment_reply_id}}" method="post" enctype="multipart/form-data">
                      {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                             <div class="col-lg-12 mb-3">
                                <label class="label-control">Comment</label>
                                <textarea rows="4" class="form-control w-100" name="message" placeholder="Message" readonly="readonly">{{$row->message}}</textarea>
                                <input type="hidden" value="{{$row->comment_reply_id}}" name="comment_reply_id">
                                <input type="hidden" value="{{$row->id}}" name="comment_id">
                            </div>
                            <div class="col-lg-12 mb-3">
                                <label class="label-control">Reply <span style="color:red;">*</span></label>
                                <textarea rows="4" class="form-control w-100" name="reply" placeholder="Reply" required="required">{{$row->reply}}</textarea>
                            </div>
                        </div>
                    </div>
                  
                    <div class="col-lg-12" style="text-align: center;">
                        <button class="btn btn-primary btn-md mr-2" name="submit" type="submit" value="submit"> Submit </button>
                         <button type="button" class="btn btn-danger btn-md" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </form>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Close Modal -->
              <?php endforeach; ?>

            </div>
          </div>
        </div>
@endsection