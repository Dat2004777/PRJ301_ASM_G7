<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật nhân viên</title>
    <style>
        body { background: #f5f5f5; font-family: 'Segoe UI', sans-serif; }
        .main-container { max-width: 600px; margin: 40px auto; padding: 0 15px; }
        .form-card { background: white; padding: 40px; border-radius: 15px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .form-title { text-align: center; color: #2c3e50; margin-bottom: 30px; text-transform: uppercase; }
        .form-group { margin-bottom: 20px; }
        .form-label { display: block; font-weight: 600; color: #00bcd4; margin-bottom: 8px; }
        .form-input { width: 100%; padding: 12px; border-radius: 5px; border: 1px solid #ddd; background: #f9f9f9; }
        .btn-group { display: flex; gap: 15px; margin-top: 30px; }
        .btn { flex: 1; padding: 12px; border: none; border-radius: 5px; cursor: pointer; color: white; font-weight: bold; }
        .btn-save { background: #f39c12; } /* Màu cam cho Update */
        .btn-cancel { background: #95a5a6; text-align: center; text-decoration: none; }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="form-card">
            <h2 class="form-title">Cập nhật: ${emp.fullName}</h2>

            <form action="update-employee" method="post">
                <input type="hidden" name="employeeId" value="${emp.employeeId}">

                <div class="form-group">
                    <label class="form-label">Account ID</label>
                    <input type="text" name="accountId" class="form-input" value="${emp.accountId}" readonly style="background: #eee;">
                </div>

                <div style="display: flex; gap: 15px;">
                    <div class="form-group" style="flex: 1;">
                        <label class="form-label">Họ</label>
                        <input type="text" name="lastName" class="form-input" value="${emp.lastName}" required>
                    </div>
                    <div class="form-group" style="flex: 1;">
                        <label class="form-label">Tên</label>
                        <input type="text" name="firstName" class="form-input" value="${emp.firstName}" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Số điện thoại</label>
                    <input type="text" name="phone" class="form-input" value="${emp.phone}" required>
                </div>

                <div class="form-group">
                    <label class="form-label">Nơi làm việc</label>
                    <select name="siteId" class="form-input">
                        <option value="" ${emp.siteId == null ? 'selected' : ''}>-- [Super Admin] --</option>
                        
                        <c:forEach items="${listSites}" var="s">
                            <option value="${s.siteId}" ${emp.siteId == s.siteId ? 'selected' : ''}>
                                ${s.siteName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="btn-group">
                    <button type="button" class="btn btn-cancel" onclick="history.back()">Hủy</button>
                    <button type="submit" class="btn btn-save">Lưu thay đổi</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>