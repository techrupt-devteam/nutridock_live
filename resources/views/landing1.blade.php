<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Nutridock</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="{{url('')}}/public/landing/assets/img/favicon.png" rel="icon">
  <link href="{{url('')}}/public/landing/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Prata&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Lobster+Two&display=swap" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="{{url('')}}/public/landing/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="{{url('')}}/public/landing/assets/vendor/icofont/icofont.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="{{url('')}}/public/landing/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Maundy - v2.1.0
  * Template URL: https://bootstrapmade.com/maundy-free-coming-soon-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex flex-column align-items-center">
      <img src="{{url('')}}/public/landing/assets/img/nutridock.svg" style="max-width: 150px;margin-bottom: 10px">
      <h2 style="font-family: 'Prata', serif;">We're Comming Soon !!</h2>
      <!-- <div class="countdown d-flex justify-content-center" data-count="2020/8/31">
        <div>
          <h3>%D</h3>
          <h4>Days</h4>
        </div>
        <div>
          <h3>%H</h3>
          <h4>Hours</h4>
        </div>
        <div>
          <h3>%M</h3>
          <h4>Minutes</h4>
        </div>
        <div>
          <h3>%S</h3>
          <h4>Seconds</h4>
        </div>
      </div> -->

      

      <div class="social-links text-center">
        <!-- <a href="#" class="twitter"><i class="icofont-twitter"></i></a> -->
        <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
        <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
        <!-- <a href="#" class="google-plus"><i class="icofont-skype"></i></a> -->
        <a href="#" class="linkedin"><i class="icofont-linkedin"></i></a>
      </div>

    </div>
  </header><!-- End #header -->

  <main id="main">
    <section id="about" class="about">
      <div class="container">

        <div class="section-title">
          <h2>About Us</h2>
          <p>Illo velit quae dolorem voluptate pireda notila set. <br/>Corrupti voluptatum tempora iste ratione deleniti corrupti nostrum ut</p>
        </div>

        <div class="row mt-2">
          <div class="col-lg-3 col-md-6 icon-box">
            <div class="icon"><i class="icofont-chart-bar-graph"></i></div>
            <h4 class="title"><a href="">Our Process</a></h4>
            <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati </p>
          </div>
          <div class="col-lg-3 col-md-6 icon-box">
            <div class="icon"><i class="icofont-bullseye"></i></div>
            <h4 class="title"><a href="">Our Vision</a></h4>
            <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo </p>
          </div>
          <div class="col-lg-3 col-md-6 icon-box">
            <div class="icon"><i class="icofont-computer"></i></div>
            <h4 class="title"><a href="">Our Approach</a></h4>
            <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
          </div>
          <div class="col-lg-3 col-md-6 icon-box">
            <div class="icon"><i class="icofont-fast-food"></i></div>
            <h4 class="title"><a href="">Our Objective</a></h4>
            <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
          </div>
        </div>

      </div>
    </section>

    <section id="contact" class="contact">
      <div class="container">
      <div class="section-title">
         <h2>Webinar</h2>
         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,</p>
         <p> <a href="#" id="btnShowHide" class="btn btn-dark mt-3">Pay Now</a> </p>
      </div>    
           
         
 <div class="floatton-container" id="divShowHide" data-id="9"> 
   <fieldset class="payment-form">
     <!-- <legend>Payment</legend> -->
  
    <span class="floatton-close dashicons dashicons-no-alt" id="close"> 
      <i class="fa fa-times fa-lg" aria-hidden="true"></i>
    </span>
 
  <div class="tab-pane fade show active">
   <form action="{{url('/')}}/page/payment" method="post">
     {{csrf_field()}}
        <ul class="row p-0">
            <li class="col-md-6 mt-2" style="list-style: none;">
              <label class="gfield_label">Full Name <span class="gfield_required" style="color: red;">*</span></label>
              <div class="ginput_container ginput_container_text">
                  <input type="text" autocomplete="off" name="name">
              </div>
            </li>
            <li class="col-md-6 mt-2" style="list-style: none;">
              <label class="gfield_label">Email Id <span class="gfield_required" style="color: red;">*</span></label>
              <div class="ginput_container ginput_container_email">
                  <input type="email" name="email" autocomplete="off">
              </div>
            </li>

            <li class="col-md-6 col-lg-3 mt-2" style="list-style: none;">
              <label class="gfield_label"> Phone </label>
              <div class="ginput_container ginput_container_email">
                  <input type="text" name="mobile" autocomplete="off">
              </div>
            </li>

            <li class="col-md-6 col-lg-3 mt-2" style="list-style: none;">
              <label class="gfield_label"> Age </label>
              <div class="ginput_container">
                  <input type="text" name="age" ><!-- data-date-format="dd/mm/yyyy" id="datepicker" -->
              </div>
            </li>
            
            <li class="col-md-6 mt-2" style="list-style: none;">
              <label class="gfield_label">City<span class="gfield_required" style="color: red;">*</span></label>
              <div class="ginput_container">
                <input type="text"  name="city" autocomplete="off"> 
                <input type="hidden" name="amount" autocomplete="off" value="150"> 
              </div>
            </li>
            <li class="col-12 mt-4" style="list-style: none;">
              <div class="ginput_container ginput_container_email text-center">
                  <button class="btn btn-danger btn-lg" type="submit">Pay Now</button>
              </div>
            </li>
          </ul>
        </form>
      </div>
   </fieldset>
 </div>
      
      </div> 
    
      <div class="container">
        <div class="subscribe">
        <h4 style="font-family: 'Lobster Two', cursive;">Subscribe now to get the latest updates!</h4>
        <form action="forms/notify.php" method="post" role="form" class="">
          <div class="subscribe-form">
            <input type="email" name="email" placeholder="Enter your email"><input type="submit" value="Subscribe">
          </div>
          <div class="mt-2">
            <div class="loading">Loading</div>
            <div class="error-message"></div>
            <div class="sent-message">Your notification request was sent. Thank you!</div>
          </div>
        </form>
      </div>
      </div>
    </section>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Nutridock</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        Designed by <a href="#">Techrupt.in</a>
      </div>
    </div>
  </footer><!-- End #footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="{{url('')}}/public/landing/assets/vendor/jquery/jquery.min.js"></script>
  <script src="{{url('')}}/public/landing/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="{{url('')}}/public/landing/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="{{url('')}}/public/landing/assets/vendor/php-email-form/validate.js"></script>
  <script src="{{url('')}}/public/landing/assets/vendor/jquery-countdown/jquery.countdown.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet"/>
  <!-- Template Main JS File -->
  <script src="{{url('')}}/public/landing/assets/js/main.js"></script>
  <script type="text/javascript">
   jQuery(document).ready(function(){
    jQuery('#btnShowHide').on('click', function(event) {    
    //console.log(1);    
        jQuery('#divShowHide').toggle('show');
      });

      jQuery('#close').on('click', function(event) {    
      //console.log(2);    
          jQuery('#divShowHide').toggle('hide');
      });
  });
  </script>
  <script type="text/javascript">
    $('#datepicker').datepicker({
        weekStart: 1,
        daysOfWeekHighlighted: "6,0",
        autoclose: true,
        todayHighlight: true,
    });
    $('#datepicker').datepicker("setDate", new Date());
</script>
</body>

</html>