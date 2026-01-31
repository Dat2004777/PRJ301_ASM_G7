/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.site;

import java.io.IOException;
import java.io.PrintWriter;
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
public class DetailSite extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String id = req.getParameter("id");
        ParkingSiteFakeDB siteDAO = new ParkingSiteFakeDB();
        
        ParkingSite site = siteDAO.getById(id);
        
        if (site == null) {
            resp.sendRedirect("site-list"); 
            return;
        }

        req.setAttribute("site", site);
        req.getRequestDispatcher("manager/site-detail.jsp").forward(req, resp);
    }
}
