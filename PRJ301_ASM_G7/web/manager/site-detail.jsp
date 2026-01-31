<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết bãi xe: ${site.siteName}</title>

    <style>
        /* Reset cơ bản */
        * { box-sizing: border-box; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { background-color: #f5f5f5; margin: 0; padding: 0; }

        /* Container chính */
        .detail-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 0 15px;
        }

        /* Thẻ Card lớn chứa thông tin */
        .detail-card {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08); /* Bóng đổ nhẹ */
            border: 1px solid #eaeaea;
        }

        /* Phần Header của Card (Tên + Nút bấm) */
        .detail-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #f5f5f5;
        }

        .page-title {
            color: #2c3e50;
            margin: 0;
            font-size: 2em;
            font-weight: 700;
        }

        /* Nhóm nút hành động */
        .action-buttons {
            display: flex;
            gap: 15px; /* Khoảng cách giữa các nút */
        }

        .btn-action {
            text-decoration: none;
            padding: 10px 25px;
            border-radius: 8px;
            font-weight: 600;
            color: white;
            transition: opacity 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 8px; /* Khoảng cách giữa icon và chữ */
        }

        .btn-action:hover { opacity: 0.9; }

        .btn-edit { background-color: #f39c12; /* Màu cam */ }
        .btn-delete { background-color: #e74c3c; /* Màu đỏ */ }

        /* Ảnh Banner lớn */
        .site-banner {
            width: 100%;
            height: 350px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 40px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        /* Lưới thông tin (Grid Layout 2 cột) */
        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr; /* Chia đôi màn hình */
            gap: 40px;
        }

        .info-group h3 {
            color: #7f8c8d;
            font-size: 0.9em;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }

        .info-value {
            font-size: 1.2em;
            font-weight: 600;
            color: #34495e;
            margin: 0;
        }

        /* Badge trạng thái */
        .status-badge {
            display: inline-block;
            padding: 6px 15px;
            border-radius: 20px;
            font-size: 0.9em;
            font-weight: bold;
        }
        .status-ACTIVE { background-color: #eafaf1; color: #27ae60; }
        .status-MAINTERNANCE { background-color: #fdf2e9; color: #e67e22; } /* Lưu ý chính tả Enum của bạn */
        .status-CLOSED { background-color: #fce4e4; color: #c0392b; }

        /* Footer của Card */
        .card-footer-line {
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .link-back {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
            font-size: 1.1em;
            transition: transform 0.2s;
            display: inline-block;
        }

        .link-back:hover {
            transform: translateX(-5px); /* Hiệu ứng lùi nhẹ khi hover */
            text-decoration: underline;
        }
    </style>
</head>

<body>

    <div class="detail-container">
        <div class="detail-card">
            
            <div class="detail-header">
                <h1 class="page-title">${site.siteName}</h1>

                <div class="action-buttons">
                    <a href="update-site?id=${site.siteId}" class="btn-action btn-edit">
                        <span>✏️</span> Chỉnh sửa
                    </a>

                    <a href="delete-site?id=${site.siteId}" 
                       onclick="return confirm('CẢNH BÁO: Bạn có chắc chắn muốn xóa bãi xe này không?')" 
                       class="btn-action btn-delete">
                        <span>🗑️</span> Xóa bãi xe
                    </a>
                </div>
            </div>

            <img src="https://via.placeholder.com/1200x400" alt="${site.siteName}" class="site-banner">

            <div class="info-grid">

                <div class="info-group">
                    <h3>Mã định danh</h3>
                    <p class="info-value">#${site.siteId}</p>
                </div>

                <div class="info-group">
                    <h3>Trạng thái vận hành</h3>
                    <span class="status-badge status-${site.siteStatus}">
                        ${site.siteStatus.label}
                    </span>
                </div>

                <div class="info-group">
                    <h3>Khu vực địa lý</h3>
                    <p class="info-value">${site.region.label}</p>
                </div>

                <div class="info-group">
                    <h3>Địa chỉ cụ thể</h3>
                    <p class="info-value">${site.address}</p>
                </div>

                <div class="info-group">
                    <h3>Quản lý phụ trách</h3>
                    <p class="info-value">
                        ${site.managerId != null ? site.managerId : '<span style="color:#ccc; font-style:italic">Chưa chỉ định</span>'}
                    </p>
                </div>

                <div class="info-group">
                    <h3>Sức chứa thiết kế</h3>
                    <p class="info-value">150 Slots (Demo)</p>
                </div>

            </div>

            <div class="card-footer-line">
                <a href="list-site" class="link-back">← Quay lại danh sách</a>
            </div>

        </div>
    </div>

</body>
</html>