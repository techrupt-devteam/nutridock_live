<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Nutridock</title>
<link href="{{url('')}}/public/backend/assets/images/favicon.png" rel="icon">
<link href="{{url('')}}/public/backend/assets/images/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Custom fonts for this template-->
<link href="{{url('')}}/public/backend/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="{{url('')}}/public/backend/css/sb-admin-2.min.css" rel="stylesheet">
<link href="{{url('')}}/public/backend/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">
  <!-- Sidebar - Brand --> 
  <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{url('')}}/admin/index">
  <div class="sidebar-brand-icon"> <img src="{{url('')}}/public/backend/assets/images/logo-mini.svg" style="width: 35px"> </div>
  <div class="sidebar-brand-text mx-3"> Nutridock </div>
  </a> 
  <!-- Divider -->
  <hr class="sidebar-divider my-0">
  <!-- Nav Item - Dashboard -->
  <li class="nav-item"> <a class="nav-link" href="{{url('')}}/admin/index"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a> </li>
  <!-- Divider -->
  <hr class="sidebar-divider">
  <!-- Heading -->
  <div class="sidebar-heading"> Interface </div>
  <?php if($session_user['roles'] == 'Webinar'){ ?>
  <li class="nav-item"> <a class="nav-link" href="{{url('')}}/admin/webinar_list"> <i class="fas fa-fw fa-photo-video"></i> <span>Webinar</span></a> </li>
  <li class="nav-item"> <a class="nav-link" href="{{url('')}}/admin/survey_list"> <i class="fas fa-fw fa-photo-video"></i> <span>Survey</span></a> </li>
  <li class="nav-item"> <a class="nav-link" href="{{url('')}}/admin/subscription-list"> <i class="fas fa-fw fa-photo-video"></i> <span>Subscription</span></a> </li>
  <?php }else{ ?>
  <li class="nav-item"> <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour"> 
  <i class="far fa-fw fa-address-card"></i> <span>Manage Subscription</span> </a>
    <div id="collapseFour" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded"> <a class="collapse-item" href="{{url('')}}/admin/view-coupon-code">Manage Coupon Code</a>  <a class="collapse-item" href="{{url('')}}/admin/view-subscribe-now-user">Subscribe Now</a>
      <a class="collapse-item" href="{{url('')}}/admin/view-subscribe-now">Manage Subscribe Now</a></div>
  </li>
  <li class="nav-item"> <a class="nav-link" href="{{url('')}}/admin/slider-list"> <i class="fas fa-fw fa-sliders-h"></i> <span>Slider</span></a> </li>
  <li class="nav-item"> <a class="nav-link" href="{{url('')}}/admin/view-our-healthy-farm"> <i class="fas fa-fw fa-weight"></i> <span>Our Healthy Farm</span></a> </li>
  <li class="nav-item"> <a class="nav-link" href="{{url('')}}/admin/view-why-us"> <i class="far fa-fw fa-question-circle"></i> <span>Why us</span></a> </li>
  <li class="nav-item"> <a class="nav-link" href="{{url('')}}/admin/view-testimonials"> <i class="fas fa-fw fa-quote-right"></i> <span>Testimonials</span></a> </li>
  <li class="nav-item"> <a class="nav-link" href="{{url('')}}/admin/subscription-list"> <i class="fas fa-fw fa-rss-square"></i> <span>Subscription</span></a> </li>
  <li class="nav-item"> <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> 
  <i class="far fa-fw fa-address-card"></i> <span>About Us</span> </a>
    <div id="collapseOne" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded"> <a class="collapse-item" href="{{url('')}}/admin/aboutus/view-about-us/1">About Us</a> <a class="collapse-item" href="{{url('')}}/admin/view-how-we-work">How we work</a> <a class="collapse-item" href="{{url('')}}/admin/view-our-services">Our Services</a> 
    </div>
  </li>
  <li class="nav-item"> <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> <i class="fas fa-fw fa-photo-video"></i> <span>Blog</span> </a>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded"> <a class="collapse-item" href="{{url('')}}/admin/view-category-list">Category</a> <a class="collapse-item" href="{{url('')}}/admin/view-blog">Manage Blog</a> </div>
    </div>
  </li>
  <li class="nav-item"> <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree"> <i class="fas fa-fw fa-utensils"></i> <span>Menu</span> </a>
    <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded"> <a class="collapse-item" href="{{url('')}}/admin/view-specification-list">Specification</a> <a class="collapse-item" href="{{url('')}}/admin/view-menu">Manage Menu</a> </div>
    </div>
  </li>
  <li class="nav-item"> <a class="nav-link" href="{{url('')}}/admin/view-faq"> <i class="fab fa-fw fa-quora"></i> <span>FAQ</span></a> </li>
  <li class="nav-item"> <a class="nav-link" href="{{url('')}}/admin/view-contact"> <i class="fas fa-fw fa-phone-square-alt"></i> <span>Contact us</span></a> </li>

  <li class="nav-item"> <a class="nav-link" href="{{url('')}}/admin/view-contact"> <i class="fas fa-fw fa-phone-square-alt"></i> <span>Contact us</span></a> </li>

  <li class="nav-item"> <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive"> 
  <i class="far fa-fw fa-address-card"></i> <span>New Subscription</span> </a>
    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionSidebar">
      <div class="bg-white py-2 collapse-inner rounded">   <a class="collapse-item" href="{{url('')}}/admin/view-subscribe-now-user">Subscribe Now</a>
  </li>

  <?php } ?>
  <!-- Divider -->
  <hr class="sidebar-divider d-none d-md-block">
  <!-- Sidebar Toggler (Sidebar) -->
  <div class="text-center d-none d-md-inline">
    <button class="rounded-circle border-0" id="sidebarToggle"></button>
  </div>
</ul>
<!-- End of Sidebar --> 
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
<!-- Main Content -->
<div id="content">
<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-light shadow topbar mb-0 static-top"> 
  <!-- Sidebar Toggle (Topbar) -->
  <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3"> <i class="fa fa-bars"></i> </button>
  <!-- Topbar Navbar -->
  <ul class="navbar-nav ml-auto">
    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
    <li class="nav-item dropdown no-arrow d-sm-none"> <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-search fa-fw"></i> </a> 
      <!-- Dropdown - Messages -->
      <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
        <form class="form-inline mr-auto w-100 navbar-search">
          <div class="input-group">
            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
            <div class="input-group-append">
              <button class="btn btn-primary" type="button"> <i class="fas fa-search fa-sm"></i> </button>
            </div>
          </div>
        </form>
      </div>
    </li>
    <div class="topbar-divider d-none d-sm-block"></div>
    <!-- Nav Item - User Information -->
    <li class="nav-item dropdown no-arrow"> <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span class="mr-2 d-none d-lg-inline text-gray-600 small"> {{$session_user->name}}</span> <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60"> </a> 
      <!-- Dropdown - User Information -->
      <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown"> 
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="{{url('/')}}/logout">
        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout </a> </div>
    </li>
  </ul>
</nav>
<!-- End of Topbar --> 
