<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa sự kiện</title>
    <link rel="stylesheet" href="Views/admin/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="Views/admin/assets/css/select2.min.css">
    <link rel="stylesheet" href="Views/admin/assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="Views/admin/assets/plugins/datatables/datatables.min.css">
    <link rel="stylesheet" href="Views/admin/assets/css/style.css">
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
            max-width: 100px; /* Chỉnh kích thước nhỏ lại */
            height: auto;
            margin: 5px;
            display: inline-block; /* Để hiển thị theo chiều ngang */
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
                    <c:set var="event" value="${requestScope.event}"></c:set>
                    <div class="col text-center">
                        <h3 class="page-title mt-2">Chỉnh sửa sự kiện</h3> 
                    </div>
                </div>
            </div>
            <div class="row mt-3 justify-content-center">
                <div class="col-lg-8">
                    <h5 style="color: red"></h5>
            
                    <c:if test="${not empty requestScope.messageEventUpdate}">
                        <div class="alert alert-success" role="alert">
                            ${requestScope.messageEventUpdate}
                        </div>
                </c:if>
                    <c:if test="${not empty requestScope.error}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.error}
                        </div>
                </c:if>
                    <div class="form-container">
                        <div class="form-content">
                            <form action="update_event" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="${event.eventId}" />
                                <div class="form-group">
                                    <label>Tiêu đề</label>
                                    <input class="form-control" type="text" name="title" value="${event.titleEvent}" > 
                                </div>
                                <div class="form-group">
                                    <label>Chi tiết sự kiện</label>
                                    <input class="form-control" type="text" name="detail" value="${event.detail}" > 
                                </div>
                                  <div class="form-group">
                        <label for="mainFile">Tải lên ảnh</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="mainFile" name="filename" required onchange="previewFile('mainFile', 'previewImg')">
                            <label class="custom-file-label" for="mainFile">Chọn ảnh</label>
                        </div>
                        <img id="previewImg" src="" alt="Image preview" style="max-width: 100%; height: auto; display: none;">
                    </div>
                                
                                
                                
                                <div class="form-group">
                                    <label>Ngày bắt đầu</label>
                                    <input class="form-control" type="date" name="start_date" value="${event.startDate}" required>
                                </div>
                                <div class="form-group">
                                    <label>Ngày kết thúc</label>
                                    <input class="form-control" type="date" name="end_date" value="${event.endDate}" required>
                                </div>
                                <div class="form-group">
                                    <label>Phần trăm giảm giá</label>
                                    <input class="form-control" type="number" name="discount_percent" value="${event.discountPercent}" required>
                                </div>
                                <div class="form-group">
                                    <label>Mô tả</label>
                                    <textarea cols="30" rows="6" class="form-control" name="description" >${event.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label class="display-block">Trạng thái</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="event_active" value="active" ${event.status == 'active' ? 'checked' : ''}>
                                        <label class="form-check-label" for="event_active"> Kích hoạt </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="event_inactive" value="inactive" ${event.status == 'inactive' ? 'checked' : ''}>
                                        <label class="form-check-label" for="event_inactive"> Không kích hoạt </label>
                                    </div>
                                </div>
                                <div class="form-buttons">
                                    <button type="button" onclick="cancelEdit()" class="btn btn-secondary buttonedit1 mt-4">Quay lại</button>
                                    <button type="submit" class="btn btn-primary buttonedit1 mt-4">Chỉnh sửa</button>
                                </div>
                            </form>
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
    <script>
        $(function () {
            $('.datetimepicker').datetimepicker({
                format: 'YYYY-MM-DD HH:mm'
            });
        });

        function previewFile(inputId, previewId) {
                                    var preview = document.getElementById(previewId);
                                    var file = document.getElementById(inputId).files[0];
                                    var reader = new FileReader();

                                    reader.onloadend = function () {
                                        if (file) {
                                            preview.src = reader.result;
                                            preview.style.display = 'block';
                                        } else {
                                            preview.src = "";
                                            preview.style.display = 'none';
                                        }
                                    };

                                    if (file) {
                                        reader.readAsDataURL(file);
                                    } else {
                                        preview.src = "";
                                        preview.style.display = 'none';
                                    }
                                }

                                function previewFiles(inputId, previewContainerId) {
                                    var previewContainer = document.getElementById(previewContainerId);
                                    var files = document.getElementById(inputId).files;
                                    previewContainer.innerHTML = "";

                                    for (var i = 0; i < files.length; i++) {
                                        var file = files[i];
                                        var reader = new FileReader();

                                        reader.onloadend = function (event) {
                                            var img = document.createElement("img");
                                            img.src = event.target.result;
                                            img.style.maxWidth = "100px"; /* Chỉnh kích thước nhỏ lại */
                                            img.style.height = "auto";
                                            img.style.margin = "5px";
                                            img.style.display = "inline-block"; /* Để hiển thị theo chiều ngang */
                                            previewContainer.appendChild(img);
                                        };

                                        if (file) {
                                            reader.readAsDataURL(file);
                                        }
                                    }
                                }


        function cancelEdit() {
            window.location.href = 'list_event';
        }
    </script>
</body>
</html>
