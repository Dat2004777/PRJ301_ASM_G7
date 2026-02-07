package controller.site;

import dal.EmployeeDAO;
import dal.SiteDAO;
import model.ParkingSite;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Employee;
import utils.HttpUtils;

public class AddSite extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EmployeeDAO empDAO = new EmployeeDAO();

        List<Employee> empList = empDAO.getAll();

        request.setAttribute("empList", empList);

        request.getRequestDispatcher("views/manager/site/add-site.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        SiteDAO siteDAO = new SiteDAO();

        try {
            String name = request.getParameter("siteName");
            String address = request.getParameter("address");
            String regionStr = request.getParameter("region");
            String statusStr = request.getParameter("status");
            String managerIdStr = request.getParameter("manager");

            ParkingSite.Region region = ParkingSite.Region.valueOf(regionStr);
            ParkingSite.Status status = ParkingSite.Status.valueOf(statusStr);

            int managerId = HttpUtils.toInt(managerIdStr);

            ParkingSite newSite = new ParkingSite(
                    name,
                    address,
                    region,
                    status,
                    managerId
            );

            siteDAO.add(newSite);

            response.sendRedirect("list-site");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi thêm mới");
        }
    }
}
