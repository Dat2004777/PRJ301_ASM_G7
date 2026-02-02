<%-- 
    Document   : signup
    Created on : Feb 1, 2026, 7:49:52 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/main.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/login_register.css" />

        <title>Sign Up</title>
    </head>
    <body class="bg-light d-flex align-items-center justify-content-center min-vh-100 py-4">
        <div class="card login-card shadow rounded-5
             p-3 p-md-5
             w-100 mx-3">

            <h2 class="text-center mb-4 mb-md-5 text-primary fw-semibold" style="letter-spacing:2px;">
                Đăng ký
            </h2>

            <form>
                <!-- Username -->
                <div class="mb-3 mb-md-4">
                    <label class="form-label text-info fw-bold">Username</label>
                    <input type="text" class="form-control bg-input border-0 py-2" 
                           placeholder="Tên đăng nhập" name="username" value="${username}" required>
                </div>

                <!-- Password -->
                <div class="mb-3 mb-md-4">
                    <label class="form-label text-info fw-semibold">Password</label>
                    <input type="password" class="form-control bg-input border-0 py-2" 
                           placeholder="Mật khẩu" name="password_1" required>
                </div>

                <!-- Confirm Password -->
                <div class="mb-3 mb-md-4">
                    <label class="form-label text-info fw-semibold">Confirm Password</label>
                    <input type="password" class="form-control bg-input border-0 py-2" 
                           placeholder="Mật khẩu" name="password_2"  required>
                </div>

                <!-- Email -->
                <div class="mb-3 mb-md-4">
                    <label class="form-label text-info fw-semibold">Email</label>
                    <input type="text" class="form-control bg-input border-0 py-2" 
                           placeholder="Email" name="email" required>
                </div>

                <!-- Phone -->
                <div class="mb-3 mb-md-4">
                    <label class="form-label text-info fw-semibold">Phone</label>
                    <input type="text" class="form-control bg-input border-0 py-2" 
                           placeholder="Phone" name="phone">
                </div>
                <div class="row">
                    <!-- First name -->
                    <div class="col-12 col-md-6 mb-3 mb-md-4">
                        <label class="form-label text-info fw-semibold">First name</label>
                        <input type="text" class="form-control bg-input border-0 py-2" 
                               placeholder="First name" name="firstname" required>
                    </div>

                    <!-- Last name -->
                    <div class="col-12 col-md-6 mb-3 mb-md-4">
                        <label class="form-label text-info fw-semibold">Last name</label>
                        <input type="text" class="form-control bg-input border-0 py-2" 
                               placeholder="Last name" name="lastname" required>
                    </div>
                </div>

                <!-- Links -->
                <div class="d-flex flex-column flex-md-row
                     justify-content-between gap-2
                     small mb-4">

                    <a href="#" class="text-decoration-none text-primary">
                        ← Quay lại trang chủ
                    </a>

                    <div class="text-md-center">
                        <a href="#" class="d-block text-decoration-none text-primary">
                            Đã có tài khoản
                        </a>
                        <a href="login" class="d-block text-decoration-none text-primary">
                            Đăng nhập
                        </a>
                    </div>
                </div>

                <!-- Button -->
                <button class="btn btn-primary w-100 py-2">
                    Đăng ký
                </button>
            </form>

        </div>

    </body>
</html>
