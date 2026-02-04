<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách nhân viên</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f8f9fa; /* Bootstrap bg-light */
        }
        .hover-card {
            transition: transform 0.2s, box-shadow 0.2s;
            cursor: pointer;
        }
        .hover-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important; /* shadow-lg */
        }
    </style>
</head>

<body>
    
    <div class="d-lg-flex">
        <div>
            <%@include file="/components/sidebar.jsp" %>
        </div>
        
        <div>
            <div class="container py-4">
        
        <div class="d-flex justify-content-between align-items-center border-bottom pb-3 mb-4">
            <h2 class="h3 text-dark m-0">Quản lý nhân viên</h2>
            
            <a href="add-employee" class="btn btn-success d-flex align-items-center gap-2 shadow-sm">
                <span class="fw-bold fs-5 lh-1">+</span> 
                <span>Thêm nhân viên</span>
            </a>
        </div>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
            
            <c:forEach items="${listEmployee}" var="e">
                <div class="col">
                    <div class="card h-100 border-0 shadow-sm hover-card" 
                         onclick="location.href='detail-employee?id=${e.employeeId}'">
                        
                        <div class="card-body d-flex flex-column align-items-center p-4 text-center">
                            
                            <img src="https://ui-avatars.com/api/?name=${e.lastName}+${e.firstName}&background=random&size=128" 
                                 alt="Avatar" 
                                 class="rounded-circle border border-3 border-primary mb-3"
                                 width="100" height="100" 
                                 style="object-fit: cover;">
                            
                            <h5 class="card-title fw-bold text-dark mb-2">${e.fullName}</h5>

                            <div class="mb-3">
                                <span class="badge rounded-pill ${e.siteId == null || e.siteId == '' ? 'text-bg-danger' : 'text-bg-light text-secondary border'} px-3 py-2">
                                    ${e.siteId == null || e.siteId == '' ? 'Super Admin' : 'Nhân viên bãi xe'}
                                </span>
                            </div>

                            <p class="card-text small text-muted mb-1">
                                <i class="bi bi-building"></i> 🏢 
                                ${e.siteId == null || e.siteId == '' ? 'Trụ sở chính' : e.siteId}
                            </p>

                            <p class="card-text small text-muted">
                                <i class="bi bi-telephone"></i> 📞 ${e.phone}
                            </p>

                        </div>
                    </div>
                </div>
            </c:forEach>
            
        </div>
    </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>