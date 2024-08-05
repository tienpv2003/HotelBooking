<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Đánh giá</title>
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
                font-size: 2em;
                z-index: 1;
            }

            .breadcrumb_main1 img {
                width: 100%;
                height: auto;
            }

            .pagination {
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
                margin-bottom: 10px;
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

            .btn-file {
                position: relative;
                overflow: hidden;
            }

            .btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 100%;
                min-height: 100%;
                font-size: 100px;
                text-align: right;
                filter: alpha(opacity=0);
                opacity: 0;
                outline: none;
                background: white;
                cursor: inherit;
                display: block;
            }

            input[readonly] {
                background-color: white !important;
                cursor: text !important;
            }

            .container {
                padding-top: 20px;
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
                            <h2 class="centered-heading1">Đánh giá Phòng</h2>
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
            <!-- end breadcrumb -->

            <!-- Customer Review Form -->
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                    <c:if test="${not empty successMess}">
                        <div class="alert alert-success">${successMess}</div>
                    </c:if>
                    <c:if test="${not empty errorMess}">
                        <div class="alert alert-danger">${errorMess}</div>
                    </c:if>
                    <h1 style="font-weight: bold; text-align: center">NHẬP ĐÁNH GIÁ CỦA BẠN</h1> 
                        <form method="post" action="update_review_cus" role="form">
                            <div class="form-group">
                                <label for="title">Khách hàng</label>
                                <div style="display: flex">
                                    <img src="Views/client/img/default-avt.jpg" width="55" height="30" style="border-radius: 50%; margin-right: 20px" alt="avata"/>
                                    <p><strong>${review.customer.firstName} ${review.customer.lastName}</strong></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="description">Đánh giá</label>
                            <input value="${review.description}" name="description" style="height: 150px" class="form-control bcontent"required />
                        </div>
                        <div class="form-group">
                            <input value="${review.reviewId}" name="reviewId" type="hidden"/>
                            <input type="submit" name="Submit" style="width: 100px; height: 40px" value="Sửa" class="btn btn-primary form-control" />
                            <a href="delete_review?reviewId=${review.reviewId}" class="btn btn-danger" style="margin-left: 20px; color: white">Xóa Đánh giá</a>
                            <a href="all_room_cus" class="btn btn-black" style="margin-left: 20px">Quay lại</a>
                        </div>
                    </form>                           
                </div>
            </div>
        </div>

        <jsp:include page="layout/footer.jsp"></jsp:include>

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
        <!-- Activating WOW Animation only for modern browser -->
        <!--[if !IE]><!-->
        <script type="Views/client/text/javascript">new WOW().init();</script>

