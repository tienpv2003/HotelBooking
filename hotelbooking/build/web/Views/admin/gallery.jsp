<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Hotel Dashboard Template</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">

        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="../../../ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">

    </head>
    <body>

        <div class="main-wrapper">
            <%@include file="layout/header.jsp"%>
            <%@include file="layout/sidebar.jsp"%>
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <section class="container mt-5">
                        <h1 class="my-4 mt-5 text-center text-lg-left image_title">Image Gallery</h1>
                        <div class="row gallery">
                            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                                <a href="assets/img/product/product-01.jpg">
                                    <figure><img class="img-fluid img-thumbnail" src="assets/img/product/product-01.jpg" alt="Random Image"></figure>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                                <a href="assets/img/product/product-02.jpg">
                                    <figure><img class="img-fluid img-thumbnail" src="assets/img/product/product-02.jpg" alt="Random Image"></figure>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                                <a href="assets/img/product/product-03.jpg">
                                    <figure><img class="img-fluid img-thumbnail" src="assets/img/product/product-03.jpg" alt="Random Image"></figure>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                                <a href="assets/img/product/product-04.jpg">
                                    <figure><img class="img-fluid img-thumbnail" src="assets/img/product/product-04.jpg" alt="Random Image"></figure>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                                <a href="assets/img/product/product-05.jpg">
                                    <figure><img class="img-fluid img-thumbnail" src="assets/img/product/product-05.jpg" alt="Random Image"></figure>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                                <a href="assets/img/product/product-06.jpg">
                                    <figure><img class="img-fluid img-thumbnail" src="assets/img/product/product-06.jpg" alt="Random Image"></figure>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                                <a href="assets/img/product/product-07.jpg">
                                    <figure><img class="img-fluid img-thumbnail" src="assets/img/product/product-07.jpg" alt="Random Image"></figure>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                                <a href="assets/img/product/product-08.jpg">
                                    <figure><img class="img-fluid img-thumbnail" src="assets/img/product/product-08.jpg" alt="Random Image"></figure>
                                </a>
                            </div>
                        </div>
                    </section>
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
        <script src="../../../ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>

        <script src="assets/js/script.js"></script>
        <script>
            $(function () {
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'

                });
            });
            $(document).ready(function () {
                $(".gallery").magnificPopup({
                    delegate: "a",
                    type: "image",
                    tLoading: "Loading image #%curr%...",
                    mainClass: "mfp-img-mobile",
                    gallery: {
                        enabled: true,
                        navigateByImgClick: true,
                        preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
                    },
                    image: {
                        tError: '<a href="%url%">The image #%curr%</a> could not be loaded.'
                    }
                });
            });

        </script>
    </body>
</html>