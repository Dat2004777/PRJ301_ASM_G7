<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.ParkingSite" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật bãi xe</title>

        <style>
            /* Reset cơ bản */
            * {
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            body {
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            /* Container */
            .main-container {
                max-width: 1200px;
                margin: 30px auto;
                padding: 0 15px;
                min-height: 80vh;
            }

            /* Form Card */
            .form-card {
                background: white;
                border-radius: 20px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                padding: 40px;
                max-width: 600px;
                margin: 0 auto;
                border: 3px solid #e0e0e0;
            }
            .form-title {
                text-align: center;
                color: #2c3e50;
                text-transform: uppercase;
                letter-spacing: 1px;
                margin-bottom: 30px;
            }

            /* Form Elements */
            .form-group {
                margin-bottom: 20px;
            }
            .form-label {
                display: block;
                color: #00bcd4;
                font-weight: 600;
                margin-bottom: 8px;
                font-size: 0.9em;
                letter-spacing: 1px;
            }
            .form-input {
                width: 100%;
                padding: 12px 15px;
                background-color: #dcdcdc;
                border: none;
                border-radius: 5px;
                font-size: 14px;
                color: #333;
            }
            .form-input:focus {
                outline: 2px solid #00bcd4;
                background-color: #fff;
            }

            /* Buttons */
            .btn-group {
                display: flex;
                justify-content: space-between;
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
                background-color: #00bcd4;
            }
            .btn-save {
                background-color: #2c3e50;
            }
        </style>
    </head>

    <body>
        <%-- <jsp:include page="header.jsp" /> --%>

        <div class="main-container">
            <div class="form-card">
                <h2 class="form-title">
                    Cấu hình bãi xe: <span style="color: #4a90e2">${site.siteName}</span>
                </h2>

                <form action="update-site" method="post">

                    <input type="hidden" name="siteId" value="${site.siteId}">

                    <div class="form-group">
                        <label class="form-label">Tên bãi xe</label>
                        <input type="text" name="siteName" class="form-input" 
                               value="${site.siteName}" placeholder="Nhập tên bãi xe" required>
                    </div>

                    <%
                        request.setAttribute("enumRegions", ParkingSite.Region.values());
                        request.setAttribute("enumStatus", ParkingSite.Status.values());
                    %>

                    <div class="form-group">
                        <label class="form-label">Khu vực</label>
                        <select name="region" class="form-input">
                            <c:forEach items="${enumRegions}" var="r">
                                <option value="${r.name()}" ${site.region == r ? 'selected' : ''}>
                                    ${r.label}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Địa chỉ chi tiết</label>
                        <input type="text" name="address" class="form-input" 
                               value="${site.address}" placeholder="Nhập địa chỉ" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Trạng thái</label>
                        <select name="status" class="form-input">
                            <c:forEach items="${enumStatus}" var="s">
                                <option value="${s.name()}" ${site.siteStatus == s ? 'selected' : ''}>
                                    ${s.label}
                                </option>
                            </c:forEach>
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
</html>