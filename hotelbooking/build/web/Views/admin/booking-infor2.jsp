<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Hotel Dashboard Template</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="Views/admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="Views/admin/assets/css/feathericon.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/morris/morris.css">
        <link rel="stylesheet" href="Views/admin/assets/css/style.css">
    </head>

    <style>
        .img_room {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 5px;
            border: 1px solid #ddd;
        }


        .table td {
            vertical-align: middle;
        }
    </style>
    <body>
        <div class="main-wrapper">		
            <%@include file="layout/header.jsp"%>
            <%@include file="layout/sidebar.jsp"%>
            <c:set value="${sessionScope.listBookingFlex}" var="listBookingFlex"></c:set>
            <c:set var="total" value="0"></c:set>

                <div class="page-wrapper">
                    <div class="content container-fluid">
                        <div class="page-header">
                            <div class="row align-items-center">
                                <div class="col">
                                    <div class="mt-5">
                                        <h4 class="card-title float-left mt-2">Tất cả phòng</h4>
                                    </div>



                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card card-table">
                                    <div class="card-body booking_card">
                                        <div class="table-responsive">
                                            <table class="datatable table table-stripped table-hover table-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>Tên phòng</th>
                                                        <th>Loại phòng</th>
                                                        <th>Ảnh phòng</th>
                                                        <th>Giá phòng</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listBookingFlex}" var="booking">
                                                    <c:forEach items="${booking.listItem}" var="t">
                                                        <tr>
                                                            <td>${t.room.roomName}</td>
                                                            <td>${t.room.roomType.typeName}</td>                                  
                                                            <td>
                                                                <img src="Views/client/img/${t.room.roomType.roomtype_img}" width="150" height="80" alt="${t.room.roomType.typeName}">
                                                            </td>
                                                            <td>
                                                                <p><fmt:formatNumber value="${t.price}" type="number" groupingUsed="true" /> VND</p>
                                                            </td>
                                                            <td>
                                                                <a href="booking_room_service_staff?roomId=${t.room.roomId}" class="btn btn-primary btn-sm m-1">
                                                                    Thêm dịch vụ
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    <c:set var="total" value="${booking.calculateTotalPriceNotEvent() + total}"></c:set> 
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <h5 class="float-right">Tổng tiền:  <fmt:formatNumber value="${total}" type="number" groupingUsed="true" />VND</h5>   
                            </div>
                            <a href="booking_room_staff_3" style="width: 100px; margin-right: 30px" class="btn btn-primary float-right">Tiếp</a>
                            <a style="margin-right: 10px" href="booking_room_staff?id=${requestScope.roomType.roomTypeId}" class="btn btn-primary float-right"> Quay lại</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--asdasdsadsadsadsa-->           
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
                                        <c:forEach items="${convenient}" var="c">
                                            <h9 style="font-weight: bold; margin-bottom: 20px">
                                                ${c.convenientName}
                                            </h9>
                                        </c:forEach>
                                    </div>
                                    <h4 style="margin-bottom: 20px; font-weight: bold">Chọn thêm dịch vụ khác</h4>
                                    <form action="booking_room_service_staff" method="post">
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
                                        <input type="submit" value="Thêm dịch vụ" class="btn btn-primary">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="closeModal()">Hủy</button>
                                    </form>                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
        <script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>
        <script src="Views/admin/assets/js/popper.min.js"></script>
        <script src="Views/admin/assets/js/bootstrap.min.js"></script>
        <script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="Views/admin/assets/plugins/raphael/raphael.min.js"></script>
        <script src="Views/admin/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="Views/admin/assets/plugins/datatables/datatables.min.js"></script>
        <script src="Views/admin/assets/js/script.js"></script>
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
                color: #0000FF;
            }
            .service-selection h4 {
                color: #0000FF;
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
                margin-top: 0px;
                background: azure;
                position: relative;
                height: auto;
            }
        </style>
    </body>
</html>