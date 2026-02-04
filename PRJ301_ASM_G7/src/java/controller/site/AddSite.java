package controller.site;

import model.ParkingSite;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.ParkingSiteFakeDB;

public class AddSite extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        request.getRequestDispatcher("/manager/site/add-site.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        ParkingSiteFakeDB siteDAO = ParkingSiteFakeDB.getInstance();
        
        try {
            String name = request.getParameter("siteName");
            String address = request.getParameter("address");
            String regionStr = request.getParameter("region");
            String statusStr = request.getParameter("status");

            String newId = "SITE" + System.currentTimeMillis(); 
            
            
            ParkingSite.Region region = ParkingSite.Region.valueOf(regionStr);
            ParkingSite.Status status = ParkingSite.Status.valueOf(statusStr);


            ParkingSite newSite = new ParkingSite(
                newId, 
                name, 
                address, 
                region, 
                status, 
                null 
            );

            siteDAO.add(newSite);

            response.sendRedirect("list-site");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi thêm mới");
        }
    }
}