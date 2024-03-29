/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CartDAO;
import dal.ItemDAO;
import dal.OrderDAO;
import dal.VariantDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Detail;
import model.Item;
import model.Variant;

/**
 *
 * @author ADMIN
 */
public class ConfirmOrder extends HttpServlet {
    
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
        if (request.getParameter("clear_cart").equals("false")) {
        ItemDAO itd = new ItemDAO();
        VariantDAO vd = new VariantDAO();
        int id = Integer.parseInt(request.getParameter("item"));
        int left = vd.getRecordByName(id, request.getParameter("variant")).getStock_amount()-Integer.parseInt(request.getParameter("quantity"));
        if (left <0||Integer.parseInt(request.getParameter("quantity"))<=0) {
            request.setAttribute("mess", "Invalid number of item.");
            request.getRequestDispatcher("order.jsp").forward(request, response);
            return;
        }
        vd.updateAmount(id, request.getParameter("variant"), left);
        OrderDAO od = new OrderDAO();
        Item i = itd.getRecordById(id);
        for (Variant v : i.getVariants()) {
            if (v.getName().equals(request.getParameter("variant")))
                v.setStock_amount(Integer.parseInt(request.getParameter("quantity")));
            else v.setStock_amount(0);
        }
        List<Item> l = new ArrayList<>();
        l.add(i);
        Detail d = new Detail(l);
        Order o =  new Order(0, ((Customer)session.getAttribute("customer")).getId(), LocalDate.now(),
                LocalDate.now().plusDays(5), request.getParameter("address"), d,"");
        od.save(o, ((Customer)session.getAttribute("customer")).getId());
        request.setAttribute("mess1", "Thanks for trusting our service.");
        request.setAttribute("mess2", "Your order would come in a few days.");
        request.getRequestDispatcher("done.jsp").forward(request, response);
    }
    else {
        int cid = ((Customer)session.getAttribute("customer")).getId();
        ItemDAO itd = new ItemDAO();
        VariantDAO vd = new VariantDAO();
        CartDAO cd = new CartDAO();
        OrderDAO od = new OrderDAO();
        List<Item> l = new ArrayList<>();
        for (Item i : cd.getCartByID(cid).getItem_list())
        {
            int id = i.getId();
            String var = i.getVariant();
            int left = vd.getRecordByName(id, var).getStock_amount()-i.getQuantity();
            vd.updateAmount(id, var, left);
            Item ii = itd.getRecordById(id);
            for (Variant v : ii.getVariants()) {
                if (v.getName().equals(request.getParameter("variant")))
                    v.setStock_amount(Integer.parseInt(request.getParameter("quantity")));
                else v.setStock_amount(0);
            }
            l.add(i);
        }
        Detail d = new Detail(l);
        Order o =  new Order(0, cid, LocalDate.now(),
                LocalDate.now().plusDays(5), request.getParameter("address"), d,"");
        od.save(o, cid);
        cd.removeAll(cid);
        session.setAttribute("cart_item_number", 0);
        request.setAttribute("mess1", "Thanks for trusting our service.");
        request.setAttribute("mess2", "Shipment for your order would come soon.");
        request.getRequestDispatcher("done.jsp").forward(request, response);
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
