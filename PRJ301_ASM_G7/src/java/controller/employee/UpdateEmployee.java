/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Employee;
import model.ParkingSite;
import test.EmployeeFakeDB;
import test.ParkingSiteFakeDB;

/**
 *
 * @author Admin
 */
public class UpdateEmployee extends HttpServlet {


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
        EmployeeFakeDB empDAO = EmployeeFakeDB.getInstance();
        
        String empId = request.getParameter("id");
        Employee emp = empDAO.getById(empId);     
        request.setAttribute("emp", emp);
        
        ParkingSiteFakeDB siteDAO = ParkingSiteFakeDB.getInstance();
        
        List<ParkingSite> siteList = siteDAO.getAll();
        request.setAttribute("listSites", siteList);
        
        request.getRequestDispatcher("/manager/employee/update-employee.jsp").forward(request, response);
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
        EmployeeFakeDB empDAO = EmployeeFakeDB.getInstance();

        try {
            String empId = request.getParameter("employeeId");
            String accountId = request.getParameter("accountId");
            String lastName = request.getParameter("lastName");
            String firstName = request.getParameter("firstName");
            String phone = request.getParameter("phone");
            String siteId = request.getParameter("siteId");
            
            Employee newEmp = new Employee(empId, accountId, firstName, lastName, phone, siteId);

            empDAO.update(newEmp);
            
            response.sendRedirect("list-employee");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi thêm mới");
        }
    }


}
