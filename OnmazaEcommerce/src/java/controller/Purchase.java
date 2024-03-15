/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CartDAO;
import dal.ItemDAO;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Item;
import model.Cart;
import model.Variant;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="Purchase", urlPatterns={"/purchase"})
public class Purchase extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String iraw = request.getParameter("item");
        if (iraw.equals("cart")) {
            Customer c = (Customer)session.getAttribute("customer");
            request.setAttribute("cart", new CartDAO().getCartByID(c.getId()));
            request.setAttribute("from_cart", true);
            request.getRequestDispatcher("order.jsp").forward(request, response);
        }
        else {
            String vname = request.getParameter("variant");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            ItemDAO id = new ItemDAO();
            Item i = id.getRecordById(Integer.parseInt(iraw));
            for (Variant v : i.getVariants()) {
                if (v.getName().equals(vname)) v.setStock_amount(quantity);
                else v.setStock_amount(0);
            }
            List<Item> l = new ArrayList<>();
            l.add(i);
            request.setAttribute("cart", new Cart(l));
            request.setAttribute("from_cart", false);
            request.getRequestDispatcher("order.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
