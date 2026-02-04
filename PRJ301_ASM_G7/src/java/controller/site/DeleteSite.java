package controller.site;

import dal.SiteDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.HttpUtils;

public class DeleteSite extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SiteDAO siteDAO = new SiteDAO();

        try {
            String idStr = request.getParameter("id");
            
            if (idStr != null && !idStr.trim().isEmpty()) {

                int id = HttpUtils.toInt(idStr);
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
