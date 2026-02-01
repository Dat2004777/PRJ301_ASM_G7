/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.site;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ParkingSite;
import test.ParkingSiteFakeDB;

/**
 *
 * @author Admin
 */
public class UpdateSite extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ParkingSiteFakeDB siteDAO = ParkingSiteFakeDB.getInstance();
        
        String id = request.getParameter("id");
        ParkingSite site = siteDAO.getById(id);
        
        if (site == null) {
            response.sendRedirect("site-list");
            return;
        }

        request.setAttribute("site", site);
        request.getRequestDispatcher("/manager/update-site.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        ParkingSiteFakeDB siteDAO = ParkingSiteFakeDB.getInstance();
        try {
            String id = request.getParameter("siteId"); // Input hidden
            String name = request.getParameter("siteName");
            String address = request.getParameter("address");
            String regionStr = request.getParameter("region"); 
            String statusStr = request.getParameter("status"); 

            // 3. Chuyển đổi String sang Enum
            ParkingSite.Region region = ParkingSite.Region.valueOf(regionStr);
            ParkingSite.Status status = ParkingSite.Status.valueOf(statusStr);

            ParkingSite updatedSite = new ParkingSite(
                id, 
                name, 
                address, 
                region, 
                status, 
                null 
            );

            siteDAO.update(updatedSite);

            response.sendRedirect("list-site");

        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Dữ liệu Enum không hợp lệ");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống");
        }
    }
}
