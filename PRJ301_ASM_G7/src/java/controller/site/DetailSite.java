package controller.site;

import dal.SiteDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ParkingSite;
import utils.HttpUtils;

/**
 *
 * @author Admin
 */
public class DetailSite extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        SiteDAO siteDAO = new SiteDAO();
        
        String idStr = request.getParameter("id");
        
        int id = HttpUtils.toInt(idStr);
        
        ParkingSite site = siteDAO.getById(id);
        
        if (site == null) {
            response.sendRedirect("site-list"); 
            return;
        }

        request.setAttribute("site", site);
        request.getRequestDispatcher("manager/site/site-detail.jsp").forward(request, response);
    }
}
