<%@page import="java.util.ArrayList"%>
<%@page import="Models.RoomType" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                    <h4 class="card-title float-left mt-2">Tất cả phòng</h4>
                                    <a href="create_room" class="btn btn-primary float-right veiwbutton">Thêm phòng</a>
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
                                                                <c:if test="${room.status == 'active'}">
                                                                    <div class="btn btn-sm bg-success-light mr-2">${room.status}</div>
                                                                </c:if>
                                                                <c:if test="${room.status == 'inactive'}">
                                                                    <div class="btn btn-sm bg-danger-light mr-2">${room.status}</div>
                                                                </c:if>
                                                                <c:if test="${room.status == 'booked'}">
                                                                    <div class="btn btn-sm bg-primary-light mr-2">${room.status}</div>
                                                                </c:if>

                                                            </td>
                                                            <td class="text-right">
                                                                <div class="dropdown dropdown-action">

                                                                    <c:if test="${room.status == 'active'}">
                                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                                            <i class="fas fa-ellipsis-v ellipse_color"></i>
                                                                        </a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                            <a class="dropdown-item" href="update_room?id=${room.roomId}">
                                                                                <i class="fas fa-pencil-alt m-r-5"></i> Chỉnh sửa
                                                                            </a>
                                                                            <a class="dropdown-item" href="room_detail?id=${room.roomId}">
                                                                                <i class="fas fa-info-circle"></i> Thông tin chi tiết
                                                                            </a>
                                                                            <a class="dropdown-item" href="#" onclick="confirmDeactivate(${room.roomId})" data-toggle="modal" data-target="#inactive_asset">
                                                                                <i class="fas fa-stop"></i> Dừng hoạt động
                                                                            </a>
                                                                            <a class="dropdown-item" href="#" onclick="confirmDelete(${room.roomId})" data-toggle="modal" data-target="#delete_asset">
                                                                                <i class="fas fa-trash-alt m-r-5"></i> Xóa
                                                                            </a>
                                                                        </c:if>
                                                                        <c:if test="${room.status == 'active'}">
                                                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                                                <i class="fas fa-ellipsis-v ellipse_color"></i>
                                                                            </a>
                                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                                <a class="dropdown-item" href="update_room?id=${room.roomId}">
                                                                                    <i class="fas fa-pencil-alt m-r-5"></i> Chỉnh sửa
                                                                                </a>
                                                                                <a class="dropdown-item" href="room_detail?id=${room.roomId}">
                                                                                    <i class="fas fa-info-circle"></i> Thông tin chi tiết
                                                                                </a>
                                                                                <a class="dropdown-item" href="#" onclick="confirmDeactivate(${room.roomId})" data-toggle="modal" data-target="#inactive_asset">
                                                                                    <i class="fas fa-stop"></i> Dừng hoạt động
                                                                                </a>
                                                                                <a class="dropdown-item" href="#" onclick="confirmDelete(${room.roomId})" data-toggle="modal" data-target="#delete_asset">
                                                                                    <i class="fas fa-trash-alt m-r-5"></i> Xóa
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${room.status == 'inactive'}">
                                                                                <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                                                    <i class="fas fa-ellipsis-v ellipse_color"></i>
                                                                                </a>
                                                                                <div class="dropdown-menu dropdown-menu-right">
                                                                                    <a class="dropdown-item" href="update_room?id=${room.roomId}">
                                                                                        <i class="fas fa-pencil-alt m-r-5"></i> Chỉnh sửa
                                                                                    </a>
                                                                                    <a class="dropdown-item" href="room_detail?id=${room.roomId}">
                                                                                        <i class="fas fa-info-circle"></i> Thông tin chi tiết
                                                                                    </a>
                                                                                    <a class="dropdown-item" href="#" onclick="confirmActivate(${room.roomId})" data-toggle="modal" data-target="#active_asset">
                                                                                        <i class="fas fa-check"></i>Bật hoạt động
                                                                                    </a>
                                                                                    <a class="dropdown-item" href="#" onclick="confirmDelete(${room.roomId})" data-toggle="modal" data-target="#delete_asset">
                                                                                        <i class="fas fa-trash-alt m-r-5"></i> Xóa
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

                                                        <!-- Modal for Inactive -->
                                                        <div id="inactive_asset" class="modal fade delete-modal" role="dialog">
                                                            <form action="all_room" method="post">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body text-center">
                                                                            <img src="Views/Login/img/logo-chot.jpg" alt="" width="50" height="46">
                                                                            <h3 class="delete_class">Bạn có chắc muốn dừng hoạt động của phòng này?</h3>
                                                                            <input type="hidden" name="roomId" id="inactiveRoomId">
                                                                            <input type="hidden" name="status" value="inactive">
                                                                            <div class="m-t-20"> 
                                                                                <a href="#" class="btn btn-white" data-dismiss="modal">Đóng</a>
                                                                                <button type="submit" class="btn btn-danger">Dừng hoạt động</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>

                                                        <!-- Modal for Active -->
                                                        <div id="active_asset" class="modal fade delete-modal" role="dialog">
                                                            <form action="all_room" method="post">
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

                                                        <!-- Modal for Delete -->
                                                        <div id="delete_asset" class="modal fade delete-modal" role="dialog">
                                                            <form action="all_room" method="post">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body text-center">
                                                                            <img src="Views/Login/img/logo-chot.jpg" alt="" width="50" height="46">
                                                                            <h3 class="delete_class">Bạn có chắc muốn xóa phòng này?</h3>
                                                                            <input type="hidden" name="roomId" id="deleteRoomId">
                                                                            <input type="hidden" name="action" value="delete">    
                                                                            <div class="m-t-20"> 
                                                                                <a href="#" class="btn btn-white" data-dismiss="modal">Đóng</a>
                                                                                <button type="submit" class="btn btn-danger">Xóa</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
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
                                                        <script>
                                                                                        function confirmDeactivate(id) {
                                                                                            document.getElementById('inactiveRoomId').value = id;
                                                                                        }

                                                                                        function confirmActivate(id) {
                                                                                            document.getElementById('activeRoomId').value = id;
                                                                                        }
                                                                                        function confirmDelete(id) {
                                                                                            document.getElementById('deleteRoomId').value = id;
                                                                                        }
                                                        </script>
                                                        </body>
                                                        </html>