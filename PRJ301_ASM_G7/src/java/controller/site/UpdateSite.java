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
public class UpdateSite extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateSite</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSite at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ParkingSiteFakeDB siteDAO = new ParkingSiteFakeDB();
        
        String id = request.getParameter("id");
        ParkingSite site = siteDAO.getById(id);
        
        if (site == null) {
            response.sendRedirect("site-list");
            return;
        }

        request.setAttribute("site", site);
        request.getRequestDispatcher("/manager/update-site.jsp").forward(request, response);
    }

    // doPost: Xử lý dữ liệu form gửi về để cập nhật vào DB
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Cực kỳ quan trọng: Set Tiếng Việt để không bị lỗi font
        request.setCharacterEncoding("UTF-8");
        ParkingSiteFakeDB siteDAO = new ParkingSiteFakeDB();
        try {
            // 2. Lấy dữ liệu từ form (khớp với name="" trong thẻ input/select)
            String id = request.getParameter("siteId"); // Input hidden
            String name = request.getParameter("siteName");
            String address = request.getParameter("address");
            String regionStr = request.getParameter("region"); // Nhận về "NORTH", "SOUTH"...
            String statusStr = request.getParameter("status"); // Nhận về "ACTIVE", "CLOSED"...

            // 3. Chuyển đổi String sang Enum
            // Hàm valueOf() sẽ tìm Enum có tên khớp với chuỗi truyền vào
            ParkingSite.Region region = ParkingSite.Region.valueOf(regionStr);
            ParkingSite.Status status = ParkingSite.Status.valueOf(statusStr);

            // 4. Tạo đối tượng mới với thông tin đã sửa
            // Lưu ý: ManagerId tạm thời để null hoặc giữ nguyên logic cũ tùy bạn
            ParkingSite updatedSite = new ParkingSite(
                id, 
                name, 
                address, 
                region, 
                status, 
                null // Manager ID
            );

            // 5. Gọi FakeDB để update
            siteDAO.update(updatedSite);

            // 6. Thành công -> Quay về trang danh sách
            response.sendRedirect("list-site");

        } catch (IllegalArgumentException e) {
            // Xử lý lỗi nếu Enum không tồn tại (hack form)
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Dữ liệu Enum không hợp lệ");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống");
        }
    }
}
