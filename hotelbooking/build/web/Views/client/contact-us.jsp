<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
        <!-- start breadcrumb -->
        <section class="breadcrumb_main_area margin-bottom-80">
            <div class="container-fluid">
                <div class="row">
                    <div class="breadcrumb_main1" style="padding-top: 0px; padding-bottom: 0px; position: relative;">
                        <img src="Views/client/img/accomodation-breadcrumb-one.jpg" alt="imf" style="width: 100%;">
                        <h2 class="centered-heading1">Liên hệ với chúng tôi</h2>
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

        <!-- start other detect room section -->
        <div class="contact_google_map_area margin-bottom-75">
            <div class="container">
                <h1 style="padding-bottom: 20px; text-align: center">Vị trí khách sạn</h1>
                <div class="contact_google_map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d708.6186578959009!2d105.52057025453364!3d20.999439469770405!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b3c8d2b8103%3A0x622619b2907966ec!2sKhu%20Tr%E1%BB%8D%20Minh%20Anh!5e1!3m2!1svi!2s!4v1717585534907!5m2!1svi!2s" 
                            width="100%" height="400" style="border:0;" 
                            allowfullscreen="" referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>
            </div>
        </div>
        <!-- end other detect room section -->

        <!-- start contact mail area -->
        <section class="contact_mail_area margin-bottom-90">
            <div class="container">
                <div class="row">
                    <div class="contact_mail">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="contact_info margin-top-65">
                                <div class="section_title margin-bottom-45">
                                    <h4>Thông tin liên lạc</h4>
                                </div>
                                <ul class="clearul">
                                    <li>
                                        <i class="fa fa-map-marker"></i>
                                        Hòa Lạc, Thạch Thất <br>
                                        Hà Nội, Việt Nam
                                    </li>
                                    <li>
                                        <i class="fa fa-phone"></i>
                                        0968284630
                                    </li>
                                    <li>
                                        <i class="fa fa-envelope-o"></i>
                                        info@hotelbooking.com
                                    </li>
                                </ul>
                                <div class="social_icons clearfix">
                                    <ul class="clearul" style="display: flex">
                                        <li style="margin-right: 20px"><a href="https://www.facebook.com/home.php" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="https://www.instagram.com/" target="_blank"><i class="fa fa-instagram"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end contact mail area -->

    <jsp:include page="layout/footer.jsp"></jsp:include>



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
        <script type="text/javascript" src="Views/client/js/ie-opacity-polyfill.js"></script>
    <![endif]-->



    <!-- my js -->
    <script src="Views/client/js/main.js"></script>

    <!-- Google maps API -->
    <script src="Views/client/http://maps.googleapis.com/maps/api/js"></script>
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
</body>

<!-- Mirrored from demoxml.com/html/hotelbooking/contact-us.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 17 May 2024 09:20:05 GMT -->
</html>
