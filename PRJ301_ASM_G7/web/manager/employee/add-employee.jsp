<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm nhân viên mới</title>
    <style>
        /* Paste lại CSS form từ bài trước để giống 100% */
        body { background: #f5f5f5; font-family: 'Segoe UI', sans-serif; }
        .main-container { max-width: 600px; margin: 40px auto; padding: 0 15px; }
        .form-card { background: white; padding: 40px; border-radius: 15px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .form-title { text-align: center; color: #2c3e50; margin-bottom: 30px; text-transform: uppercase; }
        .form-group { margin-bottom: 20px; }
        .form-label { display: block; font-weight: 600; color: #00bcd4; margin-bottom: 8px; }
        .form-input { width: 100%; padding: 12px; border-radius: 5px; border: 1px solid #ddd; background: #f9f9f9; }
        .btn-group { display: flex; gap: 15px; margin-top: 30px; }
        .btn { flex: 1; padding: 12px; border: none; border-radius: 5px; cursor: pointer; color: white; font-weight: bold; }
        .btn-save { background: #2c3e50; } .btn-cancel { background: #95a5a6; text-align: center; text-decoration: none; }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="form-card">
            <h2 class="form-title">Thêm nhân viên mới</h2>

            <form action="employee-add" method="post">
                
                <div class="form-group">
                    <label class="form-label">Tài khoản liên kết (Account ID)</label>
                    <input type="text" name="accountId" class="form-input" placeholder="Ví dụ: ACC005" required>
                </div>

                <div style="display: flex; gap: 15px;">
                    <div class="form-group" style="flex: 1;">
                        <label class="form-label">Họ (Last Name)</label>
                        <input type="text" name="lastName" class="form-input" placeholder="Nguyễn" required>
                    </div>
                    <div class="form-group" style="flex: 1;">
                        <label class="form-label">Tên (First Name)</label>
                        <input type="text" name="firstName" class="form-input" placeholder="Văn A" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Số điện thoại</label>
                    <input type="text" name="phone" class="form-input" placeholder="09xxx..." required>
                </div>

                <div class="form-group">
                    <label class="form-label">Nơi làm việc</label>
                    <select name="siteId" class="form-input">
                        <option value="">-- [Super Admin] Quản lý toàn hệ thống --</option>
                        
                        <c:forEach items="${listSites}" var="s">
                            <option value="${s.siteId}">
                                ${s.siteName} (${s.region.label})
                            </option>
                        </c:forEach>
                    </select>
                    <small style="color: #666; font-style: italic;">Để trống nếu là quản lý cấp cao.</small>
                </div>

                <div class="btn-group">
                    <a href="employee-list" class="btn btn-cancel">Quay lại</a>
                    <button type="submit" class="btn btn-save">Lưu nhân viên</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>