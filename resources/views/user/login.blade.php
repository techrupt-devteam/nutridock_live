<!DOCTYPE html>
<html lang="en">
<style type="text/css">
  .align-center{
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
  }
</style>
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

</head>

<body class="bg-gradient-success">

  <div class="container align-center">
    <!-- Outer Row -->
    <div class="row justify-content-center">
      <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="pt-5 pb-5 p-3">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4"> <img src="{{url('')}}/public/backend/img/logo-dark.svg" style="height: 45px;"/> </h1>
                  </div>
                   @if(Session::has('error'))
                    <div class="alert alert-danger">
                      {{ Session::get('error') }}
                    </div>
                  @endif
                  @if(Session::has('success'))
                    <div class="alert alert-success">
                      {{ Session::get('success') }}
                    </div>
                  @endif
                  
                  <form class="user" action="{{url('/')}}/validate_login" method="post">
                     {{csrf_field()}}
                    <div class="form-group">
                      <input autocomplete="off" type="email" name="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address..." >
                       <span id="error_email" style="color: red; font-size: 14px;"></span>
                    </div>
                    <div class="form-group">
                      <input type="password" name="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">
                      <span id="error_pwd" style="color: red; font-size: 14px;"></span>
                    </div>
                   
                    <!-- <a href="index.html" class="btn btn-primary btn-user btn-block">
                      Login</a> -->
                    <button class="btn btn-primary btn-user btn-block" id="checkvalidation">Login</button>
                  </form>
                  <hr>
                  
                  <!-- <div class="text-center">
                    <a class="small" href="register.html">Create an Account!</a>
                  </div> -->
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="{{url('')}}/public/backend/vendor/jquery/jquery.min.js"></script>
  <script src="{{url('')}}/public/backend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="{{url('')}}/public/backend/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="{{url('')}}/public/backend/js/sb-admin-2.min.js"></script>
    
<script>
    $( document ).ready(function() {
      $( "#checkvalidation" ).click(function() {
      
        var email = $('#exampleInputEmail').val();
        var pwd = $('#exampleInputPassword').val();
        if(email==''){
         $('#error_email').html('Please enter valide email id.');
         return false;
        }
        else if(pwd==''){
         $('#error_pwd').html('Please enter valide password.');
         return false;
        }
        else{
          return true;
        }

    });
});
</script>
</body>

</html>
