package controller.site;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.ParkingSiteFakeDB;

// URL pattern khớp với link bạn đã đặt trong file JSP: href="delete-site?id=..."
public class DeleteSite extends HttpServlet {

    /**
     * Xử lý phương thức GET (Vì link xóa là thẻ <a> nên mặc định là GET)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ParkingSiteFakeDB siteDAO = new ParkingSiteFakeDB();
        
        try {
            // 1. Lấy ID từ tham số URL (ví dụ: delete-site?id=SITE001)
            String id = request.getParameter("id");
            
            // Kiểm tra nếu ID null hoặc rỗng thì không làm gì cả
            if (id != null && !id.trim().isEmpty()) {
                
                // 2. Gọi FakeDB để xóa
                siteDAO.delete(id);
                
                // (Tùy chọn) Bạn có thể thêm thông báo vào session để hiển thị bên trang list
                // request.getSession().setAttribute("message", "Đã xóa thành công bãi xe " + id);
            }
            
            // 3. Xóa xong thì chuyển hướng (Redirect) về trang danh sách
            // Dùng sendRedirect để tránh việc user reload trang lại kích hoạt lệnh xóa lần nữa
            response.sendRedirect("list-site");
            
        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi, có thể chuyển về trang lỗi hoặc quay lại list
            response.sendRedirect("list-site");
        }
    }

    /**
     * Phương thức POST thường không dùng cho link xóa đơn giản, 
     * trừ khi bạn dùng form submit để bảo mật hơn.
     * @param request
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}