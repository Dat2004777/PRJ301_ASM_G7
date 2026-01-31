<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/components/header.css" />

<!-- navbar start -->
<nav class="navbar navbar-expand-xl navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="#!">
            <img class="logo-img" src="${pageContext.request.contextPath}/assests/img/logoWebsite.jpg" alt="logoImage" />
            <h2 class="ms-2 mb-0">DMH Parking</h2>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto fs-4">
                <li class="nav-item"><a class="nav-link active" href="#!">Trang chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Đặt chỗ</a></li>
                <li class="nav-item me-2"><a class="nav-link" href="#!">Mua vé</a></li>
                <div class="d-xl-flex align-items-center">
                    <!-- login signup -->

                    <div class="me-xl-2 my-2 my-xl-0">
                        <a class="btn btn-outline-light rounded-3 w-100" href="#!">Đăng nhập</a>
                    </div>
                    <div class="my-2 my-xl-0">
                        <a class="btn btn-dark px-4 rounded-3 w-100" href="#!">Đăng ký</a>
                    </div>

                    <!-- login signup -->

                    <!-- user signed -->
                     
                    <!-- <div class="d-flex flex-column align-items-end">
                        <h5 class="text-dark mb-0">Nguyễn Thành Đạt</h5>
                        <button class="bg-primary border border-0 text-white fs-6">Đăng xuất</button>
                    </div>
                    <div class="ms-2">
                        <img class="avt-img" src="${pageContext.request.contextPath}/assests/img/avt.jpg" alt="avatar">
                    </div> -->

                    <!-- user signed -->
                </div>
            </ul>
        </div>
    </div>
</nav>
<!-- navbar end -->