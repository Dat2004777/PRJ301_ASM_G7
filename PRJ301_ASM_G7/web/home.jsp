<%-- 
    Document   : home
    Created on : Jan 31, 2026, 4:42:48 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/main.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/homePage.css" />
        <title>Home page</title>
    </head>
    <body>
        <!-- header start -->
        <%@include file="components/header.jsp" %>
        <!-- header end -->

        <!-- slider start-->
        <section class="slider">
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="${pageContext.request.contextPath}/assests/img/Slider1.jpg" alt="First slide">
                    </div>
                </div>
            </div>
        </section>
        <!-- slider end -->

        <!-- content start -->
        <section class="content container">
            <h1 class="text-center my-5">Tổng quan</h1>

            <div class="row align-items-center g-5 mb-5">
                <div class="img-wrapper col-12 col-xl-6">
                    <img class="w-100 img-fluid border border-primary border-2 rounded-4" src="${pageContext.request.contextPath}/assests/img/img1.jpg"
                         alt="smart parking">
                </div>
                <div class="col-12 col-xl-6">
                    <h3>Tiên phong công nghệ đỗ xe 4.0</h3>
                    <p class="fs-5">
                        DMH Parking tái định nghĩa trải nghiệm gửi xe với hệ thống quản lý vận hành hoàn toàn tự động. Chúng
                        tôi ứng dụng công nghệ cảm biến IoT và nhận diện biển số AI giúp tối ưu hóa quy trình ra vào bãi,
                        loại bỏ hoàn toàn tình trạng ùn tắc vào giờ cao điểm. Không chỉ là nơi gửi xe, đây là một trạm trung
                        chuyển thông minh, an toàn tuyệt đối cho phương tiện của bạn.
                    </p>
                </div>
            </div>

            <div class="row align-items-center g-5 mb-5">
                <div class="col-12 col-xl-6">
                    <h3>Tối ưu không gian - Nâng tầm trải nghiệm</h3>
                    <p class="fs-5">
                        Với hạ tầng bãi đỗ xe cao tầng thông minh (Smart Stacking), DMH Parking giải quyết triệt để bài toán
                        thiếu hụt điểm đỗ tại đô thị. Hệ thống cho phép đặt chỗ trước (Booking Online), tìm vị trí trống
                        theo thời gian thực và thanh toán không tiền mặt chỉ với một chạm. Chúng tôi mang đến sự an tâm và
                        tiện nghi tối đa để bạn sẵn sàng cho mọi hành trình.
                    </p>
                </div>
                <div class="img-wrapper col-12 col-xl-6">
                    <img class="w-100 img-fluid border border-primary border-2 rounded-4" src="${pageContext.request.contextPath}/assests/img/img2.jpg"
                         alt="smart parking">
                </div>
            </div>
        </section>
        <!-- content end -->

        <!-- footer start -->
        <%@include file="components/footer.jsp" %>
        <!-- footer end -->
    </body>
</html>
