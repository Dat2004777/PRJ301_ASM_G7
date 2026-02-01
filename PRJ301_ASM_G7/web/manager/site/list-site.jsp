<%-- 
    Document   : list-site
    Created on : 31 Jan 2026, 17:52:40
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.ParkingSite"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Site</title>
    </head>
    <body>

        <div class="main-container">

            

            <div class="filter-bar">
                <div class="filter-item">
                    <label>Lọc theo khu vực :</label>
                    <select class="filter-input">
                        <option value="">Tất cả khu vực</option>
                        <option value="North">Miền Bắc</option>
                        <option value="Central">Miền Trung</option>
                        <option value="South">Miền Nam</option>
                    </select>
                </div>
                <div class="filter-item">
                    <label>Tìm kiếm :</label>
                    <input type="text" class="filter-input" placeholder="Tên bãi, địa chỉ">
                </div>
            </div>
            <a href="add-site" class="btn-add">
                <span class="plus-icon">+</span> Thêm bãi xe mới
            </a>
            <div class="parking-grid">

                <c:forEach items="${siteList}" var="site">
                    <div class="parking-card" 
                         style="cursor: pointer;" 
                         onclick="location.href = 'site-detail?id=${site.siteId}'">

                        <img src="https://via.placeholder.com/600x300" alt="${site.siteName}" class="card-img-top">

                        <div class="card-body">
                            <div class="card-row">
                                <span class="site-name">${site.siteName}</span>
                                <span class="site-region">${site.region.label}</span>
                            </div>

                            <div class="card-row">
                                <span class="site-address">${site.address}</span>
                                <span class="status-badge status-${site.siteStatus}">
                                    ${site.siteStatus.label}
                                </span>
                            </div>

                            <div class="card-footer-row">
                                <span class="slots-info">150 slots</span>

                                <a href="booking?action=form&siteId=${site.siteId}" 
                                   class="btn-book"
                                   onclick="event.stopPropagation()">
                                    Đặt chỗ
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>       

                <div class="pagination">
                    <a href="#" class="page-item action">Trước</a>
                    <a href="#" class="page-item active">1</a>
                    <a href="#" class="page-item">2</a>
                    <a href="#" class="page-item action">Sau</a>
                </div>

            </div>

    </body>

    <style>
        /* Reset cơ bản */
        * {
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5; /* Màu nền xám nhẹ tổng thể */
            margin: 0;
            padding: 0;
        }

        /* Container chính để căn giữa nội dung dưới Header */
        .main-container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 15px;
            min-height: 80vh; /* Đảm bảo footer không bị đẩy lên */
        }

        /* --- Form Styles (Dùng cho trang Thêm/Sửa) --- */
        .form-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 40px;
            max-width: 600px;
            margin: 0 auto; /* Căn giữa màn hình */
            border: 3px solid #e0e0e0; /* Viền xám nhạt như ảnh */
        }

        .form-title {
            text-align: center;
            color: #2c3e50; /* Màu xanh đậm */
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 30px;
        }

        .sub-title {
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 20px;
            font-size: 1.1em;
            letter-spacing: 2px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            color: #00bcd4; /* Màu xanh sáng của label */
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 0.9em;
            letter-spacing: 1px;
        }

        .form-input {
            width: 100%;
            padding: 12px 15px;
            background-color: #dcdcdc; /* Màu nền input xám */
            border: none;
            border-radius: 5px;
            font-size: 14px;
            color: #333;
        }

        .form-input:focus {
            outline: 2px solid #00bcd4;
            background-color: #fff;
        }

        .btn-group {
            display: flex;
            justify-content: space-between; /* Đẩy 2 nút ra 2 bên */
            margin-top: 30px;
            gap: 20px;
        }

        .btn {
            flex: 1;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9em;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }

        .btn-cancel {
            background-color: #00bcd4; /* Màu xanh ngọc */
        }

        .btn-save {
            background-color: #2c3e50; /* Màu xanh đậm */
        }

        /* --- Listing Styles (Dùng cho trang Danh sách) --- */
        .filter-bar {
            background: white;
            padding: 15px 25px;
            border-radius: 10px;
            display: flex;
            gap: 30px;
            margin-bottom: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }

        .filter-item label {
            font-size: 0.85em;
            font-weight: 600;
            margin-right: 10px;
            color: #555;
        }

        .filter-input {
            background: #eee;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            min-width: 200px;
        }

        /* Grid Layout cho danh sách bãi xe */
        .parking-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* 2 Cột */
            gap: 30px;
        }

        .parking-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border: 1px solid #eee;
            display: flex;
            flex-direction: column;
        }

        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-body {
            padding: 15px 20px;
            background-color: #f0f0f0; /* Nền xám nhạt phần text */
        }

        .card-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        .site-name {
            font-size: 1.1em;
            font-weight: 600;
            color: #444;
        }

        .site-region {
            font-size: 0.9em;
            color: #333;
        }

        .site-address {
            font-size: 0.8em;
            color: #666;
            max-width: 60%;
        }

        .status-badge {
            font-size: 0.8em;
            font-weight: 600;
        }

        .status-active {
            color: #27ae60;
        } /* Xanh lá */
        .status-maintenance {
            color: #e67e22;
        } /* Cam */

        .card-footer-row {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .slots-info {
            font-size: 0.9em;
            color: #333;
        }

        .btn-book {
            background-color: #4a90e2; /* Xanh dương nhạt */
            color: white;
            padding: 5px 20px;
            border-radius: 15px;
            text-decoration: none;
            font-size: 0.85em;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 40px;
            gap: 5px;
        }

        .page-item {
            padding: 5px 15px;
            border: 1px solid #ddd;
            background: white;
            color: #333;
            text-decoration: none;
            font-size: 0.9em;
        }

        .page-item.active {
            background-color: #4a90e2;
            color: white;
            border-color: #4a90e2;
        }

        .page-item.action {
            background-color: #00bcd4; /* Màu xanh nút Trước/Sau */
            color: white;
            border: none;
        }

        /* Container cho header để căn nút sang phải */
        .list-header {
            display: flex;
            justify-content: space-between; /* Đẩy tiêu đề sang trái, nút sang phải */
            align-items: center; /* Căn giữa theo chiều dọc */
            margin-bottom: 30px; /* Cách phần danh sách ra một chút */
            padding-bottom: 15px;
            border-bottom: 2px solid #eee; /* Đường gạch chân nhẹ */
        }

        .page-title {
            color: #2c3e50;
            margin: 0;
        }

        /* Style cho nút Add */
        .btn-add {
            background-color: #27ae60; /* Màu xanh lá nổi bật */
            color: white;
            padding: 10px 20px;
            border-radius: 8px; /* Bo tròn góc */
            text-decoration: none; /* Bỏ gạch chân link */
            font-weight: 600;
            display: inline-flex; /* Để căn icon và chữ thẳng hàng */
            align-items: center;
            gap: 8px; /* Khoảng cách giữa dấu cộng và chữ */
            transition: background 0.2s, transform 0.1s;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1); /* Đổ bóng nhẹ cho nổi */
        }

        /* Hiệu ứng khi di chuột vào */
        .btn-add:hover {
            background-color: #219150; /* Màu xanh đậm hơn */
            transform: translateY(-2px); /* Nổi lên nhẹ */
        }

        /* Style cho dấu cộng */
        .plus-icon {
            font-size: 1.2em;
            font-weight: bold;
            line-height: 1;
        }
    </style>


</html>
