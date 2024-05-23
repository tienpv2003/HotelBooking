<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mẫu Bảng Điều Khiển Khách Sạn</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">

        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
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
                                <h3 class="page-title mt-5">Chỉnh Sửa Đặt Phòng</h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form>
                                <div class="row formtype">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>ID Đặt Phòng</label>
                                            <input class="form-control" type="text" value="BKG-0001">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Tên</label>
                                            <select class="form-control" id="sel1" name="sellist1">
                                                <option>Chọn</option>
                                                <option>Jennifer Robinson</option>
                                                <option>Terry Baker</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Loại Phòng</label>
                                            <select class="form-control" id="sel2" name="sellist1">
                                                <option>Chọn</option>
                                                <option>Đơn</option>
                                                <option>Đôi</option>
                                                <option>Bốn Người</option>
                                                <option>Giường King</option>
                                                <option>Suite</option>
                                                <option>Biệt Thự</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Tổng Số Thành Viên</label>
                                            <select class="form-control" id="sel3" name="sellist1">
                                                <option>Chọn</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Ngày</label>
                                            <div class="cal-icon">
                                                <input type="text" class="form-control datetimepicker">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Giờ</label>
                                            <div class="time-icon">
                                                <input type="text" class="form-control" id="datetimepicker3">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Ngày Đến</label>
                                            <div class="cal-icon">
                                                <input type="text" class="form-control datetimepicker">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Ngày Đi</label>
                                            <div class="cal-icon">
                                                <input type="text" class="form-control datetimepicker">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" class="form-control" id="usr">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Số Điện Thoại</label>
                                            <input type="text" class="form-control" id="usr1">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Tải Tệp Lên</label>
                                            <div class="custom-file mb-3">
                                                <input type="file" class="custom-file-input" id="customFile" name="filename">
                                                <label class="custom-file-label" for="customFile">Chọn tệp</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Tin Nhắn</label>
                                            <textarea class="form-control" rows="5" id="comment" name="text"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary buttonedit">Lưu</button>
                </div>
            </div>

        </div>


        <script src="assets/js/jquery-3.5.1.min.js"></script>

        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/raphael/raphael.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <script src="assets/js/script.js"></script>
        <script>
            $(function () {
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'
                });
            });
        </script>
    </body>
</html>