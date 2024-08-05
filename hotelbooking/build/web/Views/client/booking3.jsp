<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<!DOCTYPE html>

</style>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
        <!-- start breadcrumb -->
        <section class="breadcrumb_main_area margin-bottom-80">
            <div class="container-fluid">
                <div class="row">
                    <div class="breadcrumb_main1" style="padding-top: 0px; padding-bottom: 0px; position: relative;">
                        <h2 class="centered-heading1">Hóa đơn</h2>
                        <img src="Views/client/img/gallery-breadcrumb.jpg" alt="imf" style="width: 100%;">
                        <!-- special offer start -->
                        <div class="special_offer_main">
                            <div class="container">
                                <div class="special_offer_sub" style="position: absolute">
                                    <img src="Views/client/img/special-offer-yellow-main.png" alt="imf">
                                </div>
                            </div>
                        </div>         
                        <!-- end offer start -->
                    </div>
                </div>
            </div>
        </section>
        <!-- end breadcrunb -->
        <ul class="nav nav-tabs custom-tab" style="display: flex; justify-content: center" role="tablist">
            <li role="presentation" class="active">
                <a href="#personal_info" aria-controls="personal_info" role="tab" data-toggle="tab">
                    <div class="circle">3</div>
                    <span>HÓA ĐƠN THANH TOÁN</span>
                </a>
            </li>
        </ul>
        <div class="container bootstrap snippets bootdey" style="margin-top: 20px;">
            <div class="panel panel-default">
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
                <div class="row">
                    <div class="col-sm-6 text-left">
                        <h4><strong>Liên hệ với chúng tôi</strong></h4>
                        <p class="nomargin nopadding">

                            Trực tiếp 24/7
                        </p>
                        <p class="nomargin nopadding">
                            <strong>Lưu ý</strong> 
                            </br>
                            Nếu xảy ra bất cứ vấn đề gì khi đặt phòng,hãy liên lạc trực tiếp với khách sạn qua các cổng thông tin.
                        </p><br><!-- no P margin for printing - use <br> instead -->

                        <address>
                            <br>
                            Khách Sạn Hola<br>
                            KM30 - Khu CNC Hòa Lạc - Thạch Thất - Hà Nội <br>
                            Số điện thoại: 1900 123 456 <br>
                            Email: hola@hotelbooking.com
                        </address>
                    </div>
                    <form action="payment" method="post">
                        <div class="col-sm-6 text-right">
                            <ul class="list-unstyled" style="display: flex; justify-content: flex-end">
                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td class="typemoney"><strong>Tiền trước giảm giá: </strong></td>
                                            <td class="money"><fmt:formatNumber value="${b.calculateTotalPriceNotEvent()}" type="number" groupingUsed="true" /> VND</td>
                                        </tr>
                                        <tr>
                                            <td class="typemoney"><strong>Giảm giá sự kiện: </strong></td>
                                            <td class="money"><fmt:formatNumber value="${b.calculateDiscountEvent()}" type="number" groupingUsed="true" />%</td>
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
                                            <td class="money"><fmt:formatNumber value="${b.calculateTotalPrice()}" type="number" groupingUsed="true" /> VND</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: right;">
                                                <input type="hidden" name="totalAmount" value="${b.totalPrice + b.totalPrice * 0.1}">
                                                <input type="hidden" name="vnp_OrderInfo" value="Thông tin đơn hàng của bạn">
                                                <input type="hidden" name="ordertype" value="billpayment">
                                                <input type="hidden" name="language" value="vn">
                                                <input type="hidden" name="bankcode" value="">
                                                <input type="hidden" name="txt_billing_mobile" value="${b.customer.phone}">
                                                <input type="hidden" name="txt_billing_email" value="${b.customer.email}">
                                                <input type="hidden" name="txt_billing_fullname" value="Vu Dinh Tu">
                                                <input type="hidden" name="txt_inv_addr1" value="${b.customer.address}">
                                                <input type="hidden" name="txt_bill_city" value="${b.customer.address}">
                                                <input type="hidden" name="txt_bill_country" value="VN">
                                                <input type="hidden" name="txt_bill_state" value="">
                                                <input type="hidden" name="txt_inv_mobile" value="${b.customer.phone}">
                                                <input type="hidden" name="txt_inv_email" value="${b.customer.email}">
                                                <input type="hidden" name="txt_inv_customer" value="Vu Dinh Tu">
                                                <input type="hidden" name="txt_inv_company" value="Công ty XYZ">
                                                <input type="hidden" name="txt_inv_taxcode" value="123456789">
                                                <input type="hidden" name="cbo_inv_type" value="I">
                                                <button style="margin-top: 20px; margin-left: 40px" type="submit" class="btn btn-default vnpay-button">
                                                    <img src="Views/client/img/vnpay-logo.jpg" alt="VNPay" style="width: 20px; height: 20px; margin-right: 5px;">
                                                    THANH TOÁN VNPAY
                                                </button>
                                                <div id="paypal-button-container" style="margin-top: 20px; margin-left: 40px; margin-right: 20px"></div>
                                            </td>
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
    <jsp:include page="layout/footer.jsp"></jsp:include>
        <!--link call API Paypal-->
        <script src="https://www.paypal.com/sdk/js?client-id=AbMHyeqSOaSIzMkzndDLlhV_i54_JdNJ86nyifuQoWeMUsZnTR9Etz3Hgjzh5D271TaD0Hv6Rj9Z5SA8"></script>
        <script>
            //thanh toán paypal
            paypal.Buttons({
                style: {
                    layout: 'vertical',
                    color: 'blue',
                    shape: 'rect',
                    label: 'paypal'
                },
                createOrder: function (data, actions) {
                    return actions.order.create({
                        intent: 'CAPTURE',
                        payer: {
                            name: {
                               given_name: "Vinh",
                               surname: "Tien"
                            },
                            address: {
                               address_line_1: "HaNoi",
                                address_line_2: "HoaLac",
                                admin_area_2: "California",
                                admin_area_1: "San Francisco",
                                postal_code: "123456",
                                country_code: "VN"
                            },
                           email_address: "vinhtien0123456@gmail.com",
                            phone: {
                                phone_type: "MOBILE",
                                phone_number: {
                                   national_number: "0968284633"
                                }
                            }
                        },
                        purchase_units: [{
                                amount: {
                                   value: "${b.calculateTotalPrice()/25000}",
                                    currency_code: "USD"
                                }
                            }]
                    });
                },
                onApprove: function (date, actions) {
                    //payment approved
                    return actions.order.capture().then(function (details) {
                        console.log(details);
                        orderId = details.id;
                        status = details.status;
                        alert("Cảm ơn bạn đã thanh toán, Mã giao dịch: " + orderId);
                    });
                },
                onCancel: function (data) {
                    //payment canceled
                    alert("Bạn đã hủy thanh toán bằng Paypal");
                },
                onError: function (err) {
                    alert("Thông tin thanh toán của bạn không đúng. Kiểm tra lại");
                }
            }).render("#paypal-button-container");
            //scroll
            document.addEventListener("DOMContentLoaded", function () {
                window.scrollTo(0, 100);
            });
            //display dịch vụ
            function closeModal() {
                var modal = document.getElementById('active_asset');
                modal.classList.remove('show');
                modal.classList.add('fade');
                setTimeout(function () {
                    modal.style.display = 'none';
                }, 300); // Thời gian delay để chuyển đổi hiệu ứng fade
            }
    </script>

    <style>
        .money{
            text-align: right;
            padding-left: 10px;
        }
        .typemoney{
            text-align: left;
        }
        .room-details {
            margin: 20px;
        }
        .room-details h3 {
            font-weight: bold;
        }
        .room-details img {
            width: 100%;
            max-width: 400px;
            height: auto;
            border-radius: 2%;
        }
        .service-selection {
            margin: 20px;
        }
        .service-selection h3 {
            margin-bottom: 10px;
        }
        .service-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
        }
        .service-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .service-item input {
            margin-right: 5px;
        }
        .button-group {
            margin-top: 10px;
        }
        .modal.show {
            display: block;
        }
        .modal.fade {
            opacity: 1;
        }
        .modal-dialog-centered {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: calc(100vh - 1rem);
        }
        .modal-content {
            width: 100%;
            max-width: 600px;
            margin: auto;
        }
        .modal-body{
            margin-top: 120px;
            background: white;
            position: relative;
            height: auto;
        }
        .breadcrumb_main1 {
            position: relative;
            text-align: center;
        }
        .centered-heading1 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 2em; /* Adjust the size as needed */
            z-index: 1; /* Ensure it appears above the image */
        }

        .breadcrumb_main1 img {
            width: 100%;
            height: auto;
        }
        .custom-tab li a {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-decoration: none;
        }

        .custom-tab .circle {
            width: 50px;
            height: 50px;
            background-color: #ff6f61;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .custom-tab span {
            font-size: 20px;
            color: #333;
        }

        .custom-tab li.active a .circle {
            background-color: #ff6f61; /* Same color as the image */
        }

        .custom-tab li.active a span {
            color: #333; /* Color for active tab text */
        }

        .custom-tab li.active a:after {
            content: '';
            display: block;
            width: 200px;
            height: 8px;
            background-color: #ff6f61;
            margin-top: 50px;
            margin-bottom: 20px
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
    </style>
</html>
