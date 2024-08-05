<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
            <!-- end breadcrumb -->

            <!-- start other detect room section -->
            <section class="booking_area">
                <div class="container">
                <c:if test="${not empty messErr}">
                    <p class="alert alert-danger">${messErr}</p>
                </c:if>
                <div class="booking">
                    <div role="tabpanel">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" style="display: flex; justify-content: center" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#personal_info" aria-controls="personal_info" role="tab" data-toggle="tab"><i>2</i><span>Chọn dịch vụ cho phòng</span></a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="personal_info">
                                <div class="personal_info_area">
                                    <div class="hotel_booking_area">
                                        <section class="welcome_area">
                                            <div class="col-lg-12 col-md-12">
                                                <div class="welcome">
                                                    <div class="section_title content-left margin-top-50 margin-bottom-30">
                                                        <h5>Các loại phòng khác</h5>
                                                    </div>
                                                    <div class="row">
                                                        <c:set var="bookingFlex" value="${sessionScope.listBookingFlex}"></c:set>
                                                        <c:set var="total" value="0"></c:set>
                                                        <c:forEach items="${bookingFlex}" var="booking">
                                                            <c:forEach items="${booking.listItem}" var="t">
                                                                <div class="col-lg-4 col-md-4 col-sm-4">
                                                                    <div class="single_room_wrapper clearfix">
                                                                        <div class="room_wrapper">
                                                                            <div class="room_media">
                                                                                <a href="booking_service_flex?roomId=${t.room.roomId}"><img src="Views/client/img/${t.room.roomType.roomtype_img}" style="width: 283px; height: 187px" alt=""></a>
                                                                            </div>
                                                                            <div class="room_title clearfix">
                                                                                <div class="left_room_title floatleft">
                                                                                    <h6>${t.room.roomName} - <fmt:formatNumber value="${t.price}" type="number" groupingUsed="true" /></h6>
                                                                                    <p>${t.room.roomType.typeName}</p>
                                                                                </div>
                                                                                <div class="left_room_title floatright">
                                                                                    <a href="booking_service_flex?roomId=${t.room.roomId}" class="btn">Thêm Dịch Vụ</a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                            <c:set var="total" value="${booking.calculateTotalPriceNotEvent() + total}"></c:set> 
                                                        </c:forEach>
                                                    </div>
                                                    <div class="section_title content-left margin-top-50 margin-bottom-30">
                                                        <h5>Tổng tiền:  <fmt:formatNumber value="${total}" type="number" groupingUsed="true" />VND</h5>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12">
                                                            <div class="booking_next_btn padding-top-30 margin-top-20 clearfix border-top-whitesmoke" style="margin-bottom: 30px">
                                                                <a href="booking_type_3" class="btn btn-warning btn-sm floatright" style="width: 120px"> Tiếp</a>
                                                                <a style="margin-right: 20px" href="booking_step_1?typeId=${requestScope.roomType.roomTypeId}" class="btn btn-warning btn-sm floatright"> Quay lại</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                        <c:if test="${not empty room}">
                                            <div id="active_asset" class="modal fade show" role="dialog">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-body text-center">
                                                            <div class="room-details">
                                                                <h2>${room.roomName}</h2>
                                                                <p>Loại phòng: ${room.roomType.typeName}</p>
                                                                <p>Giá phòng:  <fmt:formatNumber value="${room.roomType.roomTypePrice}" type="number" groupingUsed="true" /> VND/Đêm</p>
                                                                <img src="Views/client/img/${room.roomType.roomtype_img}" alt="${room.roomName}"/>
                                                            </div>
                                                            <div class="service-selection">
                                                                <h4 style="margin-bottom: 20px; font-weight: bold">Các tiện ích của phòng</h4>
                                                                <div style="display: flex; justify-content: space-evenly">
                                                                    <c:if test="${not empty convenient}">
                                                                         <c:forEach items="${convenient}" var="c">
                                                                        <h9 style="font-weight: bold; margin-bottom: 20px">
                                                                            ${c.convenientName}
                                                                        </h9>
                                                                    </c:forEach>
                                                                    </c:if> 
                                                                </div>
                                                                <h4 style="margin-bottom: 20px; font-weight: bold">Chọn thêm dịch vụ khác</h4>
                                                                <form action="booking_service_flex" method="post">
                                                                    <div class="service-grid">
                                                                        <c:forEach items="${listService}" var="service">
                                                                            <div class="service-item">
                                                                                <img src="Views/client/img/${service.image}" style="width: 48px; height: 32px" alt="alt"/>
                                                                                <label for="wifi">${service.nameService} (${service.priceService} VND)</label>
                                                                                <input type="checkbox" name="services" value="${service.serviceId}">
                                                                            </div>
                                                                        </c:forEach>
                                                                    </div>
                                                                    <input type="hidden" name="roomId" value="${room.roomId}">
                                                                    <input type="hidden" name="roomTypeId" value="${room.roomType.roomTypeId}">
                                                                    <input type="submit" value="Thêm dịch vụ" style="margin-bottom: 0px; margin-right: 20px" class="btn btn-create">
                                                                    <button type="button" class="btn btn-create" data-dismiss="modal" onclick="closeModal()">Hủy</button>
                                                                </form>                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="layout/footer.jsp"></jsp:include>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            window.scrollTo(0, 510);
        });
        function closeModal() {
            var modal = document.getElementById('active_asset');
            modal.classList.remove('show');
            modal.classList.add('fade');
            setTimeout(function () {
                modal.style.display = 'none';
            }, 300); // Thời gian delay để chuyển đổi hiệu ứng fade
        }
    </script>
    <style>
        .room-details {
            margin: 20px;
        }
        .room-details h2 {
            font-weight: bold;
            color: black;
        }
        .service-selection h4 {
            color: black;
        }
        .room-details img {
            width: 300px;
            height: 150px;
            border-radius: 2%;
        }
        .service-selection {
            margin: 20px;
        }
        .service-selection h3 {
            margin-bottom: 10px;
        }
        .service-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
        }
        .service-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .service-item input {
            margin-right: 5px;
        }
        .button-group {
            margin-top: 10px;
        }
        .modal.show {
            display: block;
        }
        .modal.fade {
            opacity: 1;
        }
        .modal-dialog-centered {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: calc(100vh - 1rem);
        }
        .modal-content {
            width: 100%;
            max-width: 600px;
            margin: auto;
        }
        .modal-body{
            margin-top: 170px;
            background: white;
            position: relative;
            height: auto;
        }
    </style>
</html>
