<%@page import="java.util.ArrayList" %>
<%@page import="Models.Review" %>
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
                                <h4 class="card-title float-left mt-2">Tất cả đánh giá</h4>
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
                                                <th>Mã Đánh giá</th>
                                                <th>Người đánh giá</th>
                                                <th>Nội dung</th>
                                                <th>Trạng thái</th>
                                                <th class="text-right">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="i" items="${listReview}">
                                            <tr>
                                                <td>ĐG-${i.reviewId}</td>
                                                <td>${i.customer.firstName} ${i.customer.lastName}</td>
                                                <td>${i.description}</td>
                                                <td>
                                                    <div class="actions">
                                                        <div class="btn btn-sm ${i.status == 'active' ? 'bg-success-light' : 'bg-danger-light'} mr-2">${i.status}</div>
                                                    </div>
                                                </td>
                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action">
                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                            <i class="fas fa-ellipsis-v ellipse_color"></i>
                                                        </a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a href="#" class="dropdown-item" data-reviewId="${i.reviewId}" data-status="${i.status}" onclick="confirmDelete(this.getAttribute('data-reviewId'), this.getAttribute('data-status'))">
                                                                <c:if test="${i.status == 'active'}">
                                                                    <i class="fas fa-trash-alt m-r-5"></i> Ẩn đánh giá
                                                                </c:if>
                                                                <c:if test="${i.status == 'inactive'}">
                                                                    <i class="fas fa-trash-alt m-r-5"></i> Hiện đánh giá
                                                                </c:if>
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

<!-- Confirm Inactive Event Modal -->
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
                Bạn có chắc chắn muốn đổi trạng thái đánh giá này không?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                <a class="btn btn-danger" id="confirmDeleteBtn">Có</a>
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
                                                                function confirmDelete(reviewId, status) {
                                                                    document.getElementById('confirmDeleteBtn').href = 'status_review?reviewId=' + reviewId + '&status=' + status; // Giả sử bạn muốn chuyển trạng thái thành Inactive
                                                                    var myModal = new bootstrap.Modal(document.getElementById('deleteModal'));
                                                                    myModal.show();
                                                                }

</script>
</body>

</html>
