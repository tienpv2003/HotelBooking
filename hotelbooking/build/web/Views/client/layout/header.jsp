<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>KHÁCH SẠN</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="Views/client/img/logo-chot.jpg" sizes="16x16">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Karla:700,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700' rel='stylesheet' type='text/css'>

    <!-- FontAwesome -->
    <link rel="stylesheet" href="Views/client/css/font-awesome.css" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="Views/client/css/bootstrap.min.css" />

    <!-- UIkit -->
    <link rel="stylesheet" href="Views/client/css/uikit.min.css" />

    <!-- Animate -->
    <link rel="stylesheet" href="Views/client/css/animate.css" />
    <link rel="stylesheet" href="Views/client/css/datepicker.css" />
    <!-- Owl Carousel 2 CSS -->
    <link rel="stylesheet" href="Views/client/css/owl.carousel.css">
    <!-- Revolution Slider -->
    <link rel="stylesheet" href="Views/client/css/rev-slider/settings.css" />
    <!-- LightSlider -->
    <link rel="stylesheet" href="Views/client/css/lightslider.css">
    <!-- Theme -->
    <link rel="stylesheet" href="Views/client/css/reset.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="Views/client/css/style.css" />
    <link rel="stylesheet" href="Views/client/css/global.css" />
    <!-- Responsive -->
    <link rel="stylesheet" href="Views/client/css/responsive.css" />
    <style>
        .nav123 li a{
            margin-left: 50px;
        }
    </style>
</head>
<body id="home_one">
    <header class="header_area">

        <!-- Start Header Top -->
        <div class="header_top_area" style="background-color: #C2E8F5;">
            <div class="container">
                <div class="row">
                    <div class="header_top clearfix">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="right_header_top clearfix floatright">
                                <ul class="nav navbar-nav navbar-right">
                                    <c:if test="${empty cusObj}">
                                        <li><a class="border-right-dark-4" style="color: #000;font-weight: bolder" href="signin">Đăng nhập</a></li>
                                        <li><a class="border-right-dark-4" style="color: #000;font-weight: bolder"href="email_signup">Đăng kí</a></li>
                                        </c:if>
                                        <c:if test="${not empty cusObj}">
                                        <li class="dropdown">
                                            <button 
                                                id="dLabel" type="button" class="btn btn-primary dropdown-toggle" 
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding: 15px">
                                                Xin chào ${cusObj.getLastName()}
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dLabel">
                                                <li><a class="border-right-dark-4" style="color: #000;font-weight: bolder"href="view_profile">Hồ sơ</a></li>
                                                <li><a class="border-right-dark-4" style="color: #000;font-weight: bolder"href="booking_history">Lịch sử đặt phòng</a></li>
                                                <li><a class="border-right-dark-4" style="color: #000;font-weight: bolder"href="logout">Đăng xuất</a></li>
                                            </ul>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Header Top -->

        <!-- Start Main Header -->
        <div class="main_header_area" style="background-color: #333;">
            <div class="container">
                <!-- Start Main Menu & Logo -->
                <div class="mainmenu">
                    <div id="nav">
                        <nav class="navbar navbar-default">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <a class="navbar-brand" href="home" style="display: flex; align-items: center;">
                                    <img src="Views/Login/img/logo-chot.jpg" width="50" height="70" alt="logo">
                                    <span style="font-weight: bold; color: white; margin-left: 10px;">KHÁCH SẠN</span>
                                </a>
                            </div>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                                <ul class="nav nav123 navbar-nav">
                                    <li role="presentation" class="dropdown">
                                        <a id="drop-one" href="home" class="dropdown-toggle" style="color: white;">
                                            Trang chủ
                                        </a>
                                    </li>        
                                    <li><a href="all_room_cus" style="color: white;">Phòng</a></li>
<!--                                    <li><a href="gallery" style="color: white;">Phòng trưng bày</a></li>-->
<!--                                    <li role="presentation" class="dropdown">
                                        <a id="drop2" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false" style="color: white;">
                                            Đặc trưng
                                        </a>
                                        <ul id="menu2" class="dropdown-menu" role="menu">
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="Views/client/about-us.jsp">Giới thiệu</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="booking_room_cus">Đặt phòng</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="room_detail_cus">Chi tiết phòng</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="Views/client/staff.jsp">Nhân viên của chúng tôi</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="Views/client/404.jsp">404 Page</a></li>
                                        </ul>
                                    </li>-->
                                    <li><a href="list_event_client" style="color: white;">Sự kiện</a></li>
                                    <li><a href="list_news_cus" style="color: white;">Tin tức</a></li>
                                    <li><a href="contact" style="color: white;">Liên hệ</a></li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </nav>
                    </div>
                </div>
                <!-- End Main Menu & Logo -->
            </div>
        </div>
        <!-- End Main Header -->

    </header>
    <!-- End Header -->
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="Views/client/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            // Xử lý sự kiện click vào dropdown
            $('.dropdown-toggle').click(function () {
                var $dropdownMenu = $(this).next('.dropdown-menu');
                // Đảm bảo chỉ có một dropdown menu được mở tại một thời điểm
                $('.dropdown-menu').not($dropdownMenu).hide();
                $dropdownMenu.toggle();
            });

            // Đóng dropdown khi click ra ngoài
            $(document).on('click', function (e) {
                if (!$(e.target).closest('.dropdown-toggle').length) {
                    $('.dropdown-menu').hide();
                }
            });
        });
    </script>