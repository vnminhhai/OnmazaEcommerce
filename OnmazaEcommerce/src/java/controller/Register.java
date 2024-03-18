/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="Register", urlPatterns={"/register"})
public class Register extends HttpServlet {
   
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session==null|| session.getAttribute("User_Name")==null) {
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else response.sendRedirect(".");
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String first_name =(String) request.getAttribute("first_name");
        String last_name =(String) request.getAttribute("last_name");
        String phone =(String) request.getAttribute("phone");
        String address =(String) request.getAttribute("address");
        String country =(String) request.getAttribute("country");
        String email =(String) request.getAttribute("email");
        String User_Name = (String)request.getAttribute("User_Name");
        String Password = BCrypt.hashpw((String)request.getAttribute("Password"),BCrypt.gensalt(10));
        CustomerDAO cd = new CustomerDAO();
        
        Customer c = new Customer(0, first_name, last_name, email, phone, address, country, User_Name, Password, 0);
        cd.save(c);
        request.getSession().setAttribute("customer", cd.getRecordByName(User_Name));
        request.getSession().setAttribute("User_Name", User_Name);
        String current = (String)request.getSession().getAttribute("current");
        if (current==null) response.sendRedirect(".");
        else response.sendRedirect(current);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
