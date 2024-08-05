<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mẫu Bảng điều khiển Khách sạn</title>
        <link rel="shortcut icon" type="image/x-icon" href="Views/admin/assets/img/favicon.png">
        <link rel="stylesheet" href="Views/admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="Views/admin/assets/css/feathericon.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="Views/admin/assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="Views/admin/assets/css/style.css"> 
        <style>
            body {
                margin-top: 20px;
                color: #1a202c;
                text-align: left;
                background-color: #e2e8f0;
            }
            .main-body {
                padding: 15px;
            }
            .card {
                box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0, 0, 0, .125);
                border-radius: .25rem;
            }
            .card-body {
                flex: 1 1 auto;
                min-height: 1px;
                padding: 1rem;
            }
            .gutters-sm {
                margin-right: -8px;
                margin-left: -8px;
            }
            .gutters-sm > .col, .gutters-sm > [class*=col-] {
                padding-right: 8px;
                padding-left: 8px;
            }
            .mb-3, .my-3 {
                margin-bottom: 1rem !important;
            }
            .bg-gray-300 {
                background-color: #e2e8f0;
            }
            .h-100 {
                height: 100% !important;
            }
            .shadow-none {
                box-shadow: none !important;
            }
            .text-right {
                text-align: right;
            }
        </style>
    </head>
    <body>
        <div class="main-wrapper">
            <%@include file="layout/header.jsp"%>
            <%@include file="layout/sidebar.jsp"%>
            <div class="container">
                <div class="main-body">

                    <!-- Breadcrumb -->
                    <nav aria-label="breadcrumb" class="main-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0)">User</a></li>
                            <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                        </ol>
                    </nav>
                    <!-- /Breadcrumb -->
                    <form action="booking_room_staff" method="post">
                        <c:if test="${not empty messErr}">
                            <p class="alert alert-danger">${messErr}</p>
                        </c:if>
                        <div class="row gutters-sm">
                            <c:set value="${sessionScope.cusBooking}" var="c" />
                            <c:set value="${roomType}" var="t"></c:set>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="d-flex flex-column align-items-center text-center">
                                                <img src="Views/client/img/${t.roomtype_img}" alt="Admin" width="150">
                                            <div class="mt-3">
                                                <h4>${t.typeName}</h4>
                                                <span class="price floatright margin-left-15">
                                                    (<fmt:formatNumber value="${t.roomTypePrice}" type="number" groupingUsed="true"/> VND/Đêm)
                                                </span>
                                                <p class="text-muted font-size-sm">Khách sạn Hola</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card mt-3">
                                    <h5 style="margin-left: 20px;margin-top: 10px">Dịch vụ miễn phí theo phòng</h5>
                                    <c:forEach items="${t.listService}" var="s">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                                <h6 class="mb-0"><i class="fas fa-check"></i> ${s.nameService}</h6>
                                            </li>
                                        </ul>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Tên khách hàng</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                ${c.firstName} ${c.lastName}
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Ngày nhận phòng</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <input type="date" class="form-control" name="startDate" id="datepicker" required>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Ngày trả phòng</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <input type="date" class="form-control" name="endDate" id="datepicker" required>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Số lượng</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <select class="form-control" name="roomNumber" id="room">
                                                    <c:forEach var="i" begin="1" end="${getNumberRoomActive}">
                                                        <option value="${i}">${i} phòng</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-12 text-right">
                                                <input  type="hidden" name="id" value="${t.roomTypeId}"/>
                                               
                                                <div class="form-buttons">
                                                    <button type="button" onclick="cancelEdit()" class="btn btn-info">Quay lại</button>
                                                     <button type="submit" class="btn btn-info">Đặt phòng</button>
                                                </div>
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
        <script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>
        <script src="Views/admin/assets/js/popper.min.js"></script>
        <script src="Views/admin/assets/js/bootstrap.min.js"></script>
        <script src="Views/admin/assets/js/moment.min.js"></script>
        <script src="Views/admin/assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="Views/admin/assets/plugins/raphael/raphael.min.js"></script>
        <script src="Views/admin/assets/js/script.js"></script>
    </body>
    
    <script>
        function cancelEdit() {
                                window.location.href = 'booking_info_old';
                            }
    </script>
</html>
