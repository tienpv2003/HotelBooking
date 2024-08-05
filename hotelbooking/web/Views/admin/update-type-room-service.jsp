<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật dịch vụ vào loại phòng</title>
    <style>
        .service-options {
            display: flex;
            flex-wrap: wrap;
        }

        .service-option {
            width: 50%;
            margin-bottom: 10px;
        }

        .service-option input {
            margin-right: 5px;
        }
    </style>
    <script>
        function loadServicesForRoomType() {
            var roomTypeId = document.getElementById("roomTypeId").value;
            window.location.href = "update_type_room_service?roomTypeId=" + roomTypeId;
        }
    </script>
</head>
<body>
    <jsp:include page="layout/header.jsp"></jsp:include>
    <jsp:include page="layout/sidebar.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content mt-5">
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col">
                        <h3 class="page-title mt-2">Thêm dịch vụ vào loại phòng</h3>
                    </div>
                </div>
            </div>
            <c:if test="${not empty param.message1}">
                <div class="alert alert-danger">${param.message1}</div>
            </c:if>
            <c:if test="${not empty param.message}">
                <div class="alert alert-success">${param.message}</div>
            </c:if>
            <div class="row mt-3">
                <div class="col-lg-12">
                    <form action="update_type_room_service" method="post">
                        <div class="row formtype">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Tên loại phòng</label>
                                    <select class="form-control" name="roomTypeId" id="roomTypeId" required onchange="loadServicesForRoomType()">
                                        <c:forEach var="roomType" items="${roomTypeList}">
                                            <option value="${roomType.roomTypeId}"
                                                <c:if test="${roomType.roomTypeId == selectedRoomTypeId}">selected</c:if>>
                                                ${roomType.typeName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Dịch vụ</label>
                                    <div class="service-options">
                                        <c:forEach var="service" items="${serviceList}">
                                            <div class="service-option">
                                                <input type="checkbox" name="services" value="${service.serviceId}"
                                                    <c:if test="${selectedServiceIds.contains(service.serviceId)}">checked</c:if>>
                                                ${service.nameService}
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button style="margin-left: 10px" type="submit" class="btn btn-primary buttonedit1 mt-4">Cập nhật</button>
                    </form>
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
