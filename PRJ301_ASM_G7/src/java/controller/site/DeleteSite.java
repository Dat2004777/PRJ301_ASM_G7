package controller.site;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.ParkingSiteFakeDB;

public class DeleteSite extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ParkingSiteFakeDB siteDAO = ParkingSiteFakeDB.getInstance();
        
        try {
            String id = request.getParameter("id");
            
            if (id != null && !id.trim().isEmpty()) {
                
                siteDAO.delete(id);
                
            }
            
            response.sendRedirect("list-site");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("list-site");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}