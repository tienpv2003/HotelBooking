<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <link rel="stylesheet" href="Views/admin/assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" type="text/css" href="Views/admin/assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="Views/admin/assets/css/style.css"> 
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }

        .page-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            margin-top: 90px; /* Adjust this value based on the height of your header */
        }

        .page-header {
            margin-bottom: 20px;
        }

        h3.page-title {
            text-align: center;
            margin-bottom: 20px;
        }

        form .form-group {
            margin-bottom: 20px;
        }

        form .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form .custom-file {
            display: flex;
            align-items: center;
        }

        form .custom-file-input {
            margin-right: 10px;
        }

        form .custom-file-label {
            flex-grow: 1;
        }

        form .form-check-inline {
            margin-right: 20px;
            margin-left: 5px;
        }

        button.btn-primary {
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        button.btn-primary:hover {
            background-color: #218838;
        }

        button.btn-primary.buttonedit1 {
            background-color: #009688;
            margin-top: 20px;
            width: 175px;
        }

        button.btn-primary.buttonedit1:hover {
            background-color: #0069d9;
        }
.alert {
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }

        .page-wrapper>.content {
            padding: 1.875rem 1.875rem 0;
            margin-top: 90px;
            margin-bottom: 30px;
            padding-bottom: 14px !important;
        }

        .form-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        button.btn-secondary {
            background-color:  #009688;
            color: white;
            border: none;
            width: 150px;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        button.btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
    <body>
        <div class="main-wrapper">
            <%@include file="layout/header.jsp"%>
            <%@include file="layout/sidebar.jsp"%>
            <div class="page-wrapper">
                <div class="content mt-5">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title mt-2">Chỉnh sửa Phòng</h3>
                            </div>
                        </div>
                    </div>
                    <c:if test="${not empty message}">
                        <div class="alert alert-success">${message}</div>
                    </c:if>  
                    <div class="row mt-3">
                        <div class="col-lg-12">
                            <form action="update_room" method="post">
                                <input type="hidden" name="roomid" value="${room.roomId}">
                                <!-- Your existing form fields -->
                                <div class="form-group">
                                    <label>Loại phòng</label>
                                    <select class="form-control" name="roomTypeId" required>
                                        <c:forEach var="roomType" items="${roomTypes}">
                                            <option value="${roomType.roomTypeId}" ${room.roomType.roomTypeId == roomType.roomTypeId ? 'selected' : ''}>${roomType.typeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Tên phòng</label>
                                    <input class="form-control" type="text" name="roomname" value="${room.roomName}" required>
                                </div>
<div class="form-group">
                                    <label>Trạng thái</label><br/>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="event_active" value="active" ${room.status == 'active' ? 'checked' : ''}>
                                        <label class="form-check-label" for="event_active"> Kích hoạt </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="event_inactive" value="inactive" ${room.status == 'inactive' ? 'checked' : ''}>
                                        <label class="form-check-label" for="event_inactive"> Không kích hoạt </label>
                                    </div>
                                </div>
                                <div class="form-buttons">
                                    <button type="button" onclick="cancelEdit()" class="btn btn-secondary buttonedit1 mt-4">Quay lại</button>

                                    <button type="submit" class="btn btn-primary buttonedit1">Sửa thông tin phòng</button>
                                </div>


                            </form>
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
        <script>
                                        function cancelEdit() {
                                            window.location.href = 'all_room';
                                        }
        </script>
    </body>
</html>