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
                               <i class="fas fa-medal"  style="font-size: 18px;"></i> 
                            </div>
                            Features - Contact
                        </h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              All Features List
              <div class="float-right">
                <a href="create-features.php" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm">
                  <i class="far fa-paper-plane fa-sm text-white-50"></i> Create Features
                </a>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Image</th>
                      <th>Title</th>
                      <th>Content</th>
                      <th>Date</th>
                      <th style="width: 75px">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td class="text-center">
                        <img src="img/forgotten_login.png" class="rounded-circle" width="40px">
                      </td>
                      <td>Excepteur sint occaecat </td>
                      <td>cupidatat non proident mollit any laboruys. Sed ut perspiciatis unde om accusantium dolor que totams.</td>
                      <td>2011/04/25</td>
                      <td class="text-center">
                        <a href="" class="btn btn-sm btn-info">
                            <i class="far fa-edit" data-toggle="tooltip" data-placement="left" title="Edit"></i>
                        </a>
                        <a href="" class="btn btn-sm btn-danger">
                            <i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i>
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td class="text-center">
                        <img src="img/forgotten_login.png" class="rounded-circle" width="40px">
                      </td>
                      <td>Excepteur sint occaecat </td>
                      <td>cupidatat non proident mollit any laboruys. Sed ut perspiciatis unde om accusantium dolor que totams.</td>
                      <td>2011/04/25</td>
                      <td class="text-center">
                        <a href="" class="btn btn-sm btn-info">
                            <i class="far fa-edit" data-toggle="tooltip" data-placement="left" title="Edit"></i>
                        </a>
                        <a href="" class="btn btn-sm btn-danger">
                            <i class="far fa-trash-alt" data-toggle="tooltip" data-placement="left" title="Delete"></i>
                        </a>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
</div>
@endsection