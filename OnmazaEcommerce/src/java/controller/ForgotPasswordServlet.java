/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.*;
import java.io.IOException;
import model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.*;

/**
 *
 * @author PC
 */
@WebServlet(urlPatterns = "/forgot")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String emailAddress = request.getParameter("email");
            String username = request.getParameter("username");
            CustomerDAO dao = new CustomerDAO();
            if (!dao.matchUsernameAndEmail(username, emailAddress)) {
                request.setAttribute("error", "Email hoặc tên đăng nhập sai!");
            } else {
                Email email = new Email();
                email.setFrom("kagaminelenvy@gmail.com");
                email.setFromPassword("hfpxzwcbtovedqem");
                email.setTo(emailAddress);
                email.setSubject("<BONG FAMILY>QUEN MAT KHAU");
                StringBuilder sb = new StringBuilder();
                sb.append("Xin chào, ").append(username).append("<br>");
                sb.append("Mật khẩu của bạn là <b>").append(account.getPass()).append(" </b> <br>");
                sb.append("Trân trọng,<br>");
                sb.append("Bống Family");
                email.setContent(sb.toString());
                EmailUtils.send(email);
                request.setAttribute("mess", "Mật khẩu đã được gửi đến mail của bạn. Xin vui lòng kiểm tra!");
            }
        } catch (Exception e) {
        }
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

}
