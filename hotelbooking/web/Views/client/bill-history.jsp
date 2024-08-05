<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

<!DOCTYPE html>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
        <body style="background-color: white">

            <div class="container">
                <div class="account-settings">
                    <div class="user-profile">                    
                        <h1 style="margin-top: 5%; margin-bottom: 20px; text-align: center" class="user-name">Lịch sử đặt phòng</h1>
                    </div>
                </div>
                <div class="row">
                <c:set var="historyBooking" value="${listHistory}"></c:set>
                <c:forEach items="${historyBooking}" var="his"> 
                    <div class="container bootstrap snippets bootdey" style="margin-top: 20px;">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 text-left">
                                        <c:set var="c" value="${sessionScope.cusObj}"></c:set>
                                            <ul class="list-unstyled">
                                                <li><strong>Họ:</strong> ${c.firstName}</li>
                                            <li><strong>Tên:</strong> ${c.lastName}</li>
                                            <li><strong>Số điện thoại:</strong> ${c.phone}</li>
                                            <li><strong>Email:</strong> ${c.email}</li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="table table-condensed nomargin">
                                        <thead>
                                            <tr>
                                                <th>Số phòng</th>
                                                <th>Loại phòng</th>
                                                <th>Ngày nhận</th>
                                                <th>Ngày trả</th>
                                                <th>Dịch vụ</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${his.listBooking}" var="b">
                                                <c:forEach items="${b.listItem}" var="i">
                                                    <tr>
                                                        <td>
                                                            <div><strong>${i.room.roomName}</strong></div>
                                                        </td>
                                                        <td>${i.room.roomType.typeName}</td>
                                                        <td>${b.startDate}</td>
                                                        <td>${b.endDate}</td>
                                                        <td>
                                                            <c:forEach items="${i.listService}" var="ser">
                                                                <small>${ser.nameService}</small><br/>
                                                            </c:forEach>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>         

                                <hr class="nomargin-top">
                                <div class="row">
                                    <form action="payment" method="post">
                                        <div class="col-sm-12 text-right">
                                            <ul class="list-unstyled" style="display: flex; justify-content: flex-end">
                                                <table border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td class="typemoney"><strong>Tiền trước giảm giá: </strong></td>
                                                            <td class="money"><fmt:formatNumber value="${his.totalNoDiscount}" type="number" groupingUsed="true" /> VND</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="typemoney"><strong>Giảm giá sự kiện: </strong></td>
                                                            <td class="money"><fmt:formatNumber value="${his.eventDiscount}" type="number" groupingUsed="true" />%</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="typemoney"><strong>VAT(10%):</strong></td>
                                                            <td class="money">10%</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="typemoney"><strong>Giảm giá khách:</strong></td>
                                                            <td class="money"><fmt:formatNumber value="${his.discountCustomer}" type="number" groupingUsed="true" />%</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="typemoney"><strong>Tổng tiền:</strong></td>
                                                            <td class="money"><fmt:formatNumber value="${his.total}" type="number" groupingUsed="true" /> VND</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="typemoney"><strong>Ngày thanh toán:</strong></td>
                                                            <td class="money"> ${his.dateInvoice}</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </ul>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>  
                </c:forEach>
            </div>
        </div>
    </div>
</body>
<jsp:include page="layout/footer.jsp"></jsp:include>
<style>
    body {
        margin-top: 20px;
    }
    .footer{
        margin-top: 50px;
    }
    .card {
        box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
    }

    .avatar.sm {
        width: 2.25rem;
        height: 2.25rem;
        font-size: .818125rem;
    }

    .table-nowrap .table td,
    .table-nowrap .table th {
        white-space: nowrap;
    }

    .table>:not(caption)>*>* {
        padding: 0.75rem 1.25rem;
        border-bottom-width: 1px;
    }
    table th {
        font-weight: 600;
        background-color: #eeecfd !important;
    }

    .fa-arrow-up {
        color: #00CED1;
    }

    .fa-arrow-down {
        color: #FF00FF;
    }

    .button {
        background-color: #4CAF50; /* Màu nền xanh lá */
        color: white; /* Màu chữ trắng */
        padding: 12px 24px; /* Padding cho nút */
        border: none; /* Không viền */
        border-radius: 5px; /* Bo góc */
        cursor: pointer; /* Con trỏ chuột */
        margin-right: 10px; /* Khoảng cách giữa các nút */
    }

    .button:hover {
        background-color: #45a049; /* Màu khi hover */
    }

</style>

