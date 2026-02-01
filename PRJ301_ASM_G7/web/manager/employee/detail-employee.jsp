<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hồ sơ nhân viên: ${emp.fullName}</title>
    <style>
        /* CSS Detail - Giống Site Detail */
        body { background: #f5f5f5; margin: 0; font-family: 'Segoe UI', sans-serif; }
        .detail-container { max-width: 900px; margin: 40px auto; padding: 0 15px; }
        .detail-card { background: white; border-radius: 12px; padding: 40px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        
        .header-row { display: flex; align-items: center; justify-content: space-between; border-bottom: 2px solid #f0f0f0; padding-bottom: 20px; margin-bottom: 30px; }
        .profile-title h1 { margin: 0; color: #2c3e50; }
        .profile-subtitle { color: #7f8c8d; font-size: 1.1em; margin-top: 5px; }
        
        .action-btns a { text-decoration: none; padding: 10px 20px; border-radius: 5px; color: white; font-weight: bold; margin-left: 10px; }
        .btn-edit { background: #f39c12; }
        .btn-del { background: #e74c3c; }

        /* Bố cục nội dung: Trái Avatar - Phải Thông tin */
        .content-flex { display: flex; gap: 50px; align-items: flex-start; }
        .avatar-section { text-align: center; }
        .big-avatar { width: 200px; height: 200px; border-radius: 50%; object-fit: cover; border: 5px solid #ecf0f1; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        
        .info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 30px; width: 100%; }
        .info-item h3 { font-size: 0.9em; color: #bdc3c7; text-transform: uppercase; margin-bottom: 5px; }
        .info-item p { font-size: 1.2em; font-weight: 600; color: #2c3e50; margin: 0; }

        .back-link { display: block; margin-top: 40px; color: #3498db; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
    <div class="detail-container">
        <div class="detail-card">
            
            <div class="header-row">
                <div class="profile-title">
                    <h1>${emp.fullName}</h1>
                    <div class="profile-subtitle">Mã nhân viên: #${emp.employeeId}</div>
                </div>
                <div class="action-btns">
                    <a href="update-employee?id=${emp.employeeId}" class="btn-edit">✏️ Sửa</a>
                    <a href="delete-employee?id=${emp.employeeId}" class="btn-del" onclick="return confirm('Xóa nhân viên này?')">🗑️ Xóa</a>
                </div>
            </div>

            <div class="content-flex">
                
                <div class="avatar-section">
                    <img src="https://ui-avatars.com/api/?name=${emp.lastName}+${emp.firstName}&size=256" class="big-avatar">
                </div>

                <div class="info-grid">
                    <div class="info-item">
                        <h3>Tài khoản liên kết</h3>
                        <p>${emp.accountId}</p>
                    </div>

                    <div class="info-item">
                        <h3>Vai trò</h3>
                        <p style="color: ${emp.siteId == null ? '#e74c3c' : '#27ae60'}">
                            ${emp.siteId == null ? '⭐ Super Admin' : '👤 Staff'}
                        </p>
                    </div>

                    <div class="info-item">
                        <h3>Số điện thoại</h3>
                        <p>${emp.phone}</p>
                    </div>

                    <div class="info-item">
                        <h3>Nơi làm việc</h3>
                        <p>
                            ${emp.siteId == null ? 'Văn phòng trụ sở (Toàn quyền)' : emp.siteId}
                        </p>
                    </div>
                </div>
            </div>

            <a href="list-employee" class="back-link">← Quay lại danh sách</a>
        </div>
    </div>
</body>
</html>