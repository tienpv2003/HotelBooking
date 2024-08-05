<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Tất cả tiện ích</title>
        <link rel="stylesheet" href="Views/admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="Views/admin/assets/css/select2.min.css">
        <link rel="stylesheet" href="Views/admin/assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="Views/admin/assets/css/style.css">
        <style>
            .form-group {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }
            .form-group label {
                width: 150px;
                font-weight: normal;
                margin-right: 15px;
            }
            .form-group input, .form-group textarea {
                flex: 1;
            }
            .form-check-label {
                margin-right: 15px;
            }
            .page-wrapper {
                padding: 20px;
            }
            .custom-file-label::after {
                content: "Tải lên";
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }
            .form-container {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }
            .form-content {
                width: 100%;
                max-width: 700px;
            }
            .custom-file {
                flex: 1;
            }
            .custom-file input {
                width: 100%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="layout/header.jsp"></jsp:include>
        <jsp:include page="layout/sidebar.jsp"></jsp:include>
            <div class="page-wrapper">
                <div class="content mt-5">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col text-center" style="display: flex; justify-content: space-between; align-items: center">
                                <a href="HomeAdminController" class="btn btn-primary mt-1" style="background-color: #007bff; width: 120px;">Quay lại</a>
                                <h3 class="page-title mt-2">Tất cả Tiện ích</h3> 
                                <a href="add_convenient" class="btn btn-primary veiwbutton">Thêm Tiện ích</a>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3 justify-content-center">
                        <div class="col-lg-8">
                        <c:if test="${not empty requestScope.successMess}">
                            <div class="alert alert-success" role="alert">
                                ${requestScope.successMess}
                            </div>
                        </c:if>
                        <c:if test="${not empty requestScope.errorMess}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.errorMess}
                            </div>
                        </c:if>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên tiện ích</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="convenient" items="${requestScope.listConvenient}">
                                    <tr>
                                        <td>TI-${convenient.convenientId}</td>
                                        <td>${convenient.convenientName}</td>
                                        <td>
                                            <c:if test="${convenient.status == 'active'}">
                                                <div class="btn btn-sm bg-success-light mr-2">${convenient.status}</div>
                                            </c:if>
                                            <c:if test="${convenient.status == 'inactive'}">
                                                <div class="btn btn-sm bg-danger-light mr-2">${convenient.status}</div>
                                            </c:if>
                                            <c:if test="${convenient.status == 'process'}">
                                                <div class="btn btn-sm bg-primary-light mr-2">${convenient.status}</div>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a href="update_convenient?id=${convenient.convenientId}" class="btn btn-primary">Cập nhật</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>
        <script src="Views/admin/assets/js/popper.min.js"></script>
        <script src="Views/admin/assets/js/bootstrap.min.js"></script>
        <script src="Views/admin/assets/js/moment.min.js"></script>
        <script src="Views/admin/assets/js/select2.min.js"></script>
        <script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="Views/admin/assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="Views/admin/assets/plugins/datatables/datatables.min.js"></script>
        <script src="Views/admin/assets/js/script.js"></script>
    </body>
</html>
