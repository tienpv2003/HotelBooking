<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Hotel Dashboard Template</title>

        <link rel="shortcut icon" type="image/x-icon" href="Views/admin/assets/img/favicon.png">

        <link rel="stylesheet" href="Views/admin/assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/fontawesome.min.css">

        <link rel="stylesheet" href="Views/admin/assets/css/feathericon.min.css">
        <link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/morris/morris.css">

        <link rel="stylesheet" href="Views/admin/assets/css/style.css">

    </head>
    <body>

        <jsp:include page="layout/header.jsp"></jsp:include>
    <jsp:include page="layout/sidebar.jsp"></jsp:include>

            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="mt-5">
                                    <h4 class="card-title float-left mt-2">Bảng giá</h4>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <section class="pricing py-5">
                                <div class="container">
                                    <div class="row  mt-5">

                                        
                                        <div class="col-lg-6">
                                            <div class="card mb-5 mb-lg-0">
                                                <div class="card-body">
                                                    <h5 class="card-title text-muted text-uppercase text-center">Bảng giá dịch vụ</h5>
                                                    <h6 class="card-price text-center mt-3">Cập nhật mới nhất<span class="period"></span>
                                                    </h6>
                                                    <hr>
                                                    <ul class="fa-ul">
                                                        <li><span class="fa-li"><i class="fas fa-check"></i></span>Dịch vụ miễn phí</li>
                                                        <li><span class="fa-li"><i class="fas fa-check"></i></span>Dịch vụ mất phí
                                                        </li>
                                                                                                            </ul>
                                                    <a href="list_pricing_service" class="btn btn-block btn-primary text-uppercase">Xem ngay</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title text-muted text-uppercase text-center">Bảng giá loại phòng</h5>
                                                    <h6 class="card-price text-center mt-3">Cập nhật mới nhất<span class="period"></span>
                                                    </h6>
                                                    <hr>
                                                    <ul class="fa-ul">
                                                        <li><span class="fa-li"><i class="fas fa-check"></i></span>Các loại phòng khách sạn</li>
                                                        <li><span class="fa-li"><i class="fas fa-check"></i></span>Giá cho từng loại phòng
                                                        </li>
                                                        
                                                    </ul>
                                                    <a href="list_pricing_room" class="btn btn-block btn-primary text-uppercase">Xem ngay</a>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>

        <script src="Views/admin/assets/js/popper.min.js"></script>
        <script src="Views/admin/assets/js/bootstrap.min.js"></script>

        <script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="Views/admin/assets/plugins/raphael/raphael.min.js"></script>


        <script src="Views/admin/assets/js/script.js"></script>
    </body>
</html>