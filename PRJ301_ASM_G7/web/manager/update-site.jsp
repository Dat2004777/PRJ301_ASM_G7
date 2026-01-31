<%-- 
    Document   : update-site.jsp
    Created on : 31 Jan 2026, 18:00:22
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="main-container">
            <div class="form-card">
                <h2 class="form-title">
                    Cấu hình bãi xe: <span style="color: #4a90e2">${site.siteName}</span>
                </h2>

                <form action="site-controller" method="post">

                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="siteId" value="${site.siteId}">

                    <div class="form-group">
                        <label class="form-label">Tên bãi xe</label>
                        <input type="text" name="siteName" class="form-input" 
                               value="${site.siteName}" placeholder="Nhập tên bãi xe">
                    </div>

                    <div class="form-group">
                        <label class="form-label">Khu vực</label>
                        <select name="region" class="form-input">
                            <option value="North" ${site.region == 'North' ? 'selected' : ''}>Miền Bắc</option>
                            <option value="Central" ${site.region == 'Central' ? 'selected' : ''}>Miền Trung</option>
                            <option value="South" ${site.region == 'South' ? 'selected' : ''}>Miền Nam</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Địa chỉ chi tiết</label>
                        <input type="text" name="address" class="form-input" 
                               value="${site.address}" placeholder="Nhập địa chỉ">
                    </div>

                    <div class="form-group">
                        <label class="form-label">Trạng thái</label>
                        <select name="status" class="form-input">
                            <option value="Active" ${site.status == 'Active' ? 'selected' : ''}>Đang hoạt động</option>
                            <option value="Maintenance" ${site.status == 'Maintenance' ? 'selected' : ''}>Bảo trì</option>
                            <option value="Closed" ${site.status == 'Closed' ? 'selected' : ''}>Đóng cửa</option>
                        </select>
                    </div>

                    <div class="btn-group">
                        <button type="button" class="btn btn-cancel" onclick="history.back()">Hủy</button>
                        <button type="submit" class="btn btn-save">Lưu cấu hình</button>
                    </div>
                </form>
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
    </style>

</html>
