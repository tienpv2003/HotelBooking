<%@page import="java.util.ArrayList" %>
<%@page import="Models.Customer" %>
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
                                <h4 class="card-title float-left mt-2">Khách Hàng</h4>
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
                                                <th>Mã Khách Hàng</th>
                                                <th>Tên</th>
                                                <th>Email</th>
                                                <th>Số điện thoại</th>
                                                <th>Địa chỉ</th>
                                                <th>Trạng thái</th>
                                                <th>Loại</th>
                                                <th class="text-right">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${not empty customers}">
                                            <c:forEach var="c" items="${customers}">
                                                <tr>
                                                    <td>KH-${c.customerId}</td>
                                                    <td>${c.firstName} ${c.lastName}</td>
                                                    <td>${c.email}</td>
                                                    <td>${c.phone}</td>
                                                    <td>${c.address}</td>
                                                    <td>
                                                        <div class="actions">
                                                            <div class="btn btn-sm ${c.status == 'active' ? 'bg-success-light' : 'bg-danger-light'} mr-2">${c.status}</div>
                                                        </div>
                                                    </td>
                                                    <td>${c.typeCustomer.typeCustomerName}</td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action">
                                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <a href="#" class="dropdown-item" data-cusid="${c.customerId}" data-status="${c.status}" onclick="confirmDelete(this.getAttribute('data-cusid'), this.getAttribute('data-status'))">
                                                                    <c:if test="${c.status == 'active'}">
                                                                        <i class="fas fa-trash-alt m-r-5"></i> Khóa tài khoản
                                                                    </c:if>
                                                                    <c:if test="${c.status == 'inactive'}">
                                                                        <i class="fas fa-trash-alt m-r-5"></i> Mở khóa tài khoản
                                                                    </c:if>
                                                                </a>

                                                                <a class="dropdown-item" href="add_staff?customerEmail=${c.email}"><i class="fas fa-pencil-alt m-r-5"></i> Thêm nhân viên</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty customers}">
                                            <tr>
                                                <td colspan="8" class="text-center">Không có Khách Hàng</td>
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
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabel">Xác nhận thay đổi</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc chắn muốn đổi trạng thái tài khoản này không?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                        <a class="btn btn-danger" id="confirmDeleteBtn">Có</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>
<script src="Views/admin/assets/js/popper.min.js"></script>
<script src="Views/admin/assets/js/bootstrap.min.js"></script>
<script src="Views/admin/assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="Views/admin/assets/plugins/datatables/datatables.min.js"></script>
<script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="Views/admin/assets/plugins/raphael/raphael.min.js"></script>
<script src="Views/admin/assets/js/script.js"></script>
<script>
                                                                    function confirmDelete(cusId, status) {
                                                                        document.getElementById('confirmDeleteBtn').href = 'status_customer?cusId=' + cusId + '&status=' + status; // Giả sử bạn muốn chuyển trạng thái thành Inactive
                                                                        var myModal = new bootstrap.Modal(document.getElementById('deleteModal'));
                                                                        myModal.show();
                                                                    }

</script>



</body>

</html>