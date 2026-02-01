<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách nhân viên</title>
    <style>
        * { box-sizing: border-box; font-family: 'Segoe UI', sans-serif; }
        body { background-color: #f5f5f5; margin: 0; padding: 0; }
        .main-container { max-width: 1200px; margin: 30px auto; padding: 0 15px; }
        
        /* Header & Button */
        .list-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; border-bottom: 2px solid #eee; padding-bottom: 15px; }
        .page-title { color: #2c3e50; margin: 0; }
        .btn-add { background-color: #27ae60; color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none; font-weight: 600; display: inline-flex; align-items: center; gap: 8px; transition: 0.2s; }
        .btn-add:hover { background-color: #219150; transform: translateY(-2px); }

        /* Grid */
        .grid-container { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 25px; }

        /* Employee Card */
        .emp-card { background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 2px 10px rgba(0,0,0,0.08); transition: transform 0.2s; position: relative; border: 1px solid #eee; display: flex; flex-direction: column; align-items: center; padding: 30px 20px; text-align: center; cursor: pointer; }
        .emp-card:hover { transform: translateY(-5px); box-shadow: 0 5px 15px rgba(0,0,0,0.15); }
        
        /* Avatar */
        .emp-avatar { width: 100px; height: 100px; border-radius: 50%; object-fit: cover; margin-bottom: 15px; border: 3px solid #4a90e2; padding: 2px; }
        
        /* Text Info */
        .emp-name { font-size: 1.2em; font-weight: 700; color: #34495e; margin: 0 0 5px 0; }
        .emp-role { font-size: 0.9em; color: #7f8c8d; font-weight: 600; margin-bottom: 15px; background: #f0f2f5; padding: 4px 12px; border-radius: 15px; display: inline-block; }
        .emp-site { font-size: 0.85em; color: #555; margin-bottom: 5px; }
        .emp-phone { font-size: 0.9em; color: #666; display: flex; align-items: center; justify-content: center; gap: 5px; }

        /* Stretched Link */
        .stretched-link { position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 1; }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="list-header">
            <h2 class="page-title">Quản lý nhân viên</h2>
            <a href="employee-add" class="btn-add"><span>+</span> Thêm nhân viên</a>
        </div>

        <div class="grid-container">
            <c:forEach items="${listEmployee}" var="e">
                <div class="emp-card" onclick="location.href='detail-employee?id=${e.employeeId}'">
                    <img src="https://ui-avatars.com/api/?name=${e.lastName}+${e.firstName}&background=random&size=128" 
                         alt="Avatar" class="emp-avatar">
                    
                    <h3 class="emp-name">${e.fullName}</h3>

                    <div class="emp-role">
                        ${e.siteId == null || e.siteId == '' ? 'Super Admin' : 'Nhân viên bãi xe'}
                    </div>

                    <div class="emp-site">
                        🏢 ${e.siteId == null || e.siteId == '' ? 'Trụ sở chính' : e.siteId}
                    </div>

                    <div class="emp-phone">
                        📞 ${e.phone}
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>