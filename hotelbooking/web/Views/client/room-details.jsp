<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">

    <!-- Mirrored from demoxml.com/html/hotelbooking/room-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 17 May 2024 09:19:57 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Hotel Booking</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="icon" href="img/favicon.ico" sizes="16x16">

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
    </head>
    <body id="room_detail_page">
        <jsp:include page="layout/header.jsp"></jsp:include>
            <!-- start breadcrumb -->
            <section class="breadcrumb_main_area margin-bottom-80">
                <div class="container-fluid">
                    <div class="row">
                        <div class="breadcrumb_main1" style="padding-top: 0px; padding-bottom: 0px; position: relative;">
                            <img src="Views/client/img/accomodation-breadcrumb-one.jpg" alt="imf" style="width: 100%;">
                            <h2 class="centered-heading1">${roomType.typeName}</h2>
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
        <div class="room_detail_main margin-bottom-55">
            <div class="container">
                <div class="row">
                    <c:set value="${roomType}" var="t"/>
                    <div class="col-lg-9 col-md-9">
                        <div class="deluxe_room_detail">
                            <div class="section_title content-left margin-bottom-5">
                                <h5>Kiểu: ${t.typeName} <span class="price floatright"><fmt:formatNumber value="${t.roomTypePrice}" type="number" groupingUsed="true" /> VND/Đêm</span></h5>
                            </div>
                            <div class="section_content">
                                <p>${t.titleDescripsion}</p>
                                <div class="showcase">
                                    <div class="section_description">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12">
                                                <div class="clearfix" style="">
                                                    <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                                                        <!-- <ul id="vertical" class="gallery list-unstyled"> -->
                                                        <c:forEach items="${t.roomImages}" var="img">
                                                            <li data-thumb="Views/client/img/${img}" style="width:100%;height: auto; object-fit: cover">
                                                                <img alt="slider" src="Views/client/img/${img}" style="width:100%;height: auto; object-fit: cover"/>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="facilities_name clearfix margin-bottom-40 margin-top-65">
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="section_title margin-bottom-35 padding-bottom-25 border-bottom-whitesmoke">
                                                        <h5>Dịch vụ phòng</h5>
                                                    </div>
                                                </div>
                                                <c:forEach items="${t.listService}" var="service">
                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 no-padding-left">
                                                        <ul class="single_facilities_name clearul">
                                                            <li>
                                                                <img src="Views/client/img/${service.image}" alt="">
                                                                <p>${service.nameService}</p>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12">
                                                <div class="room_facilities_des padding-top-50 padding-bottom-50 border-bottom-whitesmoke border-top-whitesmoke">
                                                    <p>
                                                        ${t.roomTypedescripsion}
                                                    </p>
                                                    <p>
                                                        ${t.contentDescripsion}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <!-- start welcome section -->
                                            <section class="welcome_area">
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="welcome">
                                                        <div class="section_title content-left margin-top-50 margin-bottom-30">
                                                            <h5>Các loại phòng khác</h5>
                                                        </div>
                                                        <div class="row">
                                                            <c:forEach items="${top4}" var="four">
                                                                <div class="col-lg-4 col-md-4 col-sm-4">
                                                                    <div class="single_room_wrapper clearfix">
                                                                        <div class="room_wrapper">
                                                                            <div class="room_media">
                                                                                <img style="width: 100%; height: 145px" src="Views/client/img/${four.roomtype_img}" >
                                                                            </div>
                                                                            <div class="room_title clearfix">
                                                                                <div class="left_room_title floatleft">
                                                                                    <h5>${four.typeName}</h5>
                                                                                    <p><fmt:formatNumber value="${four.roomTypePrice}" type="number" groupingUsed="true"/> VND<span>/Đêm</span></p>
                                                                                </div>
                                                                                <div class="left_room_title floatright">
                                                                                    <a href="room_type_details?id=${four.roomTypeId}" class="btn btn-md">Xem thêm</a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                            <!-- end welcome section -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <!-- start hotel booking -->
                        <div class="col-lg-12 col-md-12 col-sm-4">
                            <form id="form1" role="form" action="#" class="">
                                <div class="col-lg-12 col-md-12">
                                    <c:if test="${sessionScope.cusObj != null}">
                                        <a class="btn btn-warning btn-md center-block" href="booking_step_1?typeId=${roomType.roomTypeId}">Đặt phòng</a>
                                    </c:if>   
                                    <c:if test="${sessionScope.cusObj == null}">   
                                        <a class="btn btn-warning btn-md center-block" href="signin">Đặt phòng</a>
                                    </c:if>
                                </div>
                            </form>
                        </div>
                        <!-- end hotel booking -->
                        <!-- start client says slider -->
                        <div class="col-lg-12 col-md-12 col-sm-4">
                            <div class="customer_says margin-top-65">
                                <div class="section_title margin-bottom-30">
                                    <h5>Đánh giá Khách Hàng</h5>
                                </div>
                                <div class="section_description">
                                    <div id="customer_says_slider" class="carousel slide" data-ride="carousel" data-pause="none">
                                        <ul id="review-list">
                                            <c:forEach var="i" items="${listReview}">
                                                <input hidden="" name="reviewId" value="${i.reviewId}">
                                                <li class="carousel-item" id="review-${i.reviewId}">
                                                    <div class="single_says">
                                                        <div class="customer_detail clearfix" style="display: flex; align-items: center;">
                                                            <div class="customer_pic alignleft">
                                                                <img class="customer_imgs" src="Views/client/img/default-avt.jpg" alt="">
                                                            </div>
                                                            <div class="customer_identity floatright">
                                                                <h7 class="customer_names">${i.customer.firstName} ${i.customer.lastName}</h7>
                                                            </div>
                                                        </div>
                                                        <div class="customer_comments">
                                                            <hr>
                                                            <p>${i.description}</p>
                                                        </div>
                                                        <!-- Thẻ Gỡ Đánh giá -->
                                                        <div class="remove-review" style="text-align: right">
                                                            <hr>     
                                                            <c:if test="${not empty sessionScope.cusObj && sessionScope.cusObj.customerId == i.customer.customerId}">
                                                                <a href="update_review_cus?reviewId=${i.reviewId}"
                                                                   style="font-size: 15px; align-content: end; color: red; font-weight: bold">
                                                                    Sửa
                                                                </a>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Pagination Controls -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <c:forEach var="page" begin="1" end="${endPage}">
                                    <li class="page-item ${page == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="room_type_details?id=${roomType.roomTypeId}&index=${page}">${page}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                        <c:set var="cus" value="${sessionScope.cusObj}"></c:set>
                        <c:if test="${not empty cus}">
                            <!-- end client says slider -->
                            <a href="add_review?roomTypeId=${roomType.roomTypeId}" class="btn btn-create center-block">THÊM ĐÁNH GIÁ</a>
                        </c:if>
                        <c:if test="${empty cus}">
                            <!-- end client says slider -->
                            <a href="signin" class="btn btn-create center-block">ĐĂNG NHẬP</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="layout/footer.jsp"></jsp:include>
        <style>
            .pagination{
                padding-left: 75px;
            }
            ul {
                list-style: none;
                margin-top: 0px;
                padding: 0px;
            }
            .section_description {
                padding: 15px;
                background-color: #f9f9f9;
                border-radius: 8px;
                margin-bottom:10px;
            }

            .carousel-inner {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .carousel-item {
                width: 100%;
                max-width: 650px;
                margin: 0 auto;
                transition: transform 0.5s ease;
            }

            .single_says {
                padding: 20px;
                border-radius: 8px;
                background-color: #fff;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                text-align: left;
            }

            .customer_detail {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }

            .customer_pic {
                flex-shrink: 0;
                margin-right: 15px;
            }

            .customer_imgs {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                object-fit: cover;
            }

            .customer_identity {
                flex-grow: 1;
            }

            .customer_names {
                font-size: 1em;
                font-weight: bold;
                margin: 0;
            }

            .customer_comments {
                font-size: 1em;
                color: #555;
            }

            hr {
                border: 0;
                height: 1px;
                background: #ddd;
                margin: 10px 0;
            }

        </style>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                window.scrollTo(0, 480);
            });
        </script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- jquery library -->
        <script src="Views/client/js/vendor/jquery-1.11.2.min.js"></script>
        <!-- bootstrap -->
        <script src="Views/client/js/bootstrap.min.js"></script>

        <!-- uikit -->
        <script src="Views/client/js/uikit.min.js"></script>
        <!-- easing -->
        <script src="Views/client//js/jquery.easing.1.3.min.js"></script>
        <script src="Views/client//js/datepicker.js"></script>
        <!-- scroll up -->
        <script src="Views/client//js/jquery.scrollUp.min.js"></script>
        <!-- owlcarousel -->
        <script src="Views/client//js/owl.carousel.min.js"></script>
        <!-- lightslider -->
        <script src="Views/client//js/lightslider.js"></script>
        <!-- wow Animation -->
        <script src="Views/client//js/wow.min.js"></script>
        <!--Activating WOW Animation only for modern browser-->
        <!--[if !IE]><!-->
        <script type="Views/client/text/javascript">new WOW().init();</script>
        <!--<![endif]-->

        <!--Oh Yes, IE 9+ Supports animation, lets activate for IE 9+-->
        <!--[if gte IE 9]>
            <script type="text/javascript">new WOW().init();</script>
        <![endif]-->         

        <!--Opacity & Other IE fix for older browser-->
        <!--[if lte IE 8]>
            <script type="text/javascript" src="Views/client//js/ie-opacity-polyfill.js"></script>
        <![endif]-->



        <!-- my js -->
        <script src="js/main.js"></script>

    </body>

    <!-- Mirrored from demoxml.com/html/hotelbooking/room-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 17 May 2024 09:20:01 GMT -->
</html>
