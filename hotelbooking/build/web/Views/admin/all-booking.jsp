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
        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/plugins/morris/morris.css">
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
                                <div class="mt-5">
                                    <h4 class="card-title float-left mt-2">Cuộc Hẹn</h4>
                                    <a href="add-booking.html" class="btn btn-primary float-right veiwbutton ">Thêm Đặt Phòng</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body booking_card">
                                    <div class="table-responsive">
                                        <table class="datatable table table-stripped table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>ID Đặt Phòng</th>
                                                    <th>Tên</th>
                                                    <th>Loại Phòng</th>
                                                    <th>Số Lượng</th>
                                                    <th>Ngày</th>
                                                    <th>Giờ</th>
                                                    <th>Ngày Đến</th>
                                                    <th>Ngày Đi</th>
                                                    <th>Email</th>
                                                    <th>Số Điện Thoại</th>
                                                    <th>Trạng Thái</th>
                                                    <th class="text-right">Hành Động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>BKG-0001</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-03.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Tommy Bernal <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>Đôi</td>
                                                    <td>10</td>
                                                    <td>21-03-2020</td>
                                                    <td>11.00 AM</td>
                                                    <td>22-03-2020</td>
                                                    <td>23-03-2020</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="2652494b4b5f44435448474a66435e474b564a430845494b">[email&#160;protected]</a></td>
                                                    <td>631-254-6480</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Hoạt Động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-booking.html"><i class="fas fa-pencil-alt m-r-5"></i> Chỉnh Sửa</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Xóa</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>BKG-0002</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-04.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Richard Brobst <span>#0002</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>Đơn</td>
                                                    <td>8</td>
                                                    <td>21-03-2020</td>
                                                    <td>09.00 AM</td>
                                                    <td>22-03-2020</td>
                                                    <td>23-03-2020</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="fd8f949e959c8f999f8f929f8e89bd98859c908d9198d39e9290">[email&#160;protected]</a></td>
                                                    <td>830-468-1042</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Không Hoạt Động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-booking.html"><i class="fas fa-pencil-alt m-r-5"></i> Chỉnh Sửa</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Xóa</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>BKG-0003</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-05.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Ellen Thill <span>#0003</span></a>
                                                        </h2> 
                                                    </td>
                                                    <td>Đôi</td>
                                                    <td>10</td>
                                                    <td>21-03-2020</td>
                                                    <td>08.00 AM</td>
                                                    <td>22-03-2020</td>
                                                    <td>23-03-2020</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="b2d7deded7dcc6dadbdedef2d7cad3dfc2ded79cd1dddf">[email&#160;protected]</a></td>
                                                    <td>508-335-5531</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Hoạt Động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-booking.html"><i class="fas fa-pencil-alt m-r-5"></i> Chỉnh Sửa</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Xóa</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>BKG-0004</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-06.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Corina Kelsey <span>#0004</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>Đơn</td>
                                                    <td>15</td>
                                                    <td>21-03-2020</td>
                                                    <td>12.00 AM</td>
                                                    <td>22-03-2020</td>
                                                    <td>23

                                                        -03-2020</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="781b170a111619131d140b1d01381d00191508141d561b1715">[email&#160;protected]</a></td>
                                                    <td>262-260-1170</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2"> Hoạt Động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-booking.html"><i class="fas fa-pencil-alt m-r-5"></i> Chỉnh Sửa</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Xóa</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>BKG-0005</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-07.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Carolyn Lane <span>#0005</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>Đôi</td>
                                                    <td>12</td>
                                                    <td>21-03-2020</td>
                                                    <td>06.00 AM</td>
                                                    <td>22-03-2020</td>
                                                    <td>23-03-2020</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="6c0f0d1e03001502000d02092c09140d011c0009420f0301">[email&#160;protected]</a></td>
                                                    <td>570-458-0070</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Hoạt Động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-booking.html"><i class="fas fa-pencil-alt m-r-5"></i> Chỉnh Sửa</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Xóa</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>BKG-0006</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-08.jpg" alt="User Image"></a>
                                                            <a href="profile.html">David Alvarez <span>#0006</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>Đơn</td>
                                                    <td>7</td>
                                                    <td>21-03-2020</td>
                                                    <td>10.00 AM</td>
                                                    <td>22-03-2020</td>
                                                    <td>23-03-2020</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="fb9f9a8d929f9a978d9a899e81bb9e839a968b979ed5989496">[email&#160;protected]</a></td>
                                                    <td>212-414-9510</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Không Hoạt Động </a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-booking.html"><i class="fas fa-pencil-alt m-r-5"></i> Chỉnh Sửa</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Xóa</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="delete_asset" class="modal fade delete-modal" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body text-center"> <img src="assets/img/sent.png" alt="" width="50" height="46">
                                <h3 class="delete_class">Bạn có chắc chắn muốn xóa tài sản này không?</h3>
                                <div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Đóng</a>
                                    <button type="submit" class="btn btn-danger">Xóa</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/plugins/datatables/datatables.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/raphael/raphael.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>

</html>