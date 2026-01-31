package controller.site;

import model.ParkingSite;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.ParkingSiteFakeDB;

public class AddSite extends HttpServlet {

    /**
     * doGet: Mở trang form trống để người dùng nhập liệu
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Vì dùng chung form với Update, ta không gửi attribute "site" sang.
        // Bên JSP sẽ thấy "site" là null => Form tự hiểu là đang Thêm mới.
        
        // (Tùy chọn) Nếu bạn dùng cách gửi Enum từ Servlet thì uncomment 2 dòng dưới:
        // request.setAttribute("listRegions", ParkingSite.Region.values());
        // request.setAttribute("listStatus", ParkingSite.Status.values());

        request.getRequestDispatcher("/manager/add-site.jsp").forward(request, response);
    }

    /**
     * doPost: Nhận dữ liệu từ form và Lưu mới vào DB
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Luôn set UTF-8 đầu tiên
        request.setCharacterEncoding("UTF-8");
        ParkingSiteFakeDB siteDAO = new ParkingSiteFakeDB();
        try {
            // 2. Lấy dữ liệu từ form
            String name = request.getParameter("siteName");
            String address = request.getParameter("address");
            String regionStr = request.getParameter("region");
            String statusStr = request.getParameter("status");

            // 3. Tự sinh ID (Vì FakeDB không có Auto Increment)
            // Logic: Dùng từ khóa "SITE" + thời gian hiện tại (milisecond) để không bị trùng
            String newId = "SITE" + System.currentTimeMillis(); 
            // Kết quả sẽ giống: SITE17067182933

            // 4. Convert Enum
            ParkingSite.Region region = ParkingSite.Region.valueOf(regionStr);
            ParkingSite.Status status = ParkingSite.Status.valueOf(statusStr);

            // 5. Tạo đối tượng mới
            ParkingSite newSite = new ParkingSite(
                newId, 
                name, 
                address, 
                region, 
                status, 
                null // Manager tạm thời để null
            );

            // 6. Gọi FakeDB để thêm mới
            siteDAO.add(newSite);

            // 7. Thêm xong quay về danh sách
            response.sendRedirect("list-site");

        } catch (Exception e) {
            e.printStackTrace();
            // Nếu lỗi, quay lại trang form (có thể kèm thông báo lỗi nếu muốn)
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi thêm mới");
        }
    }
}