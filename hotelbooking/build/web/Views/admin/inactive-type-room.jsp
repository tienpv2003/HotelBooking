<%@page import="java.util.ArrayList"%>
<%@page import="Models.RoomType" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

﻿<!DOCTYPE html>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
    <jsp:include page="layout/sidebar.jsp"></jsp:include>
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col">
                            <div class="mt-5">
                                <h4 class="card-title float-left mt-2">Tất cả loại phòng dừng hoạt động</h4>
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
                                             <th>ID loại phòng</th>
                                            <th>Tên loại phòng</th>
                                             <th>Ảnh</th>
                                            <th>Tiêu đề</th>
                                            <th>Số lượng</th>
                                            <th>Giá</th>
                                            <th>Trạng thái</th>
                                            <th class="text-right">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${not empty roomTypeList}">
                                            <c:forEach var="c" items="${roomTypeList}">
                                                <tr>
                                                    <td>${c.roomTypeId}</td>
                                                    <td>${c.typeName}</td>
                                                    <td><img src="Views/client/img/${c.getRoomtype_img()}" alt="Service Image" style="max-width: 100px; max-height: 100px;"></td>
                                                     <td>${c.titleDescripsion}</td>
                                                     <td>${c.quantity}</td>
                                                     <td>${c.roomTypePrice}</td>
                                                    <td>
                                                        <div class="btn btn-sm ${c.status == 'active' ? 'bg-success-light' : 'bg-danger-light'} mr-2">${c.status}</div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action">
                                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                                <i class="fas fa-ellipsis-v ellipse_color"></i>
                                                            </a>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <a class="dropdown-item" href="edit-room.html">
                                                                    <i class="fas fa-pencil-alt m-r-5"></i> Chỉnh sửa
                                                                </a>

                                                                <c:if test="${c.status == 'inactive'}">
                                                                    <a class="dropdown-item" href="#" onclick="confirmActivate(${c.roomTypeId})" data-toggle="modal" data-target="#active_asset">
                                                                        <i class="fas fa-check"></i> Bật hoạt động
                                                                    </a>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty roomTypeList}">
                                            <tr>
                                                <td colspan="8" class="text-center">Không có loại phòng nào</td>
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

        <div id="active_asset" class="modal fade delete-modal" role="dialog">
            <form action="status_room_type" method="post">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body text-center">
                            <img src="Views/Login/img/logo-chot.jpg" alt="" width="50" height="46">
                            <h3 class="delete_class">Bạn có chắc muốn bật hoạt động của loại phòng này ?</h3>
                            <input type="hidden" name="roomTypeId" id="activeRoomTypeId">
                            <input type="hidden" name="status" value="active">
                            <div class="m-t-20">
                                <a href="#" class="btn btn-white" data-dismiss="modal">Hủy</a>
                                <button type="submit" class="btn btn-danger">Đồng ý</button>
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
                                                                        function confirmDeactivate(id) {
                                                                            document.getElementById('inactiveRoomTypeId').value = id;
                                                                        }

                                                                        function confirmActivate(id) {
                                                                            document.getElementById('activeRoomTypeId').value = id;
                                                                        }
    </script>
</body>
</html>
