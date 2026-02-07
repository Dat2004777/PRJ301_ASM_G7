<%-- Document : admin Created on : Feb 7, 2026, 2:08:06 AM Author : dat20 --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/components/adminSideBar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/main.css">
        <title>Admin Controller</title>
    </head>

    <body>
        <div class="d-lg-flex align-items-stretch" style="min-height: 100vh;">
            <div class="bg-dark">
                <jsp:include page="../../components/admin/sidebar.jsp">
                    <jsp:param name="activePage" value="admin"/>
                </jsp:include>
            </div>

            <div class="container-fluid">
                <div class="container py-4">

                    <div class="d-flex justify-content-between align-items-center border-bottom pb-3 mb-4">
                        <h2 class="h3 text-dark m-0">Tổng quan hệ thống</h2>
                    </div>

                    <div class="row d-flex justify-content-end align-items-center gap-2 mb-4 flex-md-row">
                        <div class="col-12 col-md-auto d-flex align-items-center gap-2">
                            <label class="fw-bold text-muted">Xem theo:</label>
                            <select class="form-select w-auto shadow-sm" id="timeFilter">
                                <option value="day">Hôm nay (Theo giờ)</option>
                                <option value="week" selected>Tuần này (Thứ 2 - CN)</option>
                                <option value="month">Tháng này (Ngày 1-30)</option>
                                <option value="year">Năm nay (Tháng 1-12)</option>
                            </select>
                        </div>
                        <div class="col-12 col-md-auto">                        
                            <button class="btn btn-primary w-100"><i class="bi bi-download"></i> Xuất báo cáo</button>
                        </div>
                    </div>

                    <div class="row row-cols-1 row-cols-lg-3 gap-4 gap-lg-0">
                        <div class="col">
                            <div class="card border-0 shadow-sm border-start border-primary border-4 w-100">
                                <div class="card-body">
                                    <div class="text-muted small text-uppercase fw-bold">Tổng doanh thu</div>
                                    <h3 class="mb-0 text-primary" id="totalRevenueDisplay">15,400,000 đ</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border-0 shadow-sm border-start border-success border-4 w-100">
                                <div class="card-body">
                                    <div class="text-muted small text-uppercase fw-bold">Số lượt xe</div>
                                    <h3 class="mb-0 text-success">1,245</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border-0 shadow-sm border-start border-warning border-4 w-100">
                                <div class="card-body">
                                    <div class="text-muted small text-uppercase fw-bold">Vé tháng mới</div>
                                    <h3 class="mb-0 text-warning">18</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/assests/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assests/js/bootstrap.bundle.min.js"></script>
</body>

</html>