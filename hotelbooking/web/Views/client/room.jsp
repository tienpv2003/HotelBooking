<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Phòng</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="icon" href="Views/client/img/logo-chot.jpg" sizes="16x16">

        <!-- fonts -->
        <link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700,900' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Karla:700,400' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lora:400,700' rel='stylesheet' type='text/css'>

        <!-- fontawesome -->
        <link rel="stylesheet" href="Views/client/css/font-awesome.css" />

        <!-- bootstrap -->
        <link rel="stylesheet" href="Views/client/css/bootstrap.min.css" />

        <!-- uikit -->
        <link rel="stylesheet" href="Views/client/css/uikit.min.css" />

        <!-- animate -->
        <link rel="stylesheet" href="Views/client/css/animate.css" />
        <link rel="stylesheet" href="Views/client/css/datepicker.css" />
        <!-- Owl carousel 2 css -->
        <link rel="stylesheet" href="Views/client/css/owl.carousel.css">
        <!-- rev slider -->
        <link rel="stylesheet" href="Views/client/css/rev-slider/settings.css" />
        <!-- lightslider -->
        <link rel="stylesheet" href="Views/client/css/lightslider.css">
        <!-- Theme -->
        <link rel="stylesheet" href="Views/client/css/reset.css">

        <!-- custom css -->
        <link rel="stylesheet" href="Views/client/style.css" />
        <!-- responsive -->
        <link rel="stylesheet" href="Views/client/css/responsive.css" />

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!-- This Template Is Fully Coded By Aftab Zaman from swiftconcept.com -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body id="accomodation_page">


        <!-- start header -->
        <jsp:include page="layout/header.jsp"></jsp:include>
            <!-- end header -->

            <!-- start breadcrumb -->
            <section class="breadcrumb_main_area margin-bottom-80">
                <div class="container-fluid">
                    <div class="row">
                        <div class="breadcrumb_main1" style="padding-top: 0px; padding-bottom: 0px; position: relative;">
                            <img src="Views/client/img/accomodation-breadcrumb-one.jpg" alt="imf" style="width: 100%;">
                            <h2 class="centered-heading1">Phòng</h2>
                            <!-- special offer start -->
                            <div class="special_offer_main">
                                <div class="container">
                                    <div class="special_offer_sub" style="position: absolute">
                                        <img src="Views/client/img/special-offer-yellow-main.png" alt="imf">
                                    </div>
                                </div>
                            </div>         
                            <!-- end offer start -->
                        </div>
                    </div>
                </div>
            </section>
            <!-- end breadcrunb -->


            <!-- start Hotel Facilities section -->
            <section class="select_room_area padding-top-5 margin-bottom-90">
                <div class="container">
                    <div class="row">
                        <div class="select_room clearfix">
                            <div class="section_title nice_title text-center">
                                <h3>Loại Phòng Phổ biến</h3>
                            </div>
                            <div class="select_room_content clearfix">
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                    <div class="room_thumb">
                                        <a href="room_type_details?id=${type1.roomTypeId}">
                                        <img src="Views/client/img/${type1.roomtype_img}" style="width: 800px; height: 455px" alt="${type1.typeName}"></a>
                                    <div class="room_details">
                                        <div class="about_room floatleft">
                                            <div class="room_quality floatleft">
                                                <h5>${type1.typeName}</h5>
                                            </div>
                                            <div class="room_rent floatleft">
                                                <p><fmt:formatNumber value="${type1.roomTypePrice}" type="number" groupingUsed="true" /> VND<span> /Đêm</span></p>
                                            </div>
                                        </div>
                                        <div class="room_block floatright">
                                            <a href="room_type_details?id=${type1.roomTypeId}" class="btn btn-black">Xem phòng</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-sx-12">
                                <div class="room_thumb small_room_thumb margin-bottom-35">
                                    <a href="room_type_details?id=${type2.roomTypeId}">
                                        <img src="Views/client/img/${type2.roomtype_img}" style="width: 360px; height: 210px" alt="${type1.typeName}"></a>
                                    <div class="room_details">
                                        <div class="about_room floatleft">
                                            <div class="room_quality floatleft">
                                                <h5>${type2.typeName}</h5>
                                            </div>
                                            <div class="room_rent floatleft">
                                                <p><fmt:formatNumber value="${type2.roomTypePrice}" type="number" groupingUsed="true" /> VND<span> /Đêm</span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="room_thumb small_room_thumb">
                                    <a href="room_type_details?id=${type3.roomTypeId}">
                                        <img src="Views/client/img/${type3.roomtype_img}" style="width: 360px; height: 210px" alt="${type1.typeName}">
                                    </a>
                                    <div class="room_details">
                                        <div class="about_room floatleft">
                                            <div class="room_quality floatleft">
                                                <h5>${type3.typeName}</h5>
                                            </div>
                                            <div class="room_rent floatleft">
                                                <p><fmt:formatNumber value="${type3.roomTypePrice}" type="number" groupingUsed="true" /> VND<span> /Đêm</span></p>
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


        <!-- start other detect room section -->
        <section class="other_room_area">
            <div class="container">
                <div class="row">
                    <div class="other_room">
                        <div class="section_title nice_title content-center">
                            <h3>Loại phòng khác</h3>
                        </div>
                        <div class="section_content">
                            <!-- start single room details -->
                            <div class="accomodation_single_room">
                                <div class="container">
                                    <div class="row">
                                        <c:forEach items="${listother}" var="i">
                                            <div class="col-lg-3 col-md-3 col-sm-3">
                                                <div class="single_room_wrapper clearfix padding-bottom-30">
                                                    <figure class="uk-overlay uk-overlay-hover">
                                                        <div class="room_media">
                                                            <a href="room_type_details?id=${i.roomTypeId}"><img src="Views/client/img/${i.roomtype_img}" alt="${i.typeName}"></a>
                                                        </div>
                                                        <div class="room_title border-bottom-whitesmoke clearfix">
                                                            <div class="left_room_title floatleft">
                                                                <h6>${i.typeName}</h6>
                                                                <p><fmt:formatNumber value="${i.roomTypePrice}" type="number" groupingUsed="true" /> VND<span> /Đêm</span></p>
                                                            </div>
                                                            <div class="left_room_title floatright">
                                                                <a href="room_type_details?id=${i.roomTypeId}" class="btn">Xem thêm</a>
                                                            </div>
                                                        </div>
                                                        <div class="uk-overlay-panel uk-overlay-background single_wrapper_details clearfix animated bounceInDown">
                                                            <div class="border-dark-1 padding-22 clearfix single_wrapper_details_pad">
                                                                <h5>${i.typeName}</h5>
                                                                <p>
                                                                    ${i.roomTypedescripsion}
                                                                </p>
                                                                <p>
                                                                    ${i.contentDescripsion}
                                                                </p>
                                                                <div class="single_room_cost clearfix">
                                                                    <div class="floatleft">
                                                                        <p><fmt:formatNumber value="${i.roomTypePrice}" type="number" groupingUsed="true" /> VND<span> /Đêm</span></p>
                                                                    </div>
                                                                    <div class="floatright">
                                                                        <a href="room_type_details?id=${i.roomTypeId}" class="btn">Xem thêm</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </figure>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
