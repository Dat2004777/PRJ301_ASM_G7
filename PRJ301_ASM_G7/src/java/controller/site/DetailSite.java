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
public class DetailSite extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        ParkingSiteFakeDB siteDAO = ParkingSiteFakeDB.getInstance();
        
        ParkingSite site = siteDAO.getById(id);
        
        if (site == null) {
            response.sendRedirect("site-list"); 
            return;
        }

        request.setAttribute("site", site);
        request.getRequestDispatcher("manager/site/site-detail.jsp").forward(request, response);
    }
}
