/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.Validate;

/**
 *
 * @author ADMIN
 */
public class SignupServlet extends HttpServlet {

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
            out.println("<title>Servlet SignupServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        request.getRequestDispatcher("view/signup.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String password = request.getParameter("password_1");
        String confirmPass = request.getParameter("password_2");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");

        AccountDAO accDAO = new AccountDAO();

        boolean isUsernameExist = accDAO.getUsername(username);
        boolean isPasswordMismatch = !password.equals(confirmPass);
        boolean isEmailMismatch = !Validate.checkEmail(email);
        boolean isPhoneMismatch = !Validate.checkPhone(phone);
        System.out.println(isUsernameExist);
        // ===== GỮ GIÁ TRỊ NHẬP LẠI =====
        request.setAttribute("username", username);
        request.setAttribute("email", email);

        boolean hasError = false;

        // ===== CHECK USERNAME =====
        if (isUsernameExist) {
            request.setAttribute("errorUsername", "Tài khoản này đã tồn tại!");
            hasError = true;
        }

        // ===== CHECK PASSWORD =====
        if (isPasswordMismatch) {
            request.setAttribute("errorPass", "Mật khẩu không khớp!");
            hasError = true;
        }
        
        if(isEmailMismatch){
            request.setAttribute("errorEmail", "Email không hợp lệ!");
            hasError = true;
        }
        
        if(isPhoneMismatch){
            request.setAttribute("errorPhone", "SĐT không hợp lệ!");
            hasError = true;
        }
        
        // ===== NẾU CÓ LỖI → QUAY LẠI SIGNUP =====
        if (hasError) {
            request.getRequestDispatcher("view/signup.jsp")
                    .forward(request, response);
            return;
        }

        // ===== ĐĂNG KÝ THÀNH CÔNG =====
//        accDAO.insertAccount(username, password, email, phone, firstname, lastname);

        response.sendRedirect(request.getContextPath() + "/login");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
