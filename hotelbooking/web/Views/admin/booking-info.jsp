<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mẫu Bảng điều khiển Khách sạn</title>
        <link rel="shortcut icon" type="image/x-icon" href="Views/admin/assets/img/favicon.png">
        <link rel="stylesheet" href="Views/admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="Views/admin/assets/css/feathericon.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="Views/admin/assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="Views/admin/assets/css/style.css">
        <style>
            .no-customers-message {
                font-size: 16px;
                color: #333;
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            .alert-success {
                font-size: 16px;
                padding: 15px;
                border: 1px solid #c3e6cb;
                border-radius: 5px;
                background-color: #d4edda;
                color: #155724;
            }
        </style>
    </head>

    <body>
        <div class="main-wrapper">
            <%@include file="layout/header.jsp"%>
            <%@include file="layout/sidebar.jsp"%>
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title mt-5">Thêm Đặt phòng</h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form
                                <c:choose>
                                    <c:when test="${checkNew != null}">
                                        action="booking_info_new"
                                    </c:when>
                                    <c:otherwise>
                                        action="booking_info_old"
                                    </c:otherwise>
                                </c:choose> method="post">
                                <div class="row formtype">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control" name="email" <c:if test="${email != null}"> value="${email}"</c:if> required>
                                            <p style="color: red"><c:if test="${messError != null}">${messError}</c:if> </p>
                                            </div>
                                        </div>
                                    <c:if test="${checkNew != null}">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Họ</label>
                                                <input type="text" class="form-control" name="lastName" <c:if test="${lastName != null}"> value="${lastName}"</c:if> required>
                                                <p style="color: red"><c:if test="${errLastName != null}">${errLastName}</c:if> </p>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Tên</label>
                                                    <input type="text" class="form-control" name="firstName" <c:if test="${firstName != null}"> value="${firstName}"</c:if> required>
                                                <p style="color: red"><c:if test="${errFirstName != null}">${errFirstName}</c:if> </p>
                                                </div>
                                            </div>
                                    </c:if>
                                    <c:choose>
                                        <c:when test="${checkNew != null}">
                                            <div class="col-md-4">
                                                <input type="submit" value="Tạo khách hàng mới" class="btn btn-primary mt-4">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-md-4">
                                                <input type="submit" value="Tìm kiếm khách hàng" class="btn btn-primary mt-4">
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </form>
                        </div>
                    </div>
                    <c:if test="${addSuscess != null}">
                        <div class="alert alert-success text-center mt-3">
                            ${addSuscess}
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.cusBooking != null}">
                        <c:set value="${sessionScope.cusBooking}" var="c" />
                        <table class="datatable table table-stripped table-hover table-center mb-0">
                            <thead>
                                <tr>
                                    <th>Mã Khách Hàng</th>
                                    <th>Tên</th>
                                    <th>Email</th>
                                    <th>Số điện thoại</th>
                                    <th>Địa chỉ</th>
                                    <th>Trạng thái</th>
                                    <th></th>
                                    <th>Đặt phòng</th>
                                </tr>
                            </thead>
                            <tbody>
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
                                    <td class="text-right">
                                        <c:choose>
                                            <c:when test="${c.status == 'inactive'}">
                                                <a href="all_custumer" class="btn btn-primary btn-sm m-1 bg-danger">
                                                    Mở khóa
                                                </a>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <button type="submit"  class="btn btn-primary btn-sm m-1" onclick="toggleRoomList()">Hiển thị</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${notExist != null}">
                        <div class="no-customers-message text-center mt-3">
                            Khách hàng không tồn tại
                        </div>
                    </c:if>
                </div>
                <form action="booking_room_staff" method="post">
                    <div class="row" id="roomListForm" style="display: none;">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body booking_card">
                                    <div class="table-responsive">
                                        <div class="col-md-8">
                                            <div class="card mb-3">
                                                <div class="card-body">

                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Ngày nhận phòng</h6>
                                                        </div>
                                                        <div class="col-sm-9 text-secondary">
                                                            <input type="date" class="form-control" name="startDate" id="datepicker" required>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Ngày trả phòng</h6>
                                                        </div>
                                                        <div class="col-sm-9 text-secondary">
                                                            <input type="date" class="form-control" name="endDate" id="datepicker" required>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <table class="datatable table table-stripped table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Loại phòng</th>
                                                    <th>Ảnh phòng</th>
                                                    <th>Phòng trống</th>
                                                    <th>Giá phòng</th>
                                                    <th>Số lượng</th>                                     
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${not empty listTypeRoom}">
                                                    <c:forEach var="r" items="${listTypeRoom}">
                                                        <tr>
                                                            <td>${r.typeName}</td>
                                                            <td><img src="Views/client/img/${r.roomtype_img}" width="150" height="90" alt="${r.typeName}"/></td>
                                                            <td>${r.quantity} Phòng</td>
                                                            <td>
                                                                <fmt:formatNumber value="${r.roomTypePrice}" type="number" groupingUsed="true"/> VND
                                                            </td>
                                                            <td class="text-right">
                                                                <div class="left_room_title floatright">
                                                                    <input type="number" name="type${r.roomTypeId}" value="0" min="0" max="${r.quantity}">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                <input type="submit" class="btn btn-primary m-1" name="Submit" value="Tiếp theo"/>
                                            </c:if>
                                            <c:if test="${empty listTypeRoom}">
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
                </form>
            </div>
        </div>
        <script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>
        <script src="Views/admin/assets/js/popper.min.js"></script>
        <script src="Views/admin/assets/js/bootstrap.min.js"></script>
        <script src="Views/admin/assets/js/moment.min.js"></script>
        <script src="Views/admin/assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="Views/admin/assets/plugins/raphael/raphael.min.js"></script>
        <script src="Views/admin/assets/js/script.js"></script>
        <script>
                                            $(function () {
                                                $('#datetimepicker3').datetimepicker({
                                                    format: 'LT'
                                                });
                                            });


        </script>
        <script>
            function toggleRoomList() {
                var roomListForm = document.getElementById("roomListForm");
                if (roomListForm.style.display === "none" || roomListForm.style.display === "") {
                    roomListForm.style.display = "block";
                } else {
                    roomListForm.style.display = "none";
                }
            }
        </script>

    </body>

</html>