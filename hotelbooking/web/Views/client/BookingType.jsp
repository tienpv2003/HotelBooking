<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
        <div id="booking_page">
            <!-- start breadcrumb -->
            <section class="breadcrumb_main_area margin-bottom-80">
                <div class="container-fluid">
                    <div class="row">
                        <div class="breadcrumb_main nice_title">
                            <h2 style="color: white">Đặt trước</h2>
                            <!-- special offer start -->
                            <div class="special_offer_main">
                                <div class="container">
                                    <div class="special_offer_sub">
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
            <section class="booking_area">
                <div class="container">
                <c:if test="${not empty messErr}">
                    <p class="alert alert-danger">${messErr}</p>
                </c:if>
                <div class="booking">
                    <div role="tabpanel" >
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#booking_info" aria-controls="booking_info" role="tab" data-toggle="tab">
                                    <i>1</i><span>Thông tin đặt phòng</span>
                                </a>
                            </li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">

                            <form role="form" action="view_list_type_room" method="post" >
                                <div class="row">
                                    <!-- start hotel booking -->
                                    <div class="hotel_booking_area">
                                        <div class="container">
                                            <div class="hotel_booking margin-top-45">

                                                <div class="col-lg-2 col-md-2 col-sm-2">
                                                    <div class="room_book border-right-dark-1">
                                                        <h6>Lựa chọn</h6>
                                                        <p>Ngày</p>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-3 col-md-3 col-sm-3">
                                                    <div class="input-group border-bottom-dark-2">
                                                        <input class="date-picker" id="datepicker" name="startDate" placeholder="Ngày nhận phòng" type="text" required/>
                                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-3 col-md-3 col-sm-3">
                                                    <div class="input-group border-bottom-dark-2">
                                                        <input class="date-picker" id="datepicker1" name="endDate" placeholder="Ngày trả phòng" type="text" required/>
                                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- end hotel booking -->
                                </div>
                                <div role="tabpanel" class="tab-pane active" id="booking_info">
                                    <div class="booking_info_area">
                                        <div class="facilities_name clearfix margin-bottom-150 margin-top-70">
                                            <div class="col-lg-12 col-md-12 col-sm-7">
                                                <div class="tab-content">
                                                    <div role="tabpanel" class="tab-pane active" id="personal_info">
                                                        <div class="personal_info_area">
                                                            <div class="hotel_booking_area">
                                                                <section class="welcome_area">
                                                                    <div class="col-lg-12 col-md-12">
                                                                        <div class="welcome">
                                                                            <div class="row">
                                                                                <c:forEach items="${listTR}" var="t">
                                                                                    <div class="col-lg-3 col-md-3 col-lg-3">
                                                                                        <div class="single_room_wrapper clearfix">
                                                                                            <div class="room_wrapper">
                                                                                                <div class="room_media">
                                                                                                    <img style="width: 250px; height: 175px" src="Views/client/img/${t.roomtype_img}" alt="">
                                                                                                </div>
                                                                                                <div class="room_title clearfix" style="display: flex; justify-content: space-between">
                                                                                                    <div class="left_room_title floatleft">
                                                                                                        <h6><strong>${t.typeName}</strong></h6>    
                                                                                                        <h6><fmt:formatNumber value="${t.roomTypePrice}" type="number" groupingUsed="true" /> VNĐ</h6>                         
                                                                                                    </div>
                                                                                                    <div class="left_room_title floatright">
                                                                                                        <input type="number" name="type${t.roomTypeId}" value="0" min="0" max="${t.quantity}">
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
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12">
                                                <div class="booking_next_btn padding-top-30 margin-top-20 clearfix border-top-whitesmoke">
                                                    <input type="hidden" value="${t.roomTypeId}" name="typeId">
                                                    <input type="submit" value="Tiếp" class="btn btn-warning btn-sm floatright" style="margin-bottom: 50px">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</section>
<!-- end other detect room section -->

</div>
<jsp:include page="layout/footer.jsp"></jsp:include>
<style>
    .nav-tabs {
        display: flex;
        justify-content: center;
    }
</style>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        window.scrollTo(0, 510);
    });
</script>