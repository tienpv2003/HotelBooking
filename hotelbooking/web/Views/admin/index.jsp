<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

﻿<!DOCTYPE html>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
    <jsp:include page="layout/sidebar.jsp"></jsp:include>

        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12 mt-5">
                            <h3 class="page-title mt-3">Xin chào ${staff.staff_type_id.type}</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item active">Thống kê khách sạn</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card board1 fill">
                        <div class="card-body">
                            <div class="dash-widget-header">
                                <div>
                                    <h3 class="card_widget_header">${listBookedRoom}</h3>
                                    <h6 class="text-muted">Phòng đang đặt</h6> 
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0"> 
                                    <span class="opacity-7 text-muted">
                                        <i class="fas fa-door-closed"></i>
                                    </span> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card board1 fill">
                        <div class="card-body">
                            <div class="dash-widget-header">
                                <div>
                                    <h3 class="card_widget_header">${listRoomActive}</h3>
                                    <h6 class="text-muted">Phòng còn trống</h6> 
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0"> 
                                    <i class="fas fa-door-open"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card board1 fill">
                        <div class="card-body">
                            <div class="dash-widget-header">
                                <div>
                                    <h3 class="card_widget_header">${listRoomInActive}</h3>
                                    <h6 class="text-muted">Phòng đang sửa chữa</h6> 
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0"> 
                                    <span class="opacity-7 text-muted">
                                        <i class="fas fa-wrench"></i>

                                    </span> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card board1 fill">
                        <div class="card-body">
                            <div class="dash-widget-header">
                                <div>
                                    <h3 class="card_widget_header">${listAllRoom}</h3>
                                    <h6 class="text-muted">Tất cả phòng</h6> 
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0"> 
                                    <span class="opacity-7 text-muted">
                                        <i class="fas fa-home"></i>
                                    </span> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-6">
                    <div class="card card-chart">
                        <div class="card-header">
                            <h4 class="card-title">DOANH THU THEO THÁNG</h4> 
                        </div>
                        <div class="card-body">
                            <canvas id="myChart" style="width:100%;max-width:700px"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-6">
                    <div class="card card-chart">
                        <div class="card-header">
                            <h4 class="card-title">SỐ PHÒNG ĐÃ ĐẶT</h4> 
                        </div>
                        <div class="card-body">
                            <canvas id="myChart2" style="width:100%;max-width:600px"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 d-flex">
                    <div class="card card-table flex-fill">
                        <div class="card-header">
                            <h4 class="card-title float-left mt-2">Tất cả đơn đặt phòng gần nhất</h4>
                            <button
                                type="button" class="btn btn-primary float-right veiwbutton">Xem tất cả
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-center">
                                    <thead>
                                        <tr>
                                            <th>Mã Đặt Phòng</th>
                                            <th>Tên Người Đặt</th>
                                            <th>Email</th>
                                            <th>Ngày Đặt Phòng</th>
                                            <th class="text-center">Số phòng đặt</th>
                                            <th class="text-right">Tổng tiền</th>
                                            <th class="text-center">Số điện thoại</th>
                                        </tr>
                                    </thead>
                                    <c:forEach var="i" items="${listTop10}">
                                        <tbody>
                                            <tr>
                                                <td class="text-nowrap">
                                                    <div>MDP-${i.reservationId}</div>
                                                </td>
                                                <td class="text-nowrap">${i.customerId.firstName} ${i.customerId.lastName}</td>
                                                <td><a class="__cf_email__">${i.customerId.email}</a></td>
                                                <td>${i.startDate}</td>
                                                <td class="text-center">${i.quantity}</td>
                                                <td class="text-center"><fmt:formatNumber value="${i.totalPrice}" type="number" groupingUsed="true" /> VND</td>
                                                <td class="text-center">${i.customerId.phone}</td>
                                            </tr>
                                            <!-- Thêm các hàng dữ liệu khác tương tự ở đây -->
                                        </tbody>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script>
<script>
    const xValues = ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6",
        "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"];
    const yValues = [${month01}, ${month02}, ${month03}, ${month04}, ${month05}
        , ${month06}, ${month07}, ${month08}, ${month09}, ${month10}, ${month11}, ${month12}];

    new Chart("myChart", {
        type: "line",
        data: {
            labels: xValues,
            datasets: [{
                    backgroundColor: "rgba(0, 150, 136)",
                    borderColor: "rgba(0, 150, 136)",
                    data: yValues
                }]
        },
        options: {
            legend: {display: false},
            scales: {
                yAxes: [{ticks: {min: 0, max: 50000000}}]
            }
        }
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var xValues = ["Phòng Đơn", "Phòng Đôi", "Phòng Gia Đình", "Phòng VIP", "Phòng Suite"];
        var yValues = ["${phongDon}", "${phongDoi}", "${phongGiaDinh}", "${phongVIP}", "${phongSuite}"];
        var barColors = [
            "#009688",
            "#00aba9",
            "#2b5797",
            "#e8c3b9",
            "#b91d47"
        ];

        new Chart("myChart2", {
            type: "pie",
            data: {
                labels: xValues,
                datasets: [{
                        backgroundColor: barColors,
                        data: yValues
                    }]
            },
            options: {
                title: {
                    display: true,
                    text: "Số phòng đã đặt năm 2024"
                }
            }
        });
    });
</script>
<script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>
<script src="Views/admin/assets/js/popper.min.js"></script>
<script src="Views/admin/assets/js/bootstrap.min.js"></script>
<script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="Views/admin/assets/plugins/raphael/raphael.min.js"></script>
<script src="Views/admin/assets/plugins/morris/morris.min.js"></script>
<script src="Views/admin/assets/js/chart.morris.js"></script>
<script src="Views/admin/assets/js/script.js"></script>
</body>
</html>
