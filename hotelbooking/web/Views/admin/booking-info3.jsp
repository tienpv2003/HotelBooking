<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Hotel Dashboard Template</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="Views/admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="Views/admin/assets/css/feathericon.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/morris/morris.css">
        <link rel="stylesheet" href="Views/admin/assets/css/style.css">
    </head>

    <style>
        .img_room {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .table td {
            vertical-align: middle;
        }

        .typemoney, .money {
            text-align: right;
            padding-right: 15px;
        }

        .vnpay-button {
            display: flex;
            align-items: center;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            padding: 10px 20px;
            font-size: 16px;
            color: #212529;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .vnpay-button img {
            margin-right: 5px;
        }

        .vnpay-button:hover {
            background-color: #0066cc; /* VNPay logo color */
            color: #ffffff;
            border-color: #0066cc;
        }

        .payment-summary {
            display: flex;
            justify-content: flex-end;
            align-items: flex-end;
            flex-direction: column;
            margin-top: 20px;
        }

        .payment-summary table {
            width: auto;        }   
    </style>
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
                                    <h4 class="card-title float-left mt-2">Tất cả phòng</h4>
                                    <a href="create_room" class="btn btn-primary float-right veiwbutton">Thêm phòng</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body booking_card">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-6 text-left">
                                                <c:set var="c" value="${sessionScope.cusObj}"></c:set>
                                                <h4><strong>Thông tin Hóa đơn</strong> </h4>
                                                <ul class="list-unstyled">
                                                    <li><strong>Họ:</strong> ${c.firstName}</li>
                                                    <li><strong>Tên:</strong> ${c.lastName}</li>
                                                    <li><strong>Số điện thoại:</strong> ${c.phone}</li>
                                                    <li><strong>Email:</strong> ${c.email}</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <c:set value="${sessionScope.listBooking}" var="b"></c:set>
                                        <div class="table-responsive">
                                            <table class="table table-condensed nomargin">
                                                <thead>
                                                    <tr>
                                                        <th>Tên phòng</th>
                                                        <th>Tiền phòng</th>
                                                        <th>Tiền Dịch vụ thêm</th>
                                                        <th>Tổng tiền</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${b.listItem}" var="i">
                                                        <tr>
                                                            <td>
                                                                <div><strong>${i.room.roomName}</strong></div>
                                                                <c:forEach items="${i.listService}" var="ser">
                                                                    <small>${ser.nameService}</small>
                                                                </c:forEach>
                                                            </td>
                                                            <td><fmt:formatNumber value="${i.room.roomType.roomTypePrice}" type="number" groupingUsed="true" /> VND</td>
                                                            <td><fmt:formatNumber value="${i.price - i.room.roomType.roomTypePrice}" type="number" groupingUsed="true" /> VND</td>
                                                            <td><fmt:formatNumber value="${i.price}" type="number" groupingUsed="true" /> VND</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>

                                        <hr class="nomargin-top">
                                        <form action="payment" method="post">
                                            <div class="row">
                                                <div class="col-md-6 text-left">
                                                    <h4><strong>Liên hệ với chúng tôi</strong></h4>
                                                    <p class="nomargin nopadding">
                                                        Trực tiếp 24/7
                                                    </p>
                                                    <p class="nomargin nopadding">
                                                        <strong>Lưu ý</strong>
                                                        <br>
                                                        Nếu xảy ra bất cứ vấn đề gì khi đặt phòng, hãy liên lạc trực tiếp với khách sạn qua các cổng thông tin.
                                                    </p><br>
                                                    <address>
                                                        <br>
                                                        Khách Sạn Hola<br>
                                                        KM30 - Khu CNC Hòa Lạc - Thạch Thất - Hà Nội <br>
                                                        Số điện thoại: 1900 123 456 <br>
                                                        Email: hola@hotelbooking.com
                                                    </address>
                                                </div>
                                                <div class="col-md-6 payment-summary">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td class="typemoney"><strong>Tiền trước giảm giá:</strong></td>
                                                                <td class="money"><fmt:formatNumber value="${b.calculateTotalPriceNotEvent()}" type="number" groupingUsed="true" /> VND</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="typemoney"><strong>Giảm giá sự kiện:</strong></td>
                                                                <td class="money"><fmt:formatNumber value="${b.calculateDiscountEvent()}" type="number" groupingUsed="true" /> VND</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="typemoney"><strong>VAT(10%):</strong></td>
                                                                <td class="money">10%</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="typemoney"><strong>Giảm giá khách (${c.typeCustomer.typeCustomerName}):</strong></td>
                                                                <td class="money"><fmt:formatNumber value="${c.typeCustomer.discount}" type="number" groupingUsed="true" />%</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="typemoney"><strong>Tổng tiền:</strong></td>
                                                                <td class="money"><fmt:formatNumber value="${b.totalPrice + b.totalPrice * 0.1}" type="number" groupingUsed="true" /> VND</td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: right;">
                                                                    <button style="margin-top: 20px;" type="submit" class="btn btn-primary vnpay-button">
                                                                        THANH TOÁN
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
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
        <script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="Views/admin/assets/plugins/raphael/raphael.min.js"></script>
        <script src="Views/admin/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="Views/admin/assets/plugins/datatables/datatables.min.js"></script>
        <script src="Views/admin/assets/js/script.js"></script>
    </body>
</html>
