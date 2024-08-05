<%@page import="java.util.List"%>
<%@page import="Models.RoomType" %>
<%@page import="Models.Room" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <!-- Add meta tags, title, and other head elements here -->
        <link rel="stylesheet" href="Views/admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/datatables/datatables.min.css">
        <!-- Add any other CSS files here -->
    </head>
    
         <style>
            body {
                font-family: Arial, sans-serif;
            }
            .page-wrapper {
                padding: 20px;
            }
            .blog-view {
                border-radius: 5px;
                overflow: hidden;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            .blog-single-post {
                padding: 20px;
            }
            .blog-title {
                font-size: 2em;
                color: #333;
                margin-bottom: 20px;
            }
            .room-detail-images img {
                max-width: 100px; 
                margin: 5px; 
                border-radius: 5px;
                transition: transform 0.2s ease-in-out;
            }
            .room-detail-images img:hover {
                transform: scale(1.1);
            }
            .main-image {
                width: 100%; 
                height: auto; 
                border-radius: 5px;
                margin: 5px;
            }
            .veiwbutton {
                margin-left: 10px;
            }
            
            
            h6 {
                font-size: 1.2em;
                color: #555;
                margin-bottom: 10px;
            }
            .btn {
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border-radius: 5px;
                border: none;
                transition: background-color 0.2s ease-in-out;
            }
            .btn:hover {
                background-color: #0056b3;
            }
            .veiwbutton {
                margin-left: 10px;
            }
            .justify-content-between > a {
                flex-grow: 1;
                text-align: center;
            }
        </style>
  
    <body>
        <jsp:include page="layout/header.jsp"></jsp:include>
        <jsp:include page="layout/sidebar.jsp"></jsp:include>
        <div class="page-wrapper">
            <div class="content mt-2">
                <c:if test="${roomTypes != null}">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="mt-5 d-flex justify-content-between align-items-center">
                                <a href="all_type_room" class="btn btn-primary" style="background-color: #007bff; width: 120px;">Quay lại</a>
                                <h4 class="card-title mt-2 text-center" style="flex-grow: 1;">Thông tin phòng chi tiết</h4>
                                <a href="update_type_room?id=${roomTypes.roomTypeId}" class="btn btn-primary veiwbutton">Chỉnh sửa</a>
                            </div>
                            <div class="blog-view" style="width: 100%">
                                <article class="blog blog-single-post">
                                    <h3 class="blog-title">${roomTypes.typeName}</h3>
                                    <h6>Loại: ${roomTypes.typeName}</h6>
                                     <h6>Số lượng: ${roomTypes.quantity}</h6>
                                    <h6>Trạng thái: ${roomTypes.status}</h6>
                                    
                                    <!-- Container cho ảnh lớn và các nút bấm -->
                                    <div class="position-relative">
                                       
                                            <img id="mainImage" src="Views/client/img/${roomTypes.roomtype_img}" class="img-thumbnail main-image">
                                  
                                    </div>
                                    
                                    <!-- Hiển thị các hình ảnh chi tiết -->
                                    <div class="room-detail-images mt-2">
                                        <c:forEach var="image" items="${roomDetailImages}">
                                            <img src="Views/client/img/${image}" class="img-thumbnail" style="max-width: 100px; margin: 5px;" onclick="changeImage('Views/client/img/${image}')">
                                        </c:forEach>
                                    </div>

                                    <div class="blog-content mt-4">
                                        <h4>Tiêu đề:</h4>
                                        <br>
                                        ${roomTypes.titleDescripsion}
                                        <hr>
                                        <c:if test="${content != null}">
                                            <h4>Nội dung:</h4>
                                            ${content}
                                        </c:if>
                                      
                                        <h4>Mô tả:</h4>
                                        <br>
                                        ${roomTypes.roomTypedescripsion}
                                        <hr>
                                        <c:if test="${content != null}">
                                            <h4>Nội dung:</h4>
                                            ${content}
                                        </c:if>
                                            
                                         <h4>Mô tả chi tiết:</h4>
                                        <br>
                                        ${roomTypes.contentDescripsion}
                                        <hr>
                                        <c:if test="${content != null}">
                                            <h4>Nội dung:</h4>
                                            ${content}
                                        </c:if>
                                      
                                    </div>
                                </article>
                            </div>
                        </div>
                    </div>               
                </div>
                </c:if>
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
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'
                });
            });

            // JavaScript để chuyển đổi ảnh
            function changeImage(src) {
                document.getElementById('mainImage').src = src;
            }      
        </script>
        <style>
            .responsive-img {
                width: 100%;
                height: auto; /* Maintain aspect ratio */
                object-fit: cover; /* Cover the container while maintaining aspect ratio */
            }
            .img-thumbnail {
                width: 100px;
                height: 100px;
                object-fit: cover;
                border-radius: 5px;
                border: 1px solid #ddd;
                margin: 5px;
                cursor: pointer;
            }
            .main-image {
                width: 100%; 
                height: auto; 
                object-fit: cover; 
                border-radius: 5px;
                border: 1px solid #ddd;
                margin: 5px;
            }
            .position-relative {
                position: relative;
            }
            .position-absolute {
                position: absolute;
            }
            .top-0 {
                top: 0;
            }
            .start-0 {
                left: 0;
            }
            .m-2 {
                margin: 0.5rem;
            }
        </style>
    </body>
</html>