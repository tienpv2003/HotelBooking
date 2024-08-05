<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chỉnh sửa loại phòng</title>
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
    <body>
        <jsp:include page="layout/header.jsp"></jsp:include>
        <jsp:include page="layout/sidebar.jsp"></jsp:include>
            <div class="page-wrapper">
                <div class="content">
                    <div class="page-header">
                        <h3 class="page-title">Chỉnh sửa loại phòng</h3>
                    </div>
                <c:if test="${not empty message1}">
                    <div class="alert alert-danger">${message1}</div>
                </c:if>
                <c:if test="${not empty message}">
                    <div class="alert alert-success">${message}</div>
                </c:if>
                <form action="update_type_room" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="nametype">Tên loại phòng</label>
                        <input id="nametype" value="${roomType.typeName}" class="form-control" type="text" name="nametype" required placeholder="Nhập tên loại phòng">
                    </div>
                    <div class="form-group">
                      
                        <input type="hidden" id="quantity" value="${roomType.quantity}" class="form-control" type="number" name="quantity" >
                        <input value="${roomType.roomTypeId}" type="hidden" class="form-control" name="Typeid">
                    </div>
                    <div class="form-group">
                        <label for="currentPrice">Giá tiền</label>
                        <input id="currentPrice" value="${roomType.roomTypePrice}" class="form-control" type="number" name="currentPrice" required step="0.1">
                    </div>

                    <div class="form-group">
                        <label for="nametype">Tiêu đề</label>
                        <input id="nametype" class="form-control" type="text" name="title" required value="${roomType.titleDescripsion}">
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
                        <label for="additionalFiles">Tải thêm ảnh mô tả</label>
                        <div class="custom-file mb-3">
                            <input type="file" class="custom-file-input" id="additionalFiles" name="filenames" multiple required onchange="previewFiles('additionalFiles', 'previewImgs')">
                            <label class="custom-file-label" for="additionalFiles">Chọn ảnh</label>
                        </div>
                        <div id="previewImgs" style="display: flex; flex-wrap: wrap;"></div>
                    </div>
                    <div class="form-group">
                        <label for="description">Miêu tả</label>
                        <textarea id="description" class="form-control" name="des" required rows="4">${roomType.roomTypedescripsion}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="description">Miêu tả Chi tiết</label>
                        <textarea id="description" class="form-control" name="contentdescription" required rows="4">${roomType.contentDescripsion}</textarea>
                    </div>
                    <div class="form-group">
                        <label class="display-block">Trạng thái</label><br>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="status" value="active" ${roomType.status == 'active' ? 'checked' : ''}>
                            <label class="form-check-label" for="event_active">Kích hoạt</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="status" value="inactive" ${roomType.status == 'inactive' ? 'checked' : ''}>
                            <label class="form-check-label" for="event_inactive">Không kích hoạt</label>
                        </div>
                    </div>
                    <div class="form-buttons">
                        <button type="button" onclick="cancelEdit()" class="btn btn-secondary buttonedit1 mt-4">Quay lại</button>
                        <button type="submit" class="btn btn-primary buttonedit1">Cập nhật loại phòng</button>
                    </div>
                </form>
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
                                window.location.href = 'all_type_room';
                            }
        </script>
    </body>
</html>