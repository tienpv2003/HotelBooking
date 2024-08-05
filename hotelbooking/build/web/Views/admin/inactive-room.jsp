<%@page import="java.util.ArrayList"%>
<%@page import="Models.RoomType" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

﻿<!DOCTYPE html>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
    <jsp:include page="layout/sidebar.jsp"></jsp:include>
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
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="mt-5">
                                    <h4 class="card-title float-left mt-2">Tất cả phòng đã dừng hoạt động</h4>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${not empty param.message}">
                        <div class="alert alert-success">${param.message}</div>
                    </c:if>  
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body booking_card">
                                    <div class="table-responsive">
                                        <table class="datatable table table-stripped table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>ID phòng</th>
                                                    <th>Tên phòng</th>
                                                    <th>Loại phòng</th>
                                                    <th>Trạng thái</th>
                                                    <th class="text-right">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${not empty roomList}">
                                                    <c:forEach var="room" items="${roomList}">
                                                        <tr>
                                                            <td>${room.roomId}</td>
                                                            <td>${room.roomName}</td>                                  
                                                            <td>${room.roomType.typeName}</td>
                                                            <td>
<div class="btn btn-sm ${room.status == 'active' ? 'bg-success-light' : 'bg-danger-light'} mr-2">${room.status}</div>
                                                            </td>
                                                            <td class="text-right">
                                                                <div class="dropdown dropdown-action">
                                                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v ellipse_color"></i>
                                                                    </a>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="update_room?id=${room.roomId}">
                                                                            <i class="fas fa-pencil-alt m-r-5"></i> Chỉnh sửa
                                                                            <a class="dropdown-item" href="room_detail?id=${room.roomId}">
                                                                                <i class="fas fa-info"></i> Thông tin chi tiết
                                                                            </a>
                                                                            <c:if test="${room.status == 'inactive'}">
                                                                                <a class="dropdown-item" href="#" onclick="confirmActivate(${room.roomId})" data-toggle="modal" data-target="#active_asset">
                                                                                   <i class="fas fa-check m-r-5"></i> Bật hoạt động
                                                                                </a>
                                                                            </c:if>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${empty roomList}">
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

                <!-- Modal for Active -->
                <div id="active_asset" class="modal fade delete-modal" role="dialog">
                    <form action="status_room" method="post">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-body text-center">
                                    <img src="Views/Login/img/logo-chot.jpg" alt="" width="50" height="46">
                                    <h3 class="delete_class">Bạn có chắc muốn bật hoạt động của phòng này?</h3>
                                    <input type="hidden" name="roomId" id="activeRoomId">
                                    <input type="hidden" name="status" value="active">
                                    <div class="m-t-20"> 
                                        <a href="#" class="btn btn-white" data-dismiss="modal">Đóng</a>
                                        <button type="submit" class="btn btn-danger">Bật hoạt động</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
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
            <script>


                                                                                    function confirmActivate(id) {
                                                                                        document.getElementById('activeRoomId').value = id;
                                                                                    }

            </script>
    </body>
</html>
