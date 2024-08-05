<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

﻿<!DOCTYPE html>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
    <jsp:include page="layout/sidebar.jsp"></jsp:include>
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title mt-5">Add Staff</h3>
                                <c:if test="${not empty message}">
                                    <div class="alert alert-danger">${message}</div>
                                </c:if>
                                <c:if test="${not empty message1}">
                                    <div class="alert alert-success">${message1}</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form action="add_staff" method="POST">                               
                                <div class="row formtype">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Customer Email</label>
                                            <input class="form-control" type="text" name="customerEmail" value="<%= request.getParameter("customerEmail") %>">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Staff Email</label>
                                            <input class="form-control" type="text" name="staffEmail" required>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary buttonedit ml-2">Send</button>                              
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>

        <script src="Views/admin/assets/js/popper.min.js"></script>
        <script src="Views/admin/assets/js/bootstrap.min.js"></script>
        <script src="Views/admin/assets/js/moment.min.js"></script>
        <script src="Views/admin/assets/js/select2.min.js"></script>

        <script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="Views/admin/assets/plugins/raphael/raphael.min.js"></script>

        <script src="Views/admin/assets/js/bootstrap-datetimepicker.min.js"></script>

        <script src="Views/admin/assets/js/script.js"></script>
        <script>
            $(function () {
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'

                });
            });
        </script>
    </body>
</html>