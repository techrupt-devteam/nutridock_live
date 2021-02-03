@extends('admin.layouts.master')
@section('content')

<!-- Begin Page Content -->
<style type="text/css">
  .contact-detail {
    color: #1cc88a;
    font-size: 13px;
  }
  h1.plan-name {
    font-size: 16px;
    font-weight: 800;
    color: limegreen;
    text-transform: uppercase;
    margin: 0;
}
.total-days {
    display: flex;
    font-weight: 600;
    color: #222;
}
.total-days span {
    width: 50%;
    font-weight: 400;
    color: #444;
}
</style>
  <div class="container-fluid">
  <!-- DataTales Example -->
  <div class="card shadow mb-4 mt-4">
    <div class="card-header py-3">
      Discount List
        <div class="float-right">
        <a href="javascript:;" class="btn btn-sm btn-success" type="button" data-toggle="modal" data-target="#myModal">
          <i class="fa fa-plus fa-sm text-white-50"></i>  </a>
      </div><br><br>
        @if(Session::has('duplicate_entry'))
            <div class="alert alert-danger">
              {{ Session::get('duplicate_entry') }}
            </div>
        @endif

        @if(Session::has('success'))
          <div class="alert alert-success">
            {{ Session::get('success') }}
          </div>
        @endif

      @if(Session::has('error'))
        <div class="alert alert-danger">
          {{ Session::get('error') }}
        </div>
      @endif
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Sr.No</th>
              <th>Coupon Code</th>
              <th>Extension Days</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <?php $cnt=0; foreach($arr_data as $row): $cnt++; ?>
           <tbody>
            <tr>
             <td><?php echo $cnt; ?></td>
             <td><?php echo $row->coupon_code; ?></td>
             <td><?php echo $row->extension_days; ?></td>
             <td> <?php if($row->status=="Active"){ ?>
                  <!-- <a href="{{url('/')}}/admin/coupon_code_inactive/{{ base64_encode($row->coupon_code_id) }}" class="btn btn-sm btn-success"><i class="fa fa-check" data-toggle="tooltip" data-placement="left" title="Action"></i></a> -->
                  <form action="{{url('/')}}/admin/coupon_code_inactive/{{ 
                  base64_encode($row->coupon_code_id) }}" method="POST">
                  {{csrf_field()}}
                  <button type="sumbit" onclick="return confirm('Are you sure to inactive this record ?');" class="btn btn-sm btn-success" value="submit" name="submit">Active</button>
                </form>
                <?php }else{ ?>
                  <form action="{{url('/')}}/admin/coupon_code_active/{{ base64_encode($row->coupon_code_id) }}" method="POST">
                    {{csrf_field()}}
                  <button type="sumbit" onclick="return confirm('Are you sure to active this record ?');" class="btn btn-sm btn-warning" value="submit" name="submit">Inactive</button>
                </form>
                <?php } ?></td>
             <td style="text-align: center; min-width: 101px;">
                <a href="javascript:;" class="btn btn-sm btn-info" data-target="#EditModal<?php echo $row->coupon_code_id; ?>" data-toggle="modal"><i class="fa fa-pen" data-toggle="tooltip" data-placement="left" title="Edit"></i></a>
                <a href="{{url('/')}}/admin/coupon_code_delete/{{ base64_encode($row->coupon_code_id) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure to remove this record ?');"><i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i></a>
              </td>
            </tr>
          </tbody>
          <?php endforeach; ?>
        </table>
      </div>

      <!-- Modal -->
      <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-lg">
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Coupon Code - Add</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <form  action="{{url('/')}}/admin/store_coupon_code" method="post" enctype="multipart/form-data">
              {{csrf_field()}}
              <div class="row">
                  <div class="col-lg-12">
                      <div class="row">
                         <div class="col-lg-6 mb-3">
                            <label class="label-control">Coupon Code <span style="color: red;">*</span></label>
                            <input type="text" class="form-control" name="coupon_code" placeholder="Coupon Code" required="required">
                          </div>
                          <div class="col-lg-6 mb-3">
                            <label class="label-control">Extension Days <span style="color: red;">*</span></label>
                            <input type="text" class="form-control" name="extension_days" placeholder="Extension Days" required="required">
                          </div>
                      </div>
                  </div>
              </div>
              <div class="row">
              <div class="col-lg-12 text-right">
                  <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                   <button type="button" class="btn btn-danger btn-md" data-dismiss="modal">Cancel</button>
              </div>
              </div>
            </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Close Modal -->


      <!-- Edit modal -->
      <?php foreach($editarr_data as $row): ?>
      <div class="modal fade" id="EditModal<?php echo $row->coupon_code_id; ?>" role="dialog">
        <div class="modal-dialog modal-lg">
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Coupon Code - Edit</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <form  action="{{url('/')}}/admin/update_coupon_code/<?php echo base64_encode($row->coupon_code_id); ?>" method="post" enctype="multipart/form-data">
              {{csrf_field()}}
            <div class="row">
            <div class="col-lg-12">
               <div class="row">
                <div class="col-lg-6 mb-3">
                  <label class="label-control">Coupon Code <span style="color: red;">*</span></label>
                  <input type="text" class="form-control" value="<?php echo $row->coupon_code; ?>" name="coupon_code" placeholder="Coupon Code" required="required">
                  <input type="hidden" value="<?php echo $row->coupon_code_id; ?>" name="coupon_code_id">
                </div>
                <div class="col-lg-6 mb-3">
                  <label class="label-control">Extension Days <span style="color: red;">*</span></label>
                  <input type="text" class="form-control" value="<?php echo $row->extension_days; ?>" name="extension_days" placeholder="Extension Days" required="required">
                </div>
                </div>
            </div>
            </div>
            <div class="row">
            <div class="col-lg-12 text-right">
                <button class="btn btn-primary btn-md mr-2" name="sumbit" type="sumbit" value="submit"> Submit </button>
                 <button type="button" class="btn btn-danger btn-md" data-dismiss="modal">Cancel</button>
            </div>
          </div>
        </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Edit modal close -->
      <?php endforeach; ?>


    </div>
  </div>
</div>
<script>
  function discountType(){
    var discount_on_amount = $('#discount_on_amount').val();
    var discount_on_percent = $('#discount_on_percent').val();

    alert(1); 
  }
</script>
@endsection