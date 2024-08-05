<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
    
    <!-- start breadcrumb -->
    <section class="breadcrumb_main_area margin-bottom-80">
        <div class="container-fluid">
            <div class="row">
                <div class="breadcrumb_main1" style="padding-top: 0px; padding-bottom: 0px; position: relative;">
                    <h2 class="centered-heading1">Kết quả thanh toán</h2>
                    <img src="Views/client/img/gallery-breadcrumb.jpg" alt="breadcrumb image" style="width: 100%;">
                    <!-- special offer start -->
                    <div class="special_offer_main">
                        <div class="container">
                            <div class="special_offer_sub" style="position: absolute">
                                <img src="Views/client/img/special-offer-yellow-main.png" alt="special offer image">
                            </div>
                        </div>
                    </div>
                    <!-- end offer start -->
                </div>
            </div>
        </div>
    </section>
    <!-- end breadcrumb -->

    <div class="container bootstrap snippets bootdey" style="margin-top: 20px;">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 text-center">
                        <c:choose>
                            <c:when test="${param.vnp_ResponseCode == '00'}">
                                <h4 class="text-success"><strong>Thanh toán thành công!</strong></h4>
                                <p>Mã giao dịch của bạn là: <strong>${msgPayment}</strong></p>
                            </c:when>
                            <c:otherwise>
                                <h4 class="text-danger"><strong>Thanh toán thất bại!</strong></h4>
                                <p>Mã lỗi: <strong>${msgPayment}</strong></p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="row text-center" style="margin-top: 20px;">
                    <div class="col-md-12">
                        <a href="home" class="btn btn-primary">Trở về trang chủ</a>
                        <a href="booking_history" class="btn btn-secondary">Lịch sử thanh toán</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="layout/footer.jsp"></jsp:include>
    <style>
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
    </style>
</html>
