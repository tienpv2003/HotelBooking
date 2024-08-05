<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="layout/header.jsp"></jsp:include>
    <link rel="stylesheet" href="Views/admin/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="Views/admin/assets/css/select2.min.css">
    <link rel="stylesheet" href="Views/admin/assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="Views/admin/assets/plugins/datatables/datatables.min.css">
    <link rel="stylesheet" href="Views/admin/assets/css/style.css">
     <style>
        .img-inactive {
            filter: grayscale(100%);
            opacity: 0.5;
        }
        .overlay-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: red;
            font-size: 24px;
            font-weight: bold;
        }
        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .card {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            margin-bottom: 20px;
            height: 100%;
        }
        .card-img {
            width: 100%;
            height: 200px;
            object-fit: cover; 
        }
        .card-body {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .card-title, .card-text, .btn {
            margin-bottom: 10px;
        }
        @media (max-width: 767.98px) {
            .col-sm-8 {
                flex: 0 0 100%;
                max-width: 100%;
            }
        }
        @media (min-width: 768px) and (max-width: 991.98px) {
            .col-md-6 {
                flex: 0 0 50%;
                max-width: 50%;
            }
        }
        @media (min-width: 992px) {
            .col-lg-4 {
                flex: 0 0 33.33333%;
                max-width: 33.33333%;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="layout/sidebar.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col">
                        <div class="mt-5 d-flex justify-content-between align-items-center">
                            <a href="HomeAdminController" class="btn btn-primary" style="background-color: #007bff; width: 120px;">Quay lại</a>
                            <h4 class="card-title mt-2 text-center" style="flex-grow: 1;">Danh sách Tin tức</h4>
                            <a href="add_news" class="btn btn-primary veiwbutton">Thêm tin tức</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var="n" items="${listNews}">
                    <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                        <div class="card">
                            <div class="card-img-wrapper" style="position: relative;">
                                <img class="card-img <c:if test="${n.status == 'inactive'}">img-inactive</c:if>" src="Views/admin/assets/img/product/${n.img}" alt="">
                                <c:if test="${n.status == 'inactive'}">
                                    <div class="overlay-text">Bị khóa</div>
                                </c:if>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">${n.title}</h4>
                                <p class="card-text mt-3">${n.description}</p>
                                <c:choose>
                                    <c:when test="${n.status == 'active'}">
                                        <a href="news_detail?news_id=${n.newsId}" class="btn btn-info">Đọc thêm</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="update_news?news_id=${n.newsId}" class="btn btn-warning">Mở khóa</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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
            $('#datetimepicker3').datetimepicker({
                format: 'LT'
            });
        });
    </script>
   
</body>
</html>
