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
                                <h4 class="card-title float-left mt-2">Tất cả nhân viên</h4>
                                <a href="add_staff" class="btn btn-primary float-right veiwbutton">Thêm nhân viên</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-table">
                            <div class="card-body booking_card">
                                <div class="table-responsive">
                                    <table class="datatable table table-stripped table table-hover table-center mb-0">
                                        <thead>
                                            <tr>
                                                <th>ID nhân viên</th>
                                                <th>Email</th>
                                                <th>Vai trò</th>
                                                <th>Trạng thái</th>
                                                <th class="text-right">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="staff" items="${staffList}">
                                                <tr>
                                                    <td>ST-${staff.staff_id}</td>
                                                    <td>${staff.email}</td>
                                                    <td>${staff.staff_type_id.type}</td>
                                                    <td>${staff.status}</td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action">
                                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <!--<a class="dropdown-item" href="updatestaff"><i class="fas fa-pencil-alt m-r-5"></i>Chỉnh sửa</a>-->
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#banModal" onclick="setStaffIdToBan(${staff.staff_id})"><i class="fas fa-trash-alt m-r-5"></i>Cấm</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
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

    <!-- Modal Xác Nhận Cấm Tài Khoản -->
    <div id="banModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Cấm Tài Khoản</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Bạn có chắc chắn muốn cấm tài khoản này không?</p>
                </div>
                <div class="modal-footer">
                    <form action="ban" method="post">
                        <input type="hidden" name="staffId" id="staffIdToBan" value="">
                        <button type="submit" class="btn btn-danger">Cấm</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                    </form>
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

    <script>
        function setStaffIdToBan(staffId) {
            document.getElementById('staffIdToBan').value = staffId;
        }
    </script>
</body>

</html>