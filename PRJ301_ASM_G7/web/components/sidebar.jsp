<%@page contentType="text/html" pageEncoding="UTF-8" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/components/adminSideBar.css" />

<style>
    .logo-img {
        width: 60px;
        height: 60px;
        border-radius: 50%;
    }
</style>

<div>
    <nav class="navbar navbar-dark bg-dark d-lg-none">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <span class="navbar-brand ms-2">Admin Controller</span>
        </div>
    </nav>

    <div style="width: 280px; min-height: 100vh;" class="offcanvas-lg offcanvas-start bg-dark text-white" tabindex="-1" id="sidebarMenu" aria-labelledby="sidebarMenuLabel">

        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="sidebarMenuLabel">Menu</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" data-bs-target="#sidebarMenu" aria-label="Close"></button>
        </div>

        <div class="offcanvas-body p-0">
            <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"  >
                <a href="#!" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <img class="logo-img rounded-circle" src="${pageContext.request.contextPath}/assests/img/logoWebsite.jpg" alt="logo">
                    <span class="ms-2 fs-4">Admin Controller</span>
                </a>
                <hr>
                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item">
                        <a href="#!" class="nav-link text-white active" aria-current="page">
                            <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#home" />
                            </svg>
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="list-site" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#speedometer2" />
                            </svg>
                            Quản lí bãi xe
                        </a>
                    </li>
                    <li>
                        <a href="list-employee" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#table" />
                            </svg>
                            Quản lí nhân viên
                        </a>
                    </li>
                    <li>
                        <a href="#!" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#grid" />
                            </svg>
                            Thống kê doanh thu
                        </a>
                    </li>
                    <li>
                        <a href="#!" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#people-circle" />
                            </svg>
                            Cấu hình giá
                        </a>
                    </li>
                    <li>
                        <a href="#!" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#people-circle" />
                            </svg>
                            Lịch sử mua vé
                        </a>
                    </li>
                </ul>
                <hr>
                <div class="dropdown">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                       id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="${pageContext.request.contextPath}/assests/img/avt.jpg" alt="" width="32" height="32" class="rounded-circle me-2">
                        <strong>Nguyen Van A</strong>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                        <li><a class="dropdown-item" href="#!">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/assests/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assests/js/bootstrap.bundle.min.js"></script>