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
                                <h3 class="page-title mt-5">Add Leave</h3> </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form>
                                <div class="row formtype">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Leave Type</label>
                                            <select class="form-control" id="sel1" name="sellist1">
                                                <option value=""> Select </option>
                                                <option value="Casual Leave"> Casual Leave </option>
                                                <option value="Medical leave"> Medical Leave </option>
                                                <option value="loss of pay"> Loss of Pay </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>From</label>
                                            <div class="cal-icon">
                                                <input type="text" class="form-control datetimepicker"> </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>To</label>
                                            <div class="cal-icon">
                                                <input type="text" class="form-control datetimepicker"> </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Number Of Days</label>
                                            <input type="text" class="form-control" id="usr"> </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Remaining Days</label>
                                            <input type="text" class="form-control" id="usr1"> </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Leave Reason</label>
                                            <textarea class="form-control" rows="5" id="comment" name="text"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary buttonedit mt-5">Send Leave Request</button>
                </div>
            </div>
        </div>
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
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