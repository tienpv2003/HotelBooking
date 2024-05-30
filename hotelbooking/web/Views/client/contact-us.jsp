<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="vi">
    
<!-- Mirrored from demoxml.com/html/hotelbooking/contact-us.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 17 May 2024 09:20:05 GMT -->
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Đặt phòng khách sạn</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="icon" href="img/favicon.ico" sizes="16x16">

        <!-- fonts -->
		<link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Karla:700,400' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lora:400,700' rel='stylesheet' type='text/css'>

        <!-- fontawesome -->
		<link rel="stylesheet" href="css/font-awesome.css" />

        <!-- bootstrap -->
		<link rel="stylesheet" href="css/bootstrap.min.css" />

        <!-- uikit -->
        <link rel="stylesheet" href="css/uikit.min.css" />

        <!-- animate -->
        <link rel="stylesheet" href="css/animate.css" />
        <link rel="stylesheet" href="css/datepicker.css" />
        <!-- Owl carousel 2 css -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <!-- rev slider -->
        <link rel="stylesheet" href="css/rev-slider/settings.css" />
        <!-- lightslider -->
        <link rel="stylesheet" href="css/lightslider.css">
        <!-- Theme -->
        <link rel="stylesheet" href="css/reset.css">
        
        <!-- custom css -->
		<link rel="stylesheet" href="style.css" />
        <!-- responsive -->
		<link rel="stylesheet" href="css/responsive.css" />

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!-- This Template Is Fully Coded By Aftab Zaman from swiftconcept.com -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body id="contact_us_page">

        
        <!-- start header -->
        <header class="header_area">

            <!-- start header top -->
            <div class="header_top_area">
                <div class="container">
                    <div class="row">
                        <div class="header_top clearfix">
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                                <div class="left_header_top">
                                    <ul>
                                        <li><a href="#"><img src="img/temp-icon.png" alt="temp-icon">Luân Đôn, GR 17°C</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 floatright">
                                <div class="right_header_top clearfix floatright">
                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="">
                                            <a class="border-right-dark-4" href="#">Đăng nhập</a></li>
                                        <li role="presentation" class="dropdown">
                                            <a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
                                              Đăng ký
                                              <span class="caret"></span>
                                            </a>
                                            <!-- <ul id="menu2" class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                              <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                                              <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                                              <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                                            </ul> -->
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end header top  -->

            <!-- start main header -->
            <div class="main_header_area">
                <div class="container">
                    <!-- start mainmenu & logo -->
                    <div class="mainmenu">
                        <div id="nav">
                            <nav class="navbar navbar-default">
                                <!-- Brand and toggle get grouped for better mobile display -->
                                <div class="navbar-header">
                                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Chuyển đổi điều hướng thành</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                  </button>
                                  <div class="site_logo fix">
                                      <a id="brand" class="clearfix navbar-brand" href="index.html"><img src="img/site-logo.png" alt="Trips"></a>
                                      <!-- <div class="header_login floatleft">
                                          <ul>
                                              <li><a href="#">Login</a></li>
                                              <li><a href="#">Register</a></li>
                                          </ul>
                                      </div>   -->         
                                  </div>
                                </div>

                                <!-- Collect the nav links, forms, and other content for toggling -->
                                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                                  <ul class="nav navbar-nav">
                                    <li role="presentation" class="dropdown">
                                        <a id="drop-one" href="index.html" class="dropdown-toggle">
                                          Trang chủ
                                        </a>
                                        <!-- <ul id="menu1" class="dropdown-menu" role="menu">
                                          <li role="presentation"><a role="menuitem" tabindex="-1" href="index-two.html">Home Page two</a></li>
                                        </ul> -->
                                    </li>        
                                    <li><a href="accomodation.html">Chỗ ở</a></li>
                                    <li><a href="gallery.html">Phòng trưng bày</a></li>
                                    <li role="presentation" class="dropdown">
                                        <a id="drop2" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
                                            Đặc trưng
                                        </a>
                                        <ul id="menu2" class="dropdown-menu" role="menu">
                                          <li role="presentation"><a role="menuitem" tabindex="-1" href="about-us.html">Về chúng tôi</a></li>
                                          <li role="presentation"><a role="menuitem" tabindex="-1" href="booking.html">Đặt trước</a></li>
                                          <li role="presentation"><a role="menuitem" tabindex="-1" href="room-details.html">Chi tiết phòng</a></li>
                                          <li role="presentation"><a role="menuitem" tabindex="-1" href="staff.html">Nhân viên của chúng tôi</a></li>
                                          <li role="presentation"><a role="menuitem" tabindex="-1" href="404.html">404 Page</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="blog.html">Tin tức</a></li>
                                    <li><a href="contact-us.html">Liên hệ</a></li>
                                  </ul>
                                  <div class="emergency_number">
                                      <a href="tel:1234567890"><img src="img/call-icon.png" alt="">123 456 7890</a>
                                  </div>
                                </div><!-- /.navbar-collapse -->
                            </nav>
                        </div>
                    </div>
                    <!-- end mainmenu and logo -->
                </div>
            </div>
            <!-- end main header -->

        </header>
        <!-- end header -->
        
        <!-- start breadcrumb -->
        <section class="breadcrumb_main_area margin-bottom-80">
            <div class="container-fluid">
                <div class="row">
                    <div class="breadcrumb_main nice_title">
                        <h2>Liên hệ với chúng tôi</h2>
                        <!-- special offer start -->
                        <div class="special_offer_main">
                            <div class="container">
                                <div class="special_offer_sub">
                                    <img src="img/special-offer-yellow-main.png" alt="imf">
                                </div>
                            </div>
                        </div>         
                        <!-- end offer start -->
                    </div>
                </div>
            </div>            
        </section>
        <!-- end breadcrunb -->

        <!-- start other detect room section -->
        <div class="contact_google_map_main margin-bottom-100">
            <div class="container-fluid no_padding">
                <div class="row">
                    <div class="google_map_area">
                        <div id="googleMap"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end other detect room section -->
        
        <!-- start contact us section -->
        <section class="contact_us_area">
            <div class="container">
                <div class="contact_us clearfix margin-bottom-150">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <div class="send_message">
                            <form id="formid" action="#" method="post">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label>Tên của bạn<span>*</span></label>
                                            <input type="text" class="form-control" name="name" id="firstname" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label>Email của bạn<span>*</span></label>
                                            <input type="email" class="form-control" name="email" id="email" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label>Chủ đề<span>*</span></label>
                                            <input type="text" class="form-control" name="sub" id="sub" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label>Số điện thoại của bạn<span>*</span></label>
                                            <input type="text" class="form-control" name="number" id="phone" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Tin nhắn của bạn<span>*</span></label>
                                    <textarea class="form-control" name="message" id="message" required></textarea>
                                </div>
                                <div class="form-group mb0">
                                    <input type="submit" class="btn btn-primary btn-lg" value="Gửi">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="contact_details">
                            <h3>Thông tin liên hệ</h3>
                            <div class="contact_address margin-bottom-30">
                                <div class="contact_icon"><i class="fa fa-map-marker"></i></div>
                                <div class="contact_text">
                                    <h4>Địa chỉ</h4>
                                    <p>Số 123, Đường ABC, Phường XYZ, Thành phố HCM</p>
                                </div>
                            </div>
                            <div class="contact_address margin-bottom-30">
                                <div class="contact_icon"><i class="fa fa-phone"></i></div>
                                <div class="contact_text">
                                    <h4>Điện thoại</h4>
                                    <p>+84 123 456 789</p>
                                </div>
                            </div>
                            <div class="contact_address margin-bottom-30">
                                <div class="contact_icon"><i class="fa fa-envelope"></i></div>
                                <div class="contact_text">
                                    <h4>Email</h4>
                                    <p>info@domain.com</p>
                                </div>
                            </div>
                            <div class="contact_address margin-bottom-30">
                                <div class="contact_icon"><i class="fa fa-globe"></i></div>
                                <div class="contact_text">
                                    <h4>Website</h4>
                                    <p>www.domain.com</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end contact us section -->

        <!-- start footer -->
        <footer class="footer_area">
            <div class="container">
                <div class="footer">
                    <div class="row">
                        <div class="footer_top clearfix">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="footer_single">
                                    <img src="img/footer-logo.png" alt="">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque scelerisque diam non nisi semper, et elementum lorem ornare.</p>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                                <div class="footer_single">
                                    <h2>Liên kết</h2>
                                    <ul class="footer_links">
                                        <li><a href="#">Trang chủ</a></li>
                                        <li><a href="#">Chỗ ở</a></li>
                                        <li><a href="#">Phòng trưng bày</a></li>
                                        <li><a href="#">Đặc trưng</a></li>
                                        <li><a href="#">Tin tức</a></li>
                                        <li><a href="#">Liên hệ</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="footer_single">
                                    <h2>Phòng mới nhất</h2>
                                    <ul class="recent_posts">
                                        <li>
                                            <div class="recent_post_img">
                                                <a href="#"><img src="img/footer-img-1.png" alt=""></a>
                                            </div>
                                            <div class="recent_post_text">
                                                <h4><a href="#">Phòng sang trọng</a></h4>
                                                <span>$199 / Đêm</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="recent_post_img">
                                                <a href="#"><img src="img/footer-img-2.png" alt=""></a>
                                            </div>
                                            <div class="recent_post_text">
                                                <h4><a href="#">Phòng tiêu chuẩn</a></h4>
                                                <span>$99 / Đêm</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="footer_single">
                                    <h2>Đăng ký nhận bản tin</h2>
                                    <form>
                                        <input type="text" placeholder="Nhập email của bạn">
                                        <button>Gửi</button>
                                    </form>
                                    <div class="footer_social">
                                        <h2>Theo dõi chúng tôi</h2>
                                        <ul>
                                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                            <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="footer_bottom">
                            <p>&copy; 2024 Đặt phòng khách sạn. Được phát triển bởi <a href="#">Your Company</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end footer -->

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/uikit.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/moment.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <!-- Magnific-popup -->
        <script src="js/jquery.magnific-popup.min.js"></script>
        <!-- lightslider -->
        <script src="js/lightslider.min.js"></script>
        <!-- slick -->
        <script src="js/slick.min.js"></script>
        <!-- Date picker -->
        <script src="js/datepicker.js"></script>
        <!-- main -->
        <script src="js/main.js"></script>
        <script src="js/validation.js"></script>
        <!-- Google Maps -->
        <script>
            function initMap() {
                var uluru = {lat: -25.344, lng: 131.036};
                var map = new google.maps.Map(
                    document.getElementById('googleMap'), {zoom: 4, center: uluru});
                var marker = new google.maps.Marker({position: uluru, map: map});
            }
        </script>
        <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
        </script>
        
   
