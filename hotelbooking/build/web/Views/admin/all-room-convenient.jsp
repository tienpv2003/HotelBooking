<%@page import="java.util.ArrayList"%>
<%@page import="Models.RoomType" %>
<%@page import="Models.RoomConvenient" %>
<%@page import="Models.Convenient" %>
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
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="mt-5">
                                    <a href="list_convenient" class="btn btn-primary mt-1" style="background-color: #007bff; width: 120px;">Quay lại</a>
                                    <h4 class="card-title center-block mt-2">Chọn Phòng thêm Tiện ích</h4>
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
                                                    <th>Mã Phòng</th>
                                                    <th>Tên Phòng</th>
                                                    <th>Loại Phòng</th>
                                                    <th>Giá hiện tại</th>
                                                    <th>Tiện ích đã có</th>
                                                    <th>Trạng thái</th>
                                                    <th class="text-right">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${not empty roomConvenients}">
                                                    <c:forEach var="rc" items="${roomConvenients}">
                                                        <tr>
                                                            <td>MP-${rc.room.roomId}</td>
                                                            <td>${rc.room.roomName}</td>
                                                            <td>${rc.room.roomType.typeName}</td>       
                                                            <td><fmt:formatNumber value="${rc.room.roomType.roomTypePrice}" type="number" groupingUsed="true"/> VND</td>
                                                            <td>
                                                                <c:forEach var="convenient" items="${rc.conveniences}">
                                                                    <c:if test="${not empty convenient}">
                                                                        <c:if test="${convenient.status != 'inactive'}">
                                                                            <div style="font-weight: bold">- ${convenient.convenientName}</div>
                                                                        </c:if>
                                                                    </c:if>
                                                                    <c:if test="${empty convenient}">
                                                                        <div style="font-weight: bold; color: red">Chưa có tiện ích</div>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>

                                                            <td>
                                                                <c:if test="${rc.status == 'active'}">
                                                                    <div class="btn btn-sm bg-success-light mr-2">${rc.status}</div>
                                                                </c:if>
                                                                <c:if test="${rc.status == 'inactive'}">
                                                                    <div class="btn btn-sm bg-danger-light mr-2">${rc.status}</div>
                                                                </c:if>
                                                                <c:if test="${rc.status == 'process'}">
                                                                    <div class="btn btn-sm bg-primary-light mr-2">${rc.status}</div>
                                                                </c:if>
                                                            </td>
                                                            <td class="">
                                                                <a class="btn btn-primary float-right" href="add_convenient_room?roomId=${rc.room.roomId}">
                                                                    Chọn phòng 
                                                                </a> 
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${empty roomConvenients}">
                                                    <tr>
                                                        <td colspan="8" class="text-center">Không có phòng nào</td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
    </body>
</html>
