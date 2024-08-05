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
                            <form role="form" action="booking_step_1" method="post" >
                                <div role="tabpanel" class="tab-pane active" id="booking_info">
                                    <div class="booking_info_area">
                                        <div class="facilities_name clearfix margin-bottom-150 margin-top-70">

                                            <c:set value="${roomType}" var="t"></c:set>
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-3 col-sm-5">
                                                        <img src="Views/client/img/${t.roomtype_img}" style="width: 220px; height: 150px" alt="">
                                                </div>
                                                <div class="col-lg-9 col-md-9 col-sm-7">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12">
                                                            <div class="section_title clearfix margin-bottom-5">
                                                                <h4 class="floatleft"><strong>${t.typeName}</strong> 
                                                                    <span class="price floatright margin-left-15">
                                                                        (<fmt:formatNumber value="${t.roomTypePrice}" type="number" groupingUsed="true"/> VND/Đêm)
                                                                    </span>
                                                                </h4>
                                                            </div>
                                                        </div>
                                                        <c:forEach items="${t.listService}" var="s">
                                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 no-padding-left">
                                                                <ul class="single_facilities_name clearul">
                                                                    <li>
                                                                        <img src="Views/client/img/${s.image}" style="width: 48px; height: 32px" alt="">
                                                                        <p>${s.nameService}</p>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
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
                                                            <div class="col-lg-4 col-md-4 col-sm-4">
                                                                <div class="row">
                                                                    <div class="form-group col-lg-4 col-md-4 col-sm-4 icon_arrow">
                                                                        <div class="input-group border-bottom-dark-2">
                                                                            <select class="form-control" name="roomNumber" id="room">
                                                                                <c:forEach var="i" begin="1" end="${getNumberRoomActive}">
                                                                                    <option value="${i}">${i} phòng</option>
                                                                                </c:forEach>
                                                                            </select>               
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- end hotel booking -->
                                            </div>
                                            <div class="row">
                                                <div class="about_booking_room clearfix margin-top-30">
                                                    <div class="col-lg-7 col-md-7 col-sm-6">
                                                        <div class="booking_room_details">
                                                            <p>
                                                                ${t.roomTypedescripsion}
                                                            </p>
                                                            <p>
                                                                ${t.contentDescripsion}
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-5 col-md-5 col-sm-6">
                                                        <div class="room_cost">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12">
                                                                    <div class="table-responsive">

                                                                    </div>
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
                                                        <input type="submit" value="Tiếp" class="btn btn-warning btn-sm floatright">
                                                    </div>
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
