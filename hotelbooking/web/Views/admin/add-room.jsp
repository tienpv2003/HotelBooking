<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm loại phòng</title>
    <link rel="stylesheet" href="your-css-file.css">
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
        width: 150px;
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

    #previewImgs img {
        max-width: 100px;
        margin-right: 10px;
        margin-bottom: 10px;
    }
</style>
<body>
    <jsp:include page="layout/header.jsp"></jsp:include>
    <jsp:include page="layout/sidebar.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content mt-5">
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col">
                        <h3 class="page-title mt-2">Thêm Phòng</h3> 
                    </div>
                </div>
            </div>
            <c:if test="${not empty param.message}">
<div class="alert alert-success">${param.message}</div>
            </c:if>  
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>  
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">${param.error}</div>
            </c:if>  
            <div class="row mt-3">
                <div class="col-lg-12">
                    <form action="create_room" method="post">
                        <div class="form-group">
                            <label for="roomTypeId">Loại phòng</label>
                            <select id="roomTypeId" class="form-control" name="roomTypeId" required>
                                <c:forEach var="roomType" items="${roomTypes}">
                                    <option value="${roomType.roomTypeId}">${roomType.typeName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="roomname">Tên phòng</label>
                            <input id="roomname" class="form-control" type="text" name="roomname" required>
                        </div>
                        <div class="form-group">
                            <label class="display-block">Trạng thái</label><br/>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="event_active" value="active" checked>
                                <label class="form-check-label" for="event_active"> Kích hoạt </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="event_inactive" value="inactive">
                                <label class="form-check-label" for="event_inactive"> Không kích hoạt </label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary buttonedit1 mt-4">Thêm phòng</button>
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
    <script>
        function previewFiles() {
            var preview = document.getElementById('previewImgs');
var files = document.querySelector('input[type=file]').files;
            preview.innerHTML = ''; // Clear previous images

            function readAndPreview(file) {
                if (/\.(jpe?g|png|gif)$/i.test(file.name)) {
                    var reader = new FileReader();

                    reader.addEventListener("load", function () {
                        var image = new Image();
                        image.height = 100;
                        image.title = file.name;
                        image.src = this.result;
                        preview.appendChild(image);
                    }, false);

                    reader.readAsDataURL(file);
                }
            }

            if (files) {
                [].forEach.call(files, readAndPreview);
            }
        }
    </script>
</body>
</html>