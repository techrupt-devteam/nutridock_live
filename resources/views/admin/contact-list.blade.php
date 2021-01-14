@extends('admin.layouts.master')
@section('content')
<!-- Begin Page Content -->
    <div class="container-fluid">
      <header class="row page-header page-header-compact page-header-light border-bottom mb-3">
        <div class="container-fluid">
            <div class="page-header-content">
                <div class="row align-items-center justify-content-between pt-3">
                    <div class="col-auto mb-2">
                        <h1 class="page-header-title">
                            <div class="page-header-icon">
                                <i class="far fa-id-badge" style="font-size: 18px;"></i>
                            </div>
                            Contact - Total Contact
                        </h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
        <script>
             @if (session('contact_delete'))
            //Swal.fire( 'You clicked the button!','success')
             Swal.fire("{{ session('contact_delete') }}");
             @endif
        </script>
    <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              All Contact List
              <div class="float-right">
                <a href="{{url('/')}}/admin/contact/send-mail" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm">
                  <i class="far fa-paper-plane fa-sm text-white-50"></i> Send Mail
                </a>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Subject</th>
                      <th>Message</th>
                      <th>Date</th>
                      <th style="width: 75px">Action</th>
                    </tr>
                  </thead>
                  <tbody>

                    <?php $cnt=0; foreach($arr_data as $row): $cnt++; ?>
                    <tr>
                      <td>{{$cnt}}</td>
                      <td><?php echo $row['name']; ?></td>
                      <td><?php echo $row['email']; ?></td>
                      <td><?php echo $row['subject']; ?></td>
                      <td>{!!  substr(strip_tags($row['message']), 0, 25) !!}</td>
                      <td><?php $originalDate=$row['created_at']; $newDate=date("d-m-Y",strtotime($originalDate)); echo $newDate; ?></td>
                      <td class="text-center">
                        <a href="" class="btn btn-sm btn-info">
                            <i class="fas fa-reply-all" data-toggle="tooltip" data-placement="left" title="Reply"></i> 
                        </a>
                        <a href="{{url('/')}}/admin/contact/delete/{{ base64_encode($row['id']) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure to remove this record ?');">
                            <i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i>
                        </a>
                      </td>
                    </tr>
                  <?php endforeach; ?>
                   <!--  <tr>
                      <td>2</td>
                      <td>
                        Mayur Sir
                      </td>
                      <td>graphicdesigner@techrupt.in</td>
                      <td>Excepteur sint occaecat </td>
                      <td>cupidatat non proident mollit any laboruys. Sed ut perspiciatis unde om accusantium dolor que totams.</td>
                      <td>2011/04/25</td>
                      <td class="text-center">
                        <a href="" class="btn btn-sm btn-info">
                            <i class="fas fa-reply-all" data-toggle="tooltip" data-placement="left" title="Reply"></i> 
                        </a>
                        <a href="" class="btn btn-sm btn-danger">
                            <i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i>
                        </a>
                      </td>
                    </tr> -->
                  </tbody>
                </table>
              </div>
            </div>
          </div>
</div>
@endsection