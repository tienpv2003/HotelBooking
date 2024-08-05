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
        <link rel="stylesheet" href="Views/admin/assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="Views/admin/assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="Views/admin/assets/css/style.css"> 
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
                        <div class="col-lg-12 text-center">
                            <a href="booking_info_old" class="btn btn-primary btn-lg m-2">
                                Có tài khoản
                            </a>
                            <a href="booking_info_new" class="btn btn-primary btn-lg m-2">
                                Người dùng mới
                            </a>
                        </div>
                    </div>
                </div>
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
    </body>

</html>
