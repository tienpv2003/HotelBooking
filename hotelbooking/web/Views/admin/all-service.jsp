<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                                <h4 class="card-title float-left mt-2">Tất cả dịch vụ</h4>
                                <a href="create_service" class="btn btn-primary float-right veiwbutton">Thêm dịch vụ</a>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${not empty requestScope.msgInactiveService}">
                    <div class="alert alert-success" role="alert">
                        ${requestScope.msgInactiveService}
                    </div>
                </c:if>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-table">
                            <div class="card-body booking_card">
                                <div class="table-responsive">
                                    <table class="datatable table table-stripped table table-hover table-center mb-0">
                                        <thead>
                                            <tr>
                                                <th>Mã dịch vụ</th>
                                                <th>Tên dịch vụ</th>
                                                <th>Tiêu đề</th>
                                                <th>Giá dịch vụ</th>
                                                <th>Mô tả</th>
                                                <th>Image</th>
                                                <th>Trạng thái</th>
                                                <th class="text-right">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="i" items="${listServiceActive}">
                                                <tr>
                                                    <td>DV-${i.serviceId}</td>
                                                    <td>${i.nameService}</td>
                                                    <td>${i.titleService}</td>
                                                    <td><fmt:formatNumber value="${i.priceService}" type="number" groupingUsed="true" /> VND</td>
                                                    <td>${i.description}</td>
                                                    <td><img src="Views/client/img/${i.getImage()}" alt="Service Image" style="max-width: 100px; max-height: 100px;"></td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">${i.status}</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action">
                                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                                <i class="fas fa-ellipsis-v ellipse_color"></i>
                                                            </a>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <a class="dropdown-item" href="update_service?id=${i.serviceId}">
                                                                    <i class="fas fa-pencil-alt m-r-5"></i> Chỉnh sửa
                                                                </a>
                                                                <a class="dropdown-item" href="#" onclick="confirmInactiveService(${i.serviceId})">
                                                                    <i class="fas fa-trash-alt m-r-5"></i> Đóng dịch vụ
                                                                </a>
                                                               
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

    <!-- Confirm Inactive Service Modal -->
    <div id="confirmInactiveModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <img src="Views/Login/img/logo-chot.jpg" alt="" width="50" height="46">
                    <h3 class="delete_class">Bạn có chắc chắn muốn đóng dịch vụ này?</h3>
                    <div class="m-t-20">
                        <a href="#" class="btn btn-white" data-dismiss="modal">Hủy</a>
                        <a id="confirmInactiveButton" href="#" class="btn btn-danger">Đồng ý</a>
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
    <script>
        function confirmInactiveService(serviceId) {
            $('#confirmInactiveButton').attr('href', 'inactive_service?idService=' + serviceId);
            $('#confirmInactiveModal').modal('show');
        }

        
    </script>
</body>

</html>
