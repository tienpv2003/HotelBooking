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
                                    <div class="row mt-5">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h3 class="card-title">Danh sách loại phòng và giá</h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-bordered">
                                                            <thead class="thead-dark">
                                                                <tr>
                                                                    <th scope="col">Loại phòng</th>
                                                                    <th scope="col">Giá loại phòng</th>
                                                                </tr>
                                                            </thead>
                                                        <c:forEach items="${roomTypeList}" var="i">
                                                            <tbody>
                                                                <tr>
                                                                    <td>${i.typeName}</td>
                                                                    <td>${i.roomTypePrice} VNĐ</td>
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
