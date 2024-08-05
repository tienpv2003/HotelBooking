<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Mẫu Bảng Điều Khiển Khách Sạn</title>
        <link rel="shortcut icon" type="image/x-icon" href="Views/admin/assets/img/favicon.png">
        <link rel="stylesheet" href="Views/admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="Views/admin/assets/css/feathericon.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/morris/morris.css">
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
                                <div class="mt-5">
                                    <h4 class="card-title float-left mt-2">Lịch sử đặt phòng</h4>
<!--                                    <a href="add-booking.html" class="btn btn-primary float-right veiwbutton ">Thêm Đặt Phòng</a>-->
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
                                                    <th>Số Lượng</th>
                                                    <th>Ngày Đến</th>
                                                    <th>Ngày Đi</th>
                                                    <th>Số Điện Thoại</th>
                                                    <th>Email</th>
                                                 

                                                </tr>
                                            </thead>
                                            <c:forEach var="i" items="${list}">
                                            <tbody>
                                                <tr>
                                                    <td>ĐP-${i.reservationId}</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html">${i.customerId.firstName} ${i.customerId.lastName}<span> KH-${i.customerId.customerId}</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>${i.quantity}</td>
                                                    <td>${i.startDate}</td>
                                                    <td>${i.endDate}</td>
                                                    <td>${i.customerId.phone}</td>
                                                    
                                                    <td><a class="__cf_email__" data-cfemail="2652494b4b5f44435448474a66435e474b564a430845494b">${i.customerId.email}</a></td>
                                                    
                                                    
                                                </tr>
                                               
                                            </tbody>
                                            </c:forEach>
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
                            <div class="modal-body text-center"> <img src="Views/admin/assets/img/sent.png" alt="" width="50" height="46">
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
        <script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>
        <script src="Views/admin/assets/js/popper.min.js"></script>
        <script src="Views/admin/assets/js/bootstrap.min.js"></script>
        <script src="Views/admin/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="Views/admin/assets/plugins/datatables/datatables.min.js"></script>
        <script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="Views/admin/assets/plugins/raphael/raphael.min.js"></script>
        <script src="Views/admin/assets/js/script.js"></script>
    </body>

</html>