<!--                                    <div class="row">
                                        <nav class="text-center margin-top-65 margin-bottom-75">
                                            <ul class="pagination">
                                                <li>
                                                    <a href="#" aria-label="Previous">
                                                        <i class="fa fa-angle-left"></i>Trước
                                                    </a>
                                                </li>
                                                <li class="active"><a href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                                <li><a href="#">5</a></li>
                                                <li>
                                                    <a href="#" aria-label="Next">Sau
                                                        <i class="fa fa-angle-right"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>-->
                                </div>
                            </div>
                            <!-- end single room details -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end other detect room section -->


        <!-- start footer -->
        <jsp:include page="layout/footer.jsp"></jsp:include>
        <!-- end footer -->
        <style>
            .breadcrumb_main1 {
                position: relative;
                text-align: center;
            }

            .centered-heading1 {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                color: white;
                font-size: 2em; /* Adjust the size as needed */
                z-index: 1; /* Ensure it appears above the image */
            }

            .breadcrumb_main1 img {
                width: 100%;
                height: auto;
            }
        </style>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                window.scrollTo(0, 480);
            });
        </script>
        <script src="Views/client/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="Views/client/js/bootstrap.min.js"></script>
        <script src="Views/client/js/uikit.min.js"></script>
        <script src="Views/client/js/jquery.easing.1.3.min.js"></script>
        <script src="Views/client/js/datepicker.js"></script>
        <!-- scroll up -->
        <script src="Views/client/js/jquery.scrollUp.min.js"></script>
        <!-- owlcarousel -->
        <script src="Views/client/js/owl.carousel.min.js"></script>
        <!-- lightslider -->
        <script src="Views/client/js/lightslider.js"></script>
        <!-- wow Animation -->
        <script src="Views/client/js/wow.min.js"></script>
        <!--Activating WOW Animation only for modern browser-->
        <!--[if !IE]><!-->
        <script type="Views/client/text/javascript">new WOW().init();</script>
        <script src="Views/client/js/main.js"></script>
    </body>
</html>
