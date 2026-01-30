<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/homePage.css" />

<!-- navbar start -->
<nav class="navbar navbar-expand-xl navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/components/home.html">
            <img class="logo-img" src="${pageContext.request.contextPath}/assests/img/logoWebsite.jpg"
                alt="logoImage" />
            <h2 class="ms-2 mb-0">DMH Parking</h2>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link text-white" href="home.html">Trang chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="#experience">Đặt chỗ</a></li>
                <li class="nav-item me-2"><a class="nav-link" href="#projects">Mua vé</a></li>
                <div class="d-xl-flex">
                    <div class="me-xl-2 my-2 my-xl-0">
                        <a class="btn btn-outline-light rounded-3 w-100" href="#!">Đăng nhập</a>
                    </div>
                    <div class="my-2 my-xl-0">
                        <a class="btn btn-secondary px-4 rounded-3 w-100" href="#!">Đăng ký</a>
                    </div>
                </div>
            </ul>
        </div>
    </div>
</nav>
<!-- navbar end -->