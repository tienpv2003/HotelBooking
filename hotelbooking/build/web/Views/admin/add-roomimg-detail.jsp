<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
    <jsp:include page="layout/sidebar.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content mt-5">
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col">
                        <h3 class="page-title mt-2">Thêm Phòng</h3> 
                    </div>
                </div>
            </div>
            <c:if test="${not empty param.message}">
                <div class="alert alert-success">${param.message}</div>
            </c:if>  
            <c:if test="${not empty param.error}">
                <div class="alert alert-danger">${param.error}</div>
            </c:if>  
            <div class="row mt-3">
                <div class="col-lg-12">
                    <form action="add_room_img" method="post" enctype="multipart/form-data">
                        <div class="row formtype">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Tên Phòng</label>
                                    <select class="form-control" name="roomId" required>
                                        <c:forEach var="room" items="${rooms}">
                                            <option value="${room.roomId}">${room.roomName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>                          
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Tải lên ảnh</label>
                                    <div class="custom-file mb-3">
                                        <input type="file" class="custom-file-input" id="customFile" name="filenames" multiple required="" onchange="previewFiles()">
                                        <label class="custom-file-label" for="customFile">Chọn ảnh</label>
                                    </div>
                                    <div id="previewImgs" style="display: flex; flex-wrap: wrap;"></div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary buttonedit1 mt-4">Thêm ảnh cho phòng</button>
                    </form>
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
    <script src="Views/admin/assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="Views/admin/assets/plugins/datatables/datatables.min.js"></script>
    <script src="Views/admin/assets/js/script.js"></script>
    <script>
        $(function () {
            $('.datetimepicker').datetimepicker({
                format: 'YYYY-MM-DD HH:mm'
            });
        });

        function previewFiles() {
            var preview = document.getElementById('previewImgs');
            var files = document.querySelector('input[type=file]').files;
            preview.innerHTML = ''; // Clear the preview area

            if (files.length === 0) {
                preview.style.display = 'none';
                return;
            }

            preview.style.display = 'flex';

            Array.from(files).forEach(function (file) {
                var reader = new FileReader();
                reader.onload = function (event) {
                    var img = document.createElement('img');
                    img.src = event.target.result;
                    img.style.maxWidth = '100px';
                    img.style.margin = '5px';
                    img.style.height = 'auto';
                    preview.appendChild(img);
                };
                reader.readAsDataURL(file);
            });
        }
    </script>
</body>
</html>