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
                                <h4 class="card-title float-left mt-2">Tất cả sự kiện đã hủy</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${not empty requestScope.msgInactive}">
                    <div class="alert alert-success" role="alert">
                        ${requestScope.msgInactive}
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
                                                <th>Mã sự kiện</th>
                                                <th>Tiêu đề</th>
                                                <th>Ảnh</th>
                                                <th>Ngày bắt đầu</th>
                                                <th>Ngày kết thúc</th>
                                                <th>Tên sự kiện</th>
                                                <th>Giảm giá</th>
                                                <th>Miêu tả</th>
                                                <th>Trạng thái</th>
                                                <th class="text-right">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="i" items="${listEventInactive}">
                                                <tr>
                                                    <td>SK-${i.eventId}</td>
                                                    <td>${i.titleEvent}</td>
                                                    <td><img src="Views/client/img/${i.getImage()}" alt="Service Image" style="max-width: 100px; max-height: 100px;"></td>
                                                    <td>${i.startDate}</td>
                                                    <td>${i.endDate}</td>
                                                    <td>${i.detail}</td>
                                                    <td>${i.discountPercent}%</td>
                                                    <td>${i.description}</td>
                                                    <td>
                                                        <div class="actions">
                                                              <c:if test="${i.status == 'inactive'}">
                                                                    <div class="btn btn-sm bg-danger-light mr-2">${i.status}</div>
                                                                </c:if>
                                                        </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action">
                                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <a class="dropdown-item" href="update_event?id=${i.eventId}">
                                                                    <i class="fas fa-pencil-alt m-r-5"></i> Chỉnh sửa
                                                                </a>
                                                                <a class="dropdown-item" href="#" onclick="confirmActiveEvent(${i.eventId})">
                                                                    <i class="fas fa-trash-alt m-r-5"></i> Mở sự kiện
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

    <!-- Confirm Active Event Modal -->
    <div id="confirmActiveModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <img src="Views/Login/img/logo-chot.jpg" alt="" width="50" height="46">
                    <h3 class="delete_class">Bạn có chắc chắn muốn mở sự kiện này?</h3>
                    <div class="m-t-20">
                        <a href="#" class="btn btn-white" data-dismiss="modal">Hủy</a>
                        <a id="confirmActiveButton" href="#" class="btn btn-danger">Đồng ý</a>
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
        function confirmActiveEvent(eventId) {
            $('#confirmActiveButton').attr('href', 'active_event?inEventId=' + eventId);
            $('#confirmActiveModal').modal('show');
        }
    </script>
</body>

</html>
