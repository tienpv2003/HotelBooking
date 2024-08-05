<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>

        <!-- start main slider -->
        <div class="main_slider_area">
            <div class="main_slider" id="slider_rev">
                <div class="fullwidthbanner-container" >
                    <div class="fullwidth_home_banner">
                        <ul>

                        <c:forEach var="eventtitle" items="${listeventtitle}" varStatus="status">
                            <li data-transition="random" data-slotamount="7" data-masterspeed="1000">
                                <img src="Views/client/img/${eventtitle.image}" alt="slide" >
                                <div class="tp-caption large_black sfr" data-x="105" data-y="197" data-speed="1200" data-start="1100" data-easing="easeInOutBack"
                                     style="font-family: 'Playfair Display', serif; font-size: 48px;color: #131e2a; margin-bottom: 23px; text-transform: uppercase; line-height: 40px;">
                                    ${eventtitle.titleEvent}
                                </div>

                                <div class="tp-caption lfb carousel-caption-inner" data-x="105" data-y="313" data-speed="1300" data-start="1700" data-easing="easeInOutBack" 
                                     style="background: #f7c411; padding: 10px; cursor: pointer;">
                                    <a href="list_event_client" class="" style="background: #f7c411; border-radius: 0; color: #313a45; display: inline-block;  font-size: 18px; padding: 8px 34px; text-transform: uppercase; border: 1px solid #9e811a;">Khám phá sự </a>
                                </div>
                            </li>   
                        </c:forEach>


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
                    <p>Khách sạn của chúng tôi luôn mang đến sự thoải mái và tiện nghi cho khách hàng. 
                        Với không gian sang trọng và dịch vụ chuyên nghiệp, chúng tôi đảm bảo mỗi kỳ nghỉ của bạn sẽ là một trải nghiệm tuyệt vời. 
                    </p>
                </div>
                <div class="row">
                    <c:forEach items="${listTypeRoom}" var="t">
                        <div class="col-lg-3 col-md-3 col-sm-3">
                            <div class="single_room_wrapper clearfix">
                                <figure class="uk-overlay uk-overlay-hover">
                                    <div class="room_media">
                                        <a href="#"><img style="width: 220px; height: 150px" src="Views/client/img/${t.roomtype_img}" alt=""></a>
                                            <c:if test="${t.quantity == 0}">
                                            <div class="overlay">
                                                <span class="sold-out-text">Hết phòng</span>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="room_title border-bottom-whitesmoke clearfix">
                                        <div class="left_room_title floatleft">
                                            <h6>${t.typeName}</h6>
                                        </div>
                                        <div class="left_room_title floatright">
                                            <c:choose>
                                                <c:when test="${t.quantity == 0}">
                                                    <a href="#" class="btn btn-black disabled">Hết phòng</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="room_type_details?id=${t.roomTypeId}" class="btn btn-black">Chi Tiết</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="uk-overlay-panel uk-overlay-background single_wrapper_details clearfix animated bounceInDown">
                                        <div class="border-dark-1 padding-22 clearfix single_wrapper_details_pad">
                                            <h5>${t.typeName}</h5>
                                            <p>
                                                ${t.roomTypedescripsion}
                                            </p>
                                            <div class="single_room_cost clearfix">
                                                <div class="floatright">
                                                    <c:choose>
                                                        <c:when test="${t.quantity == 0}">
                                                            <p class="btn btn-black disabled">Hết phòng</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="room_type_details?id=${t.roomTypeId}" class="btn btn-black">Chi Tiết</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </figure>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="col-lg-12 text-center">
                        <form id="form1" role="form" action="#" class="">
                            <c:if test="${sessionScope.cusObj != null}">
                                <a class="btn btn-warning btn-md" style="margin-top: 90px" href="view_list_type_room">Đặt nhiều loại phòng</a>
                            </c:if>   
                            <c:if test="${sessionScope.cusObj == null}">   
                                <a class="btn btn-warning btn-md" style="margin-top: 90px" href="signin">Đặt nhiều loại phòng</a>
                            </c:if>
                        </form>
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
                    <h3>Các dịch vụ của khách sạn</h3>
                </div>
                <div class="hotel_facilities_content">
                    <div role="tabpanel">

                        <!-- Nav tabs -->

                        <ul class="nav nav-tabs" role="tablist">
                            <c:forEach var="service" items="${list5services}" varStatus="status">
                                <li role="presentation" class="${status.index == 0 ? 'active' : ''}">
                                    <a href="#${service.serviceId}" aria-controls="restaurant" role="tab" data-toggle="tab"><img src="Views/client/img/${service.image}"><span>${service.nameService}</span></a>
                                </li>
                            </c:forEach>

                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <c:forEach var="service" items="${list5services}" varStatus="status">
                                <div role="tabpanel" class="tab-pane ${status.index == 0 ? 'active' : ''}" id="${service.serviceId}">
                                    <div class="single-tab-content">
                                        <div class="row">
                                            <div class="co-lg-5 col-md-5 col-sm-6">
                                                <div class="single-tab-image">
                                                    <a href="#"><img src="Views/client/img/showcase-slider-two.jpg" alt=""></a>
                                                </div>
                                            </div>
                                            <div class="col-lg-7 col-md-7 col-sm-6">
                                                <div class="single-tab-details">

                                                    <h3>${service.titleService}</h3>
                                                    <p>${service.description}</p>
                                                    <p>Phí dịch vụ: <fmt:formatNumber value="${service.priceService}" type="number" groupingUsed="true" /> VND</p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </c:forEach>
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
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 padding-left-0">
                    <div class="news">
                        <div class="section_title margin-bottom-50">
                            <h5>Tin tức Mới nhất</h5>
                        </div>
                        <div class="section_description">                                    
                            <div class="row">
                                <div class="col-md-12">
                                    <c:forEach var="newsItem" items="${list3news}">
                                        <div class="single_content clearfix border-bottom-whitesmoke">
                                            <div>
                                                <a href="news_detail_customer?newId=${newsItem.newsId}" class="recent_post_link">
                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-4 padding-left-0">
                                                        <div class="recent_thumb">
                                                            <img src="Views/admin/assets/img/product/${newsItem.img}" alt="img" class="recent_img">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-6 padding-left-0">
                                                        <div class="post_title clearfix">
                                                            <h6>${newsItem.title}</h6>
                                                        </div>
                                                        <div class="post_content margin-bottom-35">
                                                            <p>${newsItem.createDate}</p>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>    
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="customer_says">
                        <div class="section_title margin-bottom-50">
                            <h5>Đánh giá khách hàng</h5>
                        </div>
                        <div class="section_description">
                            <div id="customer_says_slider" class="carousel slide" data-ride="carousel" data-pause="none">
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner" role="listbox">
                                    <div class="item active">
                                        <div class="single_says">
                                            <div class="customer_detail clearfix">
                                                <div class="customer_pic alignleft-20">
                                                    <img src="Views/client/img/default-avt.jpg" style="border-radius: 50%" width="50" height="50" alt="avata">
                                                </div>
                                                <div class="customer_identity floatleft justify-content-md-center">
                                                    <h5 style="padding-top: 5px">
                                                        <strong>${newReview.customer.firstName} ${newReview.customer.lastName}</strong>
                                                    </h5>
                                                </div>
                                            </div>
                                            <div class="customer_comment margin-top-30">
                                                <p>
                                                    ${newReview.description}
                                                </p>
                                            </div>                                            
                                        </div>
                                    </div>                                                   
                                    <c:forEach items="${oldReview}" var="r">
                                        <div class="item">
                                            <div class="single_says">
                                                <div class="customer_detail clearfix">
                                                    <div class="customer_pic alignleft-20">
                                                        <img src="Views/client/img/default-avt.jpg" style="border-radius: 50%" width="50" height="50" alt="avata">
                                                    </div>
                                                    <div class="customer_identity floatleft">
                                                        <h5 style="padding-top: 5px">
                                                            <strong>${r.customer.firstName} ${r.customer.lastName}</strong>
                                                        </h5>
                                                    </div>
                                                </div>
                                                <div class="customer_comment margin-top-30">
                                                    <p>
                                                        ${r.description}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>                                                   
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Controls -->
                <br>
                <a class="slider_says left" style="padding-left: 70px" href="#customer_says_slider" role="button" data-slide="prev">
                    Trước
                    <i class="fa fa-angle-left"></i>
                </a>
                <a class="slider_says right" href="#customer_says_slider" role="button" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                    Sau
                </a>
            </div>
        </div>
    </section>
    <!-- end About Us section -->

    <jsp:include page="layout/footer.jsp"></jsp:include>
    <style>
        .hotel_facilities_area {
            background-image: url('Views/client/img/hotel-facilities-bg.jpg');
        }
        .main_slider_area {
            position: relative;
        }
        .room_media {
            position: relative;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu đen với độ mờ */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .sold-out-text {
            color: red;
            font-size: 24px;
            font-weight: bold;
            text-transform: uppercase;
        }
        .text-center {
            display: flex;
            justify-content: center;
            align-items: center;
        }

    </style>
    <!-- jquery library -->
    <script src="Views/client/js/vendor/jquery-1.11.2.min.js"></script>
    <!-- bootstrap -->
    <script src="Views/client/js/bootstrap.min.js"></script>
    <!-- rev slider -->
    <script src="Views/client/js/rev-slider/rs-plugin/jquery.themepunch.plugins.min.js"></script>
    <script src="Views/client/js/rev-slider/rs-plugin/jquery.themepunch.revolution.js"></script>
    <script src="Views/client/js/rev-slider/rs.home.js"></script>
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
    <script type="text/javascript">new WOW().init();</script>
    <script src="Views/client/js/main.js"></script>

</body>
</html>
