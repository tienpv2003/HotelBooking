<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thêm tiện ích vào Phòng</title>
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
                width: 100px;
                font-weight: normal;
                margin-right: 15px;
            }
            .form-group input, .form-group textarea, .form-group select {
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
                align-items: flex-start;
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
            .table-hover tbody tr:hover {
                background-color: #f5f5f5;
            }
            .table-hover tbody tr.selected {
                background-color: #007bff;
                color: white;
            }
            .left-column, .right-column {
                flex: 1;
                margin-right: 20px;
            }
            .right-column {
                margin-right: 0;
            }
            .table-form th, .table-form td {
                padding: 10px;
                vertical-align: middle;
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
                            <div class="col text-center">
                                <a href="list_room_convenient" class="btn float-left btn-primary mt-1" style="background-color: #007bff; width: 120px;">Quay lại</a>
                                <h3 class="page-title mt-2">Thêm Tiện ích vào Phòng</h3> 
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3 justify-content-center">
                        <div class="col-lg-10">
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
                        <div class="form-container">
                            <div class="left-column">
                                <table class="table table-hover" id="roomTable">
                                    <thead>
                                        <tr>
                                            <th>Mã phòng</th>
                                            <th>Loại Phòng</th>
                                            <th>Tên Phòng</th>
                                            <th>Giá Phòng</th>
                                            <th>Tiện ích đã có</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>MP-${roomConvenients.room.roomId}</td>
                                            <td>${roomConvenients.room.roomType.typeName}</td>
                                            <td>${roomConvenients.room.roomName}</td>
                                            <td>    <fmt:formatNumber value="${roomConvenients.room.roomType.roomTypePrice}"
                                                                  type="number" groupingUsed="true"/> VND</td>
                                            <td>
                                                <c:forEach var="convenient" items="${roomConvenients.conveniences}">
                                                    <c:if test="${not empty convenient}">
                                                        <div style="font-weight: bold">- ${convenient.convenientName}</div>
                                                    </c:if>
                                                    <c:if test="${empty convenient}">
                                                        <div style="font-weight: bold; color: red">Chưa có tiện ích</div>
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="right-column">
                                <div class="form-content">
                                    <form action="add_convenient_room" method="post">
                                        <input name="roomId" value="${roomConvenients.room.roomId}" hidden="">
                                        <table class="table-form">
                                            <thead>
                                                <tr>
                                                    <th><label for="convenients">Đổi Tiện ích</label></th>
                                                    <th><label class="display-block">Trạng thái</label></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <div id="convenients">
                                                            <c:forEach var="convenient" items="${convenients}">
                                                                <div class="form-check">
                                                                    <c:set var="isChecked" value="false" />
                                                                    <c:forEach var="rc" items="${roomConvenients.conveniences}">
                                                                        <c:if test="${convenient.convenientId == rc.convenientId}">
                                                                            <c:set var="isChecked" value="true" />
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <input class="form-check-input" type="checkbox" name="convenientId" value="${convenient.convenientId}" ${isChecked ? 'checked' : ''}>
                                                                    <label class="form-check-label">
                                                                        ${convenient.convenientName}
                                                                    </label>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </td>
                                                    <td style="display: flex">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="status" id="convenient_active" value="active" checked>
                                                            <label class="form-check-label" for="convenient_active"> Hoạt động </label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="status" id="convenient_inactive" value="inactive">
                                                            <label class="form-check-label" for="convenient_inactive"> Không hoạt động</label>
                                                        </div>  
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="status" id="convenient_process" value="process">
                                                            <label class="form-check-label" for="convenient_process"> Sửa chữa </label>
                                                        </div>                                                          
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="text-center">
                                                        <button type="submit" class="btn btn-primary buttonedit1 mt-4">Lưu Tiện ích</button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
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