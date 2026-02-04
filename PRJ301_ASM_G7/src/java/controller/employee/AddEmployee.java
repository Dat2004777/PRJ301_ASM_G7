package controller.employee;

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
public class AddEmployee extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SiteDAO siteDAO = new SiteDAO();

        List<ParkingSite> siteList = siteDAO.getAll();

        request.setAttribute("listSites", siteList);

        request.getRequestDispatcher("/manager/employee/add-employee.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EmployeeDAO empDAO = new EmployeeDAO();

        try {
            String accountIdStr = request.getParameter("accountId");
            String lastName = request.getParameter("lastName");
            String firstName = request.getParameter("firstName");
            String phone = request.getParameter("phone");
            String siteIdStr = request.getParameter("siteId");
            
            int accountId = HttpUtils.toInt(accountIdStr);
            int siteId = HttpUtils.toInt(siteIdStr);
            
            Employee newEmp = new Employee(accountId, firstName, lastName, phone, siteId);

            empDAO.add(newEmp);
            
            response.sendRedirect("list-employee");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi thêm mới");
        }

    }

}
