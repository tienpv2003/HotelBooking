<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Hotel Dashboard Template</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="assets/css/style.css"> </head>

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
                                    <h4 class="card-title float-left mt-2">Blog</h4> <a href="add-blog.html" class="btn btn-primary float-right veiwbutton">Add Blog</a> </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                            <div class="card"> <img class="card-img" src="assets/img/product/product-01.jpg" alt="">
                                <div class="card-img-overlay"> <a href="#" class="btn btn-light btn-sm">Hotel</a> </div>
                                <div class="card-body">
                                    <h4 class="card-title">adipiscing elit, sed do eiusmod?</h4>
                                    <p class="card-text mt-3">Lorem ipsum dolor sit amet, consectetur em adipiscing elit, sed do eiusmod tempor incididunt ut labore etmis dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco sit laboris. </p> <a href="#" class="btn btn-info">Read More</a> </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                            <div class="card"> <img class="card-img" src="assets/img/product/product-02.jpg" alt="">
                                <div class="card-img-overlay"> <a href="#" class="btn btn-light btn-sm">Hotel</a> </div>
                                <div class="card-body">
                                    <h4 class="card-title">quis nostrud exercitation ullamco?</h4>
                                    <p class="card-text mt-3">Lorem ipsum dolor sit amet, consectetur em adipiscing elit, sed do eiusmod tempor incididunt ut labore etmis dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco sit laboris. </p> <a href="#" class="btn btn-info">Read More</a> </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                            <div class="card"> <img class="card-img" src="assets/img/product/product-03.jpg" alt="">
                                <div class="card-img-overlay"> <a href="#" class="btn btn-light btn-sm">Hotel</a> </div>
                                <div class="card-body">
                                    <h4 class="card-title">sed do eiusmod tempor incididunt?</h4>
                                    <p class="card-text mt-3">Lorem ipsum dolor sit amet, consectetur em adipiscing elit, sed do eiusmod tempor incididunt ut labore etmis dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco sit laboris. </p> <a href="#" class="btn btn-info">Read More</a> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/plugins/datatables/datatables.min.js"></script>
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