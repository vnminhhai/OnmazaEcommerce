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
import model.Customer;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="Register", urlPatterns={"/register"})
public class Register extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet Register</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String country = request.getParameter("country");
        String email = request.getParameter("email");
        if (first_name==null||last_name==null||phone==null||address==null||country==null||email==null)
            request.setAttribute("info_message", "Please fill in all the information!");
        String User_Name = request.getParameter("User_Name");
        String Password = request.getParameter("Password");
        String rePassword = request.getParameter("rePassword");
        CustomerDAO cd = new CustomerDAO();
        if (User_Name==null||Password==null)
        {
            request.setAttribute("message","User name and Password is required!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else if (cd.getRecordByName(User_Name)!=null)
        {
            request.setAttribute("message", "User name already existed!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else if (!Password.equals(rePassword))
        {
            request.setAttribute("message", "Passwords not matching!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else {
            Customer c = new Customer(0, first_name, last_name, email, phone, address, country, User_Name, Password);
            cd.save(c);
            request.getSession().setAttribute("customer", cd.getRecordByName(User_Name));
            request.getSession().setAttribute("User_Name", User_Name);
            String current = (String)request.getSession().getAttribute("current");
            if (current==null) response.sendRedirect(".");
            else response.sendRedirect(current);
        }
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
