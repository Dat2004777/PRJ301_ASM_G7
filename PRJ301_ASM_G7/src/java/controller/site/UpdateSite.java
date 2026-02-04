/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.site;

import dal.EmployeeDAO;
import dal.SiteDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Employee;
import model.ParkingSite;
import utils.HttpUtils;

/**
 *
 * @author Admin
 */
public class UpdateSite extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SiteDAO siteDAO = new SiteDAO();
        EmployeeDAO empDAO = new EmployeeDAO();
        
        String idStr = request.getParameter("id");
        int id = HttpUtils.toInt(idStr);

        ParkingSite site = siteDAO.getById(id);
        List<Employee> empList = empDAO.getAll();

        if (site == null) {
            response.sendRedirect("list-site");
            return;
        }
        request.setAttribute("empList", empList);
        request.setAttribute("site", site);
        
        request.getRequestDispatcher("/manager/site/update-site.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        SiteDAO siteDAO = new SiteDAO();
        try {
            String idStr = request.getParameter("siteId"); // Input hidden
            String name = request.getParameter("siteName");
            String address = request.getParameter("address");
            String regionStr = request.getParameter("region");
            String statusStr = request.getParameter("status");
            String managerIdStr = request.getParameter("manager");

            int id = HttpUtils.toInt(idStr);
            int managerId = HttpUtils.toInt(managerIdStr);

            // 3. Chuyển đổi String sang Enum
            ParkingSite.Region region = ParkingSite.Region.valueOf(regionStr);
            ParkingSite.Status status = ParkingSite.Status.valueOf(statusStr);

            ParkingSite updatedSite = new ParkingSite(
                    id,
                    name,
                    address,
                    region,
                    status,
                    managerId
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
