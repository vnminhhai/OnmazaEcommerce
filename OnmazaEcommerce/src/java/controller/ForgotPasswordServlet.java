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
            Customer c = dao.getRecordByName(username);
            if (!c.getEmail().equals(emailAddress)) {
                request.setAttribute("error", "Invalid email or user name!");
            } else {
                Email email = new Email();
                email.setFrom("kagaminelenvy@gmail.com");
                email.setFromPassword("hfpxzwcbtovedqem");
                email.setTo(emailAddress);
                email.setSubject("[ONMAZA ECOMMERCE] RESET YOUR PASSWORD");
                StringBuilder sb = new StringBuilder();
                sb.append("Hi, ").append(username).append("<br>");
                sb.append("Your password is <b>").append(c.getPassword()).append(" </b> <br>");
                sb.append("Thanks for trusting our service,<br>");
                sb.append("Onmaza Team");
                email.setContent(sb.toString());
                EmailUtils.send(email);
                request.setAttribute("mess", "A mail was send to your email address!");
            }
        } catch (Exception e) {
        }
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

}
