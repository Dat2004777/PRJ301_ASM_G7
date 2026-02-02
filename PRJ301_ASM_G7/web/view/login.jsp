<%-- 
    Document   : login
    Created on : Feb 1, 2026, 6:33:06 PM
    Author     : hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/main.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assests/css/login_register.css" />
    </head>
    <body class="bg-light d-flex align-items-center justify-content-center min-vh-100 py-4">
        <div class="card login-card rounded-5 shadow p-3 p-md-5 w-100 mx-3">

            <!--Login header-->
            <h2 class="text-center mb-4 mb-md-5 text-primary fw-semibold"
                style="letter-spacing: 2px">
                Đăng nhập
            </h2>

            <!--Login form-->
            <form action="login" method="post">

                <!--Username Input-->
                <div class="mb-3 mb-md-4">
                    <label class="form-label text-info fw-bold">Username</label>
                    <input type="text" class="form-control bg-input border-0 py-2"
                           placeholder="Tên đăng nhập" name="username" value="${username}" required>
                </div>

                <!--Password Input-->
                <div class="mb-3 mb-md-4">
                    <label class="form-label text-info fw-semibold">Password</label>
                    <input type="password" class="form-control bg-input border-0 py-2"
                           placeholder="Mật khẩu" name="password" required>
                </div>

                <!--Navigation-->
                <div class="d-flex flex-column flex-md-row justify-content-between gap-2 small mb-4">

                    <!--Back to homepage-->
                    <a href="#" class="text-decoration-none text-primary">
                        ← Quay lại trang chủ
                    </a>
                    
                    <!--Forget password + Sign up-->
                    <div class="text-md-end">
                        <a href="#" class="d-block text-decoration-none text-primary">
                            Quên mật khẩu?
                        </a>
                        <a href="#" class="d-block text-decoration-none text-primary">
                            Đăng kí tài khoản
                        </a>
                    </div>
                </div>
                
                <!--Button-->
                <button class="btn btn-primary w-100 py-2">
                    Đăng nhập
                </button>
            </form>
        </div>
    </body>
</html>
