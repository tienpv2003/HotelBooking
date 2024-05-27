<%-- 
    Document   : index.jsp
    Created on : May 23, 2024, 8:00:14 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    
<!-- Mirrored from demoxml.com/html/hotelbooking/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 17 May 2024 09:19:41 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Đặt phòng khách sạn</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" href="views/client/img/favicon.ico" sizes="16x16">

    <!-- fonts -->
    <link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Karla:700,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700' rel='stylesheet' type='text/css'>

    <!-- fontawesome -->
    <link rel="stylesheet" href="views/client/css/font-awesome.css" />

    <!-- bootstrap -->
    <link rel="stylesheet" href="views/client/css/bootstrap.min.css" />

    <!-- uikit -->
    <link rel="stylesheet" href="views/client/css/uikit.min.css" />

    <!-- animate -->
    <link rel="stylesheet" href="views/client/css/animate.css" />
    <link rel="stylesheet" href="views/client/css/datepicker.css" />
    <!-- Owl carousel 2 css -->
    <link rel="stylesheet" href="views/client/css/owl.carousel.css">
    <!-- rev slider -->
    <link rel="stylesheet" href="views/client/css/rev-slider/settings.css" />
    <!-- lightslider -->
    <link rel="stylesheet" href="views/client/css/lightslider.css">
    <!-- Theme -->
    <link rel="stylesheet" href="views/client/css/reset.css">
    
    <!-- custom css -->
    <link rel="stylesheet" href="views/client/style.css" />
    <!-- responsive -->
    <link rel="stylesheet" href="views/client/css/responsive.css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!-- This Template Is Fully Coded By Aftab Zaman from swiftconcept.com -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
    <body id="home_one">
        
        <!-- start preloader -->
        <div id="loader-wrapper">
            <div class="logo"><a href="#"><span>khách sạn</span>-Đặt phòng</a></div>
            <div id="loader">
            </div>
        </div>
        <!-- end preloader -->
        
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
                                        <li><a href="#"><img src="views/client/img/temp-icon.png" alt="temp-icon">Luân Đôn, GR 17°C</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 floatright">
                                <div class="right_header_top clearfix floatright">
                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="">
                                            <a class="border-right-dark-4" href="LoginAdminController">Đăng nhập</a></li>
                                        <li role="presentation" class="dropdown">
                                            <a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
                                              Đăng kí
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
                                      <a id="brand" class="clearfix navbar-brand" href="index.html"><img src="views/client/img/site-logo.png" alt="Trips"></a>
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
                                        <ul id="menu2" class="dropdown-menu" role="menu">Chỗ ở
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
                                      <a href="tel:1234567890"><img src="views/client/img/call-icon.png" alt="">123 456 7890</a>
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

        <!-- start main slider -->
        <div class="main_slider_area">
            <div class="main_slider" id="slider_rev">
                <!-- start hotel booking -->
                <div class="hotel_booking_area">
                    <div class="container">
                        <div class="hotel_booking">
                            <form id="form1" role="form" action="#" class="">
                                <div class="col-lg-2 col-md-2 col-sm-2">
                                    <div class="room_book border-right-dark-1">
                                        <h6>Đặt chỗ của bạn</h6>
                                        <p>Phòng</p>
                                    </div>
                                </div>
                                <div class="form-group col-lg-2 col-md-2 col-sm-2">
                                    <div class="input-group border-bottom-dark-2">
                                        <input class="date-picker" id="datepicker" placeholder="Đến" type="text"/>
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    </div>
                                </div>
                                <div class="form-group col-lg-2 col-md-2 col-sm-2">
                                    <div class="input-group border-bottom-dark-2">
                                        <input class="date-picker" id="datepicker1" placeholder="Sự khởi hành" type="text"/>
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="row">
                                        <div class="form-group col-lg-3 col-md-3 col-sm-3 icon_arrow">
                                            <div class="input-group border-bottom-dark-2">
                                                <select class="form-control" name="room" id="room">
                                                  <option selected="selected" disabled="disabled">1 phòng</option>
                                                  <option value="Single">1 phòng</option>
                                                  <option value="Double">2 phòng</option>
                                                  <option value="Deluxe">3 phòng</option>
                                                </select>               
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-3 col-md-3 col-sm-3 icon_arrow">
                                            <div class="input-group border-bottom-dark-2">
                                                <select class="form-control" name="room" id="adult">
                                                  <option selected="selected" disabled="disabled">1 Người lớn</option>
                                                  <option value="Single">1 Người lớn</option>
                                                  <option value="Double">2 Người lớn</option>
                                                  <option value="Deluxe">3 Người lớn</option>
                                                </select>               
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-3 col-md-3 col-sm-3 icon_arrow">
                                            <div class="input-group border-bottom-dark-2">
                                                <select class="form-control" name="room" id="child">
                                                  <option selected="selected" disabled="disabled">0 Trẻ em</option>
                                                  <option value="Single">0 Trẻ em</option>
                                                  <option value="Double">1 Trẻ em</option>
                                                  <option value="Deluxe">2 Trẻ em</option>
                                                </select>               
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                            <a href="booking.html" class="btn btn-primary floatright">Đặt</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- special offer start -->
                            <div class="special_offer_main">
                                <img src="views/client/img/special-offer-main.png" alt="">
                            </div>
                            <!-- end offer start -->
                        </div>
                    </div>
                </div>
                <!-- end hotel booking -->
                <div class="fullwidthbanner-container" >
                    <div class="fullwidth_home_banner">
                        <ul>
                            
                            <li data-transition="random" data-slotamount="7" data-masterspeed="1000">
                                <img src="views/client/img/rev-slider/slider-one.jpg" alt="slide" >
                                <div class="tp-caption large_black sfr" data-x="105" data-y="197" data-speed="1200" data-start="1100" data-easing="easeInOutBack"
                                    style="font-family: 'Playfair Display', serif; font-size: 48px;color: #131e2a; margin-bottom: 23px; text-transform: uppercase; line-height: 40px;">
                                    Một khách sạn hoàn toàn mới
                                </div>
                                <div class="tp-caption large_black sfr" data-x="105" data-y="255" data-speed="1500" data-start="1400" data-easing="easeInOutBack"
                                    style="font-family: 'Playfair Display', serif; font-size: 48px;color: #131e2a; margin-bottom: 23px; text-transform: uppercase; line-height: 40px;">
                                    Ngoài tầm thường
                                </div>
                                <div class="tp-caption lfb carousel-caption-inner" data-x="105" data-y="313" data-speed="1300" data-start="1700" data-easing="easeInOutBack" 
                                    style="background: #f7c411; padding: 10px; cursor: pointer;">
                                    <a href="#" class="" style="background: #f7c411; border-radius: 0; color: #313a45; display: inline-block;  font-size: 18px; padding: 8px 34px; text-transform: uppercase; border: 1px solid #9e811a;">Khám phá nó</a>
                                </div>
                            </li>

                            <li data-transition="random" data-slotamount="7" data-masterspeed="1000">
                                <img src="views/client/img/rev-slider/slider-one.jpg" alt="slide" >
                                <div class="tp-caption large_black sfr" data-x="105" data-y="197" data-speed="1200" data-start="1100" data-easing="easeInOutBack"
                                    style="font-family: 'Playfair Display', serif; font-size: 48px;color: #131e2a; margin-bottom: 23px; text-transform: uppercase; line-height: 40px;">
                                    Đặt kỳ nghỉ hè của bạn
                                </div>
                                <div class="tp-caption large_black sfr" data-x="105" data-y="255" data-speed="1500" data-start="1400" data-easing="easeInOutBack"
                                    style="font-family: 'Playfair Display', serif; font-size: 48px;color: #131e2a; margin-bottom: 23px; text-transform: uppercase; line-height: 40px;">
                                    Với Mẫu ĐẶT PHÒNG KHÁCH SẠN
                                </div>
                                <div class="tp-caption lfb carousel-caption-inner" data-x="105" data-y="313" data-speed="1300" data-start="1700" data-easing="easeInOutBack" 
                                    style="background: #f7c411; padding: 10px; cursor: pointer;">
                                    <a href="#" class="" style="background: #f7c411; border-radius: 0; color: #313a45; display: inline-block;  font-size: 18px; padding: 8px 34px; text-transform: uppercase; border: 1px solid #9e811a;">Khám phá nó</a>
                                </div>
                            </li>							                           
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- end main slider -->
        
        <!-- start welcome section -->
        <section class="welcome_area">  
            <div class="container">
                    <div class="welcome">
                        <div class="section_title nice_title content-center">
                            <h3>Chào mừng đến với khách sạn</h3>
                        </div>
                        <div class="section_description">
                            <p> Luôn luôn và lớp đau của cuộc sống. Ngày mai đôi khi hendrerit lacinia. Đôi khi là lớp lớp của cuộc đời người lao động. Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ. </p>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="single_room_wrapper clearfix">
                                    <figure class="uk-overlay uk-overlay-hover">
                                        <div class="room_media">
                                            <a href="#"><img src="views/client/img/room-image-five.png" alt=""></a>
                                        </div>
                                        <div class="room_title border-bottom-whitesmoke clearfix">
                                                <div class="left_room_title floatleft">
                                                    <h6>Phòng Deluxe</h6>
                                                    <p>200đ/ <span>đêm</span></p>
                                                </div>
                                                <div class="left_room_title floatright">
                                                    <a href="booking.html" class="btn">Đặt</a>
                                                </div>
                                            </div>
                                        <div class="uk-overlay-panel uk-overlay-background single_wrapper_details clearfix animated bounceInDown">
                                            <div class="border-dark-1 padding-22 clearfix single_wrapper_details_pad">
                                                <h5>Phòng Deluxe</h5>
                                                <p>
                                                    Luôn luôn và lớp đau của cuộc sống. đôi khi hendrerit lacinia
                                                </p>
                                                <p>
                                                    Đôi khi là lớp lớp của cuộc đời người lao động.
                                                </p>
                                                <div class="single_room_cost clearfix">
                                                    <div class="floatleft">
                                                        <p>200đ/ <span>Tối</span></p>
                                                    </div>
                                                    <div class="floatright">
                                                        <a href="booking.html" class="btn">Đặt</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figure>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="single_room_wrapper clearfix">
                                    <figure class="uk-overlay uk-overlay-hover">
                                        <div class="room_media">
                                            <a href="#"><img src="views/client/img/room-image-nine.png" alt=""></a>
                                        </div>
                                        <div class="room_title border-bottom-whitesmoke clearfix">
                                                <div class="left_room_title floatleft">
                                                    <h6>Phòng đôi</h6>
                                                    <p>150đ/ <span>Tối</span></p>
                                                </div>
                                                <div class="left_room_title floatright">
                                                    <a href="booking.html" class="btn">Đặt</a>
                                                </div>
                                            </div>
                                        <div class="uk-overlay-panel uk-overlay-background single_wrapper_details clearfix animated bounceInUp">
                                            <div class="border-dark-1 padding-22 clearfix single_wrapper_details_pad">
                                                <h5>Phòng Đôi</h5>
                                                <p>
                                                    Đôi khi là lớp lớp của cuộc đời người lao động.
                                                </p>
                                                <p>
                                                    Đôi khi là lớp lớp của cuộc đời người lao động.
                                                </p>
                                                <div class="single_room_cost clearfix">
                                                    <div class="floatleft">
                                                        <p>150đ/ <span>Tối</span></p>
                                                    </div>
                                                    <div class="floatright">
                                                        <a href="booking.html" class="btn">Đặt</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figure>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="single_room_wrapper clearfix">
                                    <figure class="uk-overlay uk-overlay-hover">
                                        <div class="room_media">
                                            <a href="#"><img src="views/client/img/room-image-thirteen.jpg" alt=""></a>
                                        </div>
                                        <div class="room_title border-bottom-whitesmoke clearfix">
                                                <div class="left_room_title floatleft">
                                                    <h6>Phòng đơn</h6>
                                                    <p>180đ/ <span>Tối</span></p>
                                                </div>
                                                <div class="left_room_title floatright">
                                                    <a href="booking.html" class="btn">Đặt</a>
                                                </div>
                                            </div>
                                        <div class="uk-overlay-panel uk-overlay-background single_wrapper_details clearfix animated bounceInDown">
                                            <div class="border-dark-1 padding-22 clearfix single_wrapper_details_pad">
                                                <h5>Phòng Đơn</h5>
                                                <p>
                                                    Đôi khi là lớp lớp của cuộc đời người lao động.
                                                </p>
                                                <p>
                                                    Đôi khi là lớp lớp của cuộc đời người lao động.
                                                </p>
                                                <div class="single_room_cost clearfix">
                                                    <div class="floatleft">
                                                        <p>180đ/ <span>Tối</span></p>
                                                    </div>
                                                    <div class="floatright">
                                                        <a href="booking.html" class="btn">Đặt</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figure>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="single_room_wrapper clearfix">
                                    <figure class="uk-overlay uk-overlay-hover">
                                        <div class="room_media">
                                            <a href="#"><img src="views/client/img/room-image-eight.png" alt=""></a>
                                        </div>
                                        <div class="room_title border-bottom-whitesmoke clearfix">
                                                <div class="left_room_title floatleft">
                                                    <h6>Phòng Trẻ em</h6>
                                                    <p>140đ/ <span>Tối</span></p>
                                                </div>
                                                <div class="left_room_title floatright">
                                                    <a href="booking.html" class="btn">Đặt</a>
                                                </div>
                                            </div>
                                        <div class="uk-overlay-panel uk-overlay-background single_wrapper_details clearfix animated bounceInUp">
                                            <div class="border-dark-1 padding-22 clearfix single_wrapper_details_pad">
                                                <h5>Phòng Trẻ em</h5>
                                                <p>
                                                    Luôn luôn và lớp đau của cuộc sống. đôi khi hendrerit lacinia
                                                </p>
                                                <p>
                                                    Luôn luôn và lớp đau của cuộc sống. đôi khi hendrerit lacinia
                                                </p>
                                                <div class="single_room_cost clearfix">
                                                    <div class="floatleft">
                                                        <p>140đ/ <span>Tối</span></p>
                                                    </div>
                                                    <div class="floatright">
                                                        <a href="booking.html" class="btn">Đặt</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </section>
        <!-- end welcome section -->
        
        <!-- start Hotel Facilities section -->
        <section class="hotel_facilities_area margin-top-115 margin-bottom-100">
            <div class="container">
                <div class="hotel_facilities">
                    <div class="section_title nice_title content-center">
                        <h3>Các tiện ích của khách sạn</h3>
                    </div>
                    <div class="hotel_facilities_content">
                        <div role="tabpanel">

                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active">
                                    <a href="#restaurant" aria-controls="restaurant" role="tab" data-toggle="tab"><img src="views/client/img/home-facilities-icon-eleven.png" alt="restaurant"><span>Nhà hàng</span></a>
                                </li>
                                <li role="presentation">
                                    <a href="#sports-club" aria-controls="sports-club" role="tab" data-toggle="tab"><img src="views/client/img/home-facilities-icon-seven.png" alt="sports-club"><span>Câu lạc bộ</span></a>
                                </li>
                                <li role="presentation">
                                    <a href="#pick-up" aria-controls="pick-up" role="tab" data-toggle="tab"><img src="views/client/img/home-facilities-icon-eight.png" alt="pick-up"><span>Nhặt lên</span></a>
                                </li>
                                <li role="presentation">
                                    <a href="#bar" aria-controls="bar" role="tab" data-toggle="tab"><img src="views/client/img/home-facilities-icon-nine.png" alt="bar"><span>bar</span></a>
                                </li>
                                <li role="presentation">
                                    <a href="#gym" aria-controls="gym" role="tab" data-toggle="tab"><img src="views/client/img/home-facilities-icon-ten.png" alt="gym"><span>gym</span></a>
                                </li>
                            </ul>                           

                          
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="restaurant">
                                    <div class="single-tab-content">
                                        <div class="row">
                                            <div class="co-lg-5 col-md-5 col-sm-6">
                                                <div class="single-tab-image">
                                                    <a href="#"><img src="views/client/img/hotel-facility-one.jpg" alt=""></a>
                                                </div>
                                            </div>
                                            <div class="co-lg-7 col-md-7 col-sm-6">
                                                <div class="single-tab-details">
                                                    <h6>Đẳng cấp thế giới</h6>
                                                    <h3>Nhà hàng & Tiệc</h3>
                                                    <p>
                                                        Luôn luôn và lớp đau của cuộc sống. Ngày mai đôi khi hendrerit lacinia. Đôi khi là lớp lớp của cuộc đời người lao động. Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ.
                                                    </p>
                                                    <p>
                                                        Luôn luôn và lớp đau của cuộc sống. Ngày mai đôi khi hendrerit lacinia. Đôi khi là lớp lớp của cuộc đời người lao động. Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ.
                                                    </p>
                                                    <div class="our_services">
                                                        <a href="#" class="margin-right-33">Giờ phục vụ; 19.00-22:00 </a>
                                                        <a href="#">phí dịch vụ: 15đ</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="sports-club">
                                    <div class="single-tab-content">
                                        <div class="row">
                                            <div class="co-lg-5 col-md-5">
                                                <div class="single-tab-image">
                                                    <a href="#"><img src="views/client/img/hotel-facility-three.jpg" alt=""></a>
                                                </div>
                                            </div>
                                            <div class="co-lg-7 col-md-7">
                                                <div class="single-tab-details">
                                                    <h6>Đẳng cấp thế giới</h6>
                                                    <h3>Câu lạc bộ</h3>
                                                    <p>
                                                        Luôn luôn và lớp đau của cuộc sống. Ngày mai đôi khi hendrerit lacinia. Đôi khi là lớp lớp của cuộc đời người lao động. Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ.
                                                    </p>
                                                    <p>
                                                        Luôn luôn và lớp đau của cuộc sống. Ngày mai đôi khi hendrerit lacinia. Đôi khi là lớp lớp của cuộc đời người lao động. Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ.
                                                    </p>
                                                    <div class="our_services">
                                                        <a href="#" class="margin-right-33">Giờ phục vụ; 19.00-22:00 </a>
                                                        <a href="#">phí dịch vụ: 15đ</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="pick-up">
                                    <div class="single-tab-content">
                                        <div class="row">
                                            <div class="co-lg-5 col-md-5">
                                                <div class="single-tab-image">
                                                    <a href="#"><img src="views/client/img/hotel-facility-one.jpg" alt=""></a>
                                                </div>
                                            </div>
                                            <div class="co-lg-7 col-md-7">
                                                <div class="single-tab-details">
                                                    <h6>Đẳng cấp thế giới</h6>
                                                    <h3>Nhặt lên</h3>
                                                    <p>
                                                        Luôn luôn và lớp đau của cuộc sống. Ngày mai đôi khi hendrerit lacinia. Đôi khi là lớp lớp của cuộc đời người lao động. Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ.
                                                    </p>
                                                    <p>
                                                        Luôn luôn và lớp đau của cuộc sống. Ngày mai đôi khi hendrerit lacinia. Đôi khi là lớp lớp của cuộc đời người lao động. Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ.
                                                    </p>
                                                    <div class="our_services">
                                                        <a href="#" class="margin-right-33">Giờ phục vụ; 19.00-22:00 </a>
                                                        <a href="#">phí dịch vụ: 15đ</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="bar">
                                    <div class="single-tab-content">
                                        <div class="row">
                                            <div class="co-lg-5 col-md-5">
                                                <div class="single-tab-image">
                                                    <a href="#"><img src="views/client/img/hotel-facility-three.jpg" alt=""></a>
                                                </div>
                                            </div>
                                            <div class="co-lg-7 col-md-7">
                                                <div class="single-tab-details">
                                                    <h6>Đẳng cấp thế giới</h6>
                                                    <h3>Bar</h3>
                                                    <p>
                                                        Luôn luôn và lớp đau của cuộc sống. Ngày mai đôi khi hendrerit lacinia. Đôi khi là lớp lớp của cuộc đời người lao động. Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ.
                                                    </p>
                                                    <p>
                                                        Luôn luôn và lớp đau của cuộc sống. Ngày mai đôi khi hendrerit lacinia. Đôi khi là lớp lớp của cuộc đời người lao động. Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ.
                                                    </p>
                                                    <div class="our_services">
                                                        <a href="#" class="margin-right-33">Giờ phục vụ; 19.00-22:00 </a>
                                                        <a href="#">phí dịch vụ: 15đ</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="gym">
                                    <div class="single-tab-content">
                                        <div class="row">
                                            <div class="co-lg-5 col-md-5">
                                                <div class="single-tab-image">
                                                    <a href="#"><img src="views/client/img/hotel-facility-one.jpg" alt=""></a>
                                                </div>
                                            </div>
                                            <div class="co-lg-7 col-md-7">
                                                <div class="single-tab-details">
                                                    <h6>Đẳng cấp thế giới</h6>
                                                    <h3>Gym</h3>
                                                    <p>
                                                        Luôn luôn và lớp đau của cuộc sống. Ngày mai đôi khi hendrerit lacinia. Đôi khi là lớp lớp của cuộc đời người lao động. Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ.
                                                    </p>
                                                    <p>
                                                        Luôn luôn và lớp đau của cuộc sống. Ngày mai đôi khi hendrerit lacinia. Đôi khi là lớp lớp của cuộc đời người lao động. Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ.
                                                    </p>
                                                    <div class="our_services">
                                                        <a href="#" class="margin-right-33">Giờ phục vụ; 19.00-22:00 </a>
                                                        <a href="#">phí dịch vụ: 15đ</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                                           
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end Hotel Facilities section -->

        <!-- start About Us section -->
        <section class="about_us_area margin-bottom-128">
            <div class="container">
                <div class="about_us clearfix">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 padding-left-0">
                        <div class="news">
                            <div class="section_title margin-bottom-50">
                                <h5>Tin tức</h5>
                            </div>
                            <div class="section_description">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="single_content clearfix border-bottom-whitesmoke">
                                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-4 padding-left-0">
                                                <div class="post_media">
                                                    <a href="blog.html"><img src="views/client/img/news-one.jpg" alt=""></a>
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-8 padding-left-0">
                                                <div class="post_title clearfix">
                                                    <h6>Mọi người ở cảng titordga</h6>
                                                </div>
                                                <div class="post_content  margin-bottom-35">
                                                    <p>14 tháng 5 năm 2014</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="single_content clearfix margin-top-35 border-bottom-whitesmoke">
                                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-4 padding-left-0">
                                                <div class="post_media">
                                                    <a href="blog.html"><img src="views/client/img/news-two.jpg" alt=""></a>
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-8 padding-left-0">
                                                <div class="post_title clearfix">
                                                    <h6>Đừng lo lắng về sô cô la</h6>
                                                </div>
                                                <div class="post_content margin-bottom-35">
                                                    <p>15 tháng 5 năm 2014</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="single_content clearfix margin-bottom-35 margin-top-35">
                                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-4 padding-left-0">
                                                <div class="post_media">
                                                    <a href="blog.html"><img src="views/client/img/news-three.jpg" alt=""></a>
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-8 padding-left-0">
                                                <div class="post_title clearfix">
                                                    <h6>Trò chuyện đa dạng hơn Internet</h6>
                                                </div>
                                                <div class="post_content">
                                                    <p>17 tháng 5 năm 2014</p>
                                                </div>
                                            </div>
                                        </div>                                  
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="showcase">
                            <div class="section_title margin-bottom-50">
                                <h5>Trưng bày khách sạn</h5>
                            </div>
                            <div class="section_description">
                                <div class="clearfix demo" style="">
                                    <ul id="vertical" class="gallery list-unstyled">
                                        <li data-thumb="views/client/img/lightslider-img/cS-18.jpg">
                                            <img alt="slider" src="views/client/img/lightslider-img/cS-18.jpg" />
                                        </li>
                                        <li data-thumb="views/client/img/lightslider-img/cS-21.jpg"> 
                                            <img alt="slider" src="views/client/img/lightslider-img/cS-21.jpg" />
                                        </li>
                                        <li data-thumb="views/client/img/lightslider-img/cS-22.jpg"> 
                                            <img alt="slider" src="views/client/img/lightslider-img/cS-22.jpg" />
                                        </li>
                                        <li data-thumb="views/client/img/lightslider-img/cS-23.jpg"> 
                                            <img alt="slider" src="views/client/img/lightslider-img/cS-23.jpg" />
                                        </li>
                                        <li data-thumb="views/client/img/lightslider-img/cS-24.jpg"> 
                                            <img alt="slider" src="views/client/img/lightslider-img/cS-24.jpg" />
                                        </li>
                                        <li data-thumb="views/client/img/lightslider-img/cS-25.jpg"> 
                                            <img alt="slider" src="views/client/img/lightslider-img/cS-25.jpg" />
                                        </li>
                                        <li data-thumb="views/client/img/lightslider-img/cS-26.jpg"> 
                                            <img alt="slider" src="views/client/img/lightslider-img/cS-26.jpg" />
                                        </li>
                                        <li data-thumb="views/client/img/lightslider-img/cS-27.jpg"> 
                                            <img alt="slider" src="views/client/img/lightslider-img/cS-27.jpg" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <div class="customer_says">
                            <div class="section_title margin-bottom-50">
                                <h5>Khách hàng nói</h5>
                            </div>
                            <div class="section_description">
                                <div id="customer_says_slider" class="carousel slide" data-ride="carousel" data-pause="none">
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner" role="listbox">
                                        <div class="item active">
                                            <div class="single_says">
                                                <div class="customer_comment">
                                                    <p>
                                                        Luôn luôn và cuộc sống đau đớn msan. Cras interdum hendreritnia Phasellus accumsan urna vitae molestie interdum.
                                                    </p>
                                                    <p>
                                                        Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ.
                                                    </p>
                                                </div>
                                                <div class="customer_detail clearfix">
                                                    <div class="customer_pic alignleft-20">
                                                        <a href="#"><img src="views/client/img/customer-says-one.png" alt=""></a>
                                                    </div>
                                                    <div class="customer_identity floatleft">
                                                        <h6>John Doe</h6>
                                                        <p>www.john.com</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="single_says">
                                                <div class="customer_comment">
                                                    <p>
                                                        Luôn luôn và cuộc sống đau đớn msan. Cras interdum hendreritnia Phasellus accumsan urna vitae molestie interdum.
                                                    </p>
                                                    <p>
                                                        Nam Vì anh ta đầu tư thoải mái nhưng gánh nặng không được khấu trừ.
                                                    </p>
                                                </div>
                                                <div class="customer_detail clearfix">
                                                    <div class="customer_pic alignleft-20">
                                                        <a href="#"><img src="views/client/img/customer-says-one.png" alt=""></a>
                                                    </div>
                                                    <div class="customer_identity floatleft">
                                                        <h6>John Doe</h6>
                                                        <p>www.john.com</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Controls -->
                                    <a class="slider_says left" href="#customer_says_slider" role="button" data-slide="prev">
                                        <i class="fa fa-angle-left"></i>
                                        <span class="sr-only">Trước</span>
                                    </a>
                                    <a class="slider_says right" href="#customer_says_slider" role="button" data-slide="next">
                                        <i class="fa fa-angle-right"></i>
                                        <span class="sr-only">Kế tiếp</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end About Us section -->
        
        <!-- start contact us area -->
        <section class="contact_us_area content-left">
            <div class="container">
                <div class="contact_us clearfix">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <div class="call clearfix">
                            <h6>Gọi cho chúng tôi</h6>
                            <p>123 456 7890</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <div class="email_us clearfix">
                            <h6>Gửi email cho chúng tôi</h6>
                            <p>info@hotelbooking.com</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <div class="news_letter clearfix">
                            <input type="text" placeholder="Nhập ID cho Thư Tin tức">
                            <a href="#" class="btn btn-blue">Đi</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <div class="social_icons clearfix">
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end contact us area -->

        <!-- start footer -->
        <footer class="footer_area">
            <div class="container">
                <div class="footer">
                    <div class="footer_top padding-top-80 clearfix">
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="footer_widget">
                                <div class="footer_logo">
                                    <a href="#"><img src="views/client/img/footer-logo-one.png" alt=""></a>
                                </div>
                                <p>Điều thực sự quan trọng là có một khách hàng tốt, một khách hàng đồng hành. Trong quá trình theo đuổi nỗi đau.</p>
                                <ul>
                                    <li>
                                        <P><i class="fa fa-map-marker"></i>St Amsterdam Phần Lan, <br> Thống kê Hoa Kỳ AKY16 8PN</P>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="row">
                                <div class="footer_widget clearfix">
                                    <h5 class="padding-left-15">Đường dẫn nhanh</h5>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <ul>
                                            <li><a href="#">Phòng</a></li>
                                            <li><a href="#">Đồ uống thực phẩm</a></li>
                                            <li><a href="#">Địa điểm bãi biển</a></li>
                                            <li><a href="#">Tiện nghi</a></li>
                                        </ul>  
                                    </div>
                                    <div class="col-lg-6 col-md-6 sol-sm-6">
                                        <ul>
                                            <li><a href="#">Sức khỏe</a></li>
                                            <li><a href="#">Email</a></li>
                                            <li><a href="#">Tuyên ngôn</a></li>
                                            <li><a href="#">Liên hệ</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="footer_widget">
                                <h5>Chúng tôi toàn cầu</h5>
                                <div class="footer_map">
                                    <a href="#"><img src="views/client/img/footer-map-two.jpg" alt=""></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="container">
                            <div class="footer_copyright margin-tb-50 content-center">
                                <p>© 2015 <a href="#">Đặt phòng khách sạn</a>. Đã đăng ký Bản quyền</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end footer -->
		
		
		
        <!-- jquery library -->
        <script src="views/client/js/vendor/jquery-1.11.2.min.js"></script>
        <!-- bootstrap -->
        <script src="views/client/js/bootstrap.min.js"></script>
		<!-- rev slider -->
        <script src="views/client/js/rev-slider/rs-plugin/jquery.themepunch.plugins.min.js"></script>
        <script src="views/client/js/rev-slider/rs-plugin/jquery.themepunch.revolution.js"></script>
        <script src="views/client/js/rev-slider/rs.home.js"></script>
        <!-- uikit -->
        <script src="views/client/js/uikit.min.js"></script>
        <!-- easing -->
		<script src="views/client/js/jquery.easing.1.3.min.js"></script>
        <script src="views/client/js/datepicker.js"></script>
        <!-- scroll up -->
        <script src="views/client/js/jquery.scrollUp.min.js"></script>
        <!-- owlcarousel -->
        <script src="views/client/js/owl.carousel.min.js"></script>
        <!-- lightslider -->
        <script src="views/client/js/lightslider.js"></script>
        
        <!-- wow Animation -->
        <script src="views/client/js/wow.min.js"></script>
        <!--Activating WOW Animation only for modern browser-->
        <!--[if !IE]><!-->
        <script type="text/javascript">new WOW().init();</script>
        <!--<![endif]-->

        <!--Oh Yes, IE 9+ Supports animation, lets activate for IE 9+-->
        <!--[if gte IE 9]>
            <script type="text/javascript">new WOW().init();</script>
        <![endif]-->         

        <!--Opacity & Other IE fix for older browser-->
        <!--[if lte IE 8]>
            <script type="text/javascript" src="js/ie-opacity-polyfill.js"></script>
        <![endif]-->



        <!-- my js -->
        <script src="views/client/js/main.js"></script>
		
    </body>

<!-- Mirrored from demoxml.com/html/hotelbooking/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 17 May 2024 09:19:47 GMT -->
</html>
