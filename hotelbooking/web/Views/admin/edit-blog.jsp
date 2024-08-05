<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <style>
            /* Inline CSS for demo purposes, move to your CSS file */
            .form-container {
                max-width: 900px;
                margin: 0 auto;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                font-weight: bold;
                display: block;
                margin-bottom: 5px;
            }
            .form-control, .custom-file-input, .custom-file-label {
                width: 100%;
            }
            .custom-file {
                position: relative;
            }
            .form-check-inline {
                display: inline-block;
                margin-right: 10px;
            }
            .form-check-input {
                margin-right: 5px;
            }
            .btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                color: white;
            }
            .btn-primary {
                background-color: #007bff;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .form-container {
                max-width: 900px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 10px;
                background-color: #f9f9f9;
            }
            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                font-weight: bold;
                display: block;
                margin-bottom: 5px;
            }

            .form-control, .custom-file-input, .custom-file-label {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .custom-file {
                position: relative;
            }

            .form-check-inline {
                display: inline-block;
                margin-right: 10px;
            }

            .form-check-input {
                margin-right: 5px;
            }

            .btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                color: white;
            }

            .btn-primary {
                background-color: #007bff;
            }

            .btn-primary:hover {
                background-color: #0056b3;
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
                            <div class="col">
                                <a href="list_news" class="btn btn-primary mt-1 float-left" style="background-color: #007bff; width: 120px;">Quay lại</a>
                                <h3 class="page-title mt-2 text-center font-weight-bolder">Sửa Tin Tức</h3>
                            </div>
                        </div>
                    </div>
                <c:if test="${not empty successMess}">
                    <div class="alert alert-success">${successMess}</div>
                </c:if>
                <c:if test="${not empty errorMess}">
                    <div class="alert alert-danger">${errorMess}</div>
                </c:if>
                <div class="row mt-3">
                    <div class="col-lg-12">
                        <div class="form-container">
                            <form action="update_news" method="post" enctype="multipart/form-data" onsubmit="return validateFileType()">
                                <div class="form-group">
                                    <label>Tiêu đề</label>
                                    <input class="form-control" name="title" type="text" value="${news.title}" required="">
                                </div>
                                <div class="form-group">
                                    <label>Mô tả tin tức</label>
                                    <textarea name="description" cols="30" rows="6" class="form-control" required="">${news.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label class="display-block">Trạng thái tin tức</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="blog_active" value="active" ${news.status == 'active' ? 'checked' : ''}>
                                        <label class="form-check-label" for="blog_active"> Hiện </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="blog_inactive" value="inactive" ${news.status == 'inactive' ? 'checked' : ''}>
                                        <label class="form-check-label" for="blog_inactive"> Ẩn </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Tải lên ảnh</label>
                                    <div class="custom-file mb-3">
                                        <input type="file" class="custom-file-input" id="customFile" name="filename" required="" onchange="previewFile()">
                                        <label class="custom-file-label" for="customFile">Chọn ảnh</label>
                                    </div>
                                    <img id="previewImg" src="Views/admin/assets/img/news/${news.img}" alt="Image preview" style="max-width: 100%; height: auto; display: none;" />
                                </div>
                                <div class="form-group">
                                    <label>Nội dung tin tức</label>
                                    <textarea name="content" cols="30" rows="10" class="form-control" required="">${newsDetail.content}</textarea>
                                </div>
                                <input hidden="" name="news_id" value="${news.newsId}">
                                <input type="submit" value="Lưu bài" class="btn btn-primary mt-4">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>
        <script src="Views/admin/assets/js/popper.min.js"></script>
        <script src="Views/admin/assets/js/bootstrap.min.js"></script>
        <script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="Views/admin/assets/plugins/raphael/raphael.min.js"></script>
        <script src="Views/admin/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="Views/admin/assets/plugins/datatables/datatables.min.js"></script>
        <script src="Views/admin/assets/js/script.js"></script>
        <script>
                                            function previewFile() {
                                                var preview = document.getElementById('previewImg');
                                                var file = document.querySelector('input[type=file]').files[0];
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

                                            function validateFileType() {
                                                const fileInput = document.getElementById('customFile');
                                                const filePath = fileInput.value;
                                                const allowedExtensions = /(\.jpg|\.png|\.jpeg|\.gif|\.tiff|\.tif|\.psd|\.pdf|\.eps|\.ai|\.heic|\.raw|\.svg)$/i;

                                                if (!allowedExtensions.exec(filePath)) {
                                                    alert('Đây không phải ảnh. Vui lòng chọn file là ảnh !');
                                                    fileInput.value = '';
                                                    return false;
                                                }
                                                return true;
                                            }
        </script>
    </body>
</html>
