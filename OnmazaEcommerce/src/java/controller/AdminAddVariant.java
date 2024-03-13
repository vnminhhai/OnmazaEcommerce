/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDAO;
import dal.ItemDAO;
import dal.VariantDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Variant;
import java.nio.file.Files;
import java.nio.file.Paths;
import model.Image;
/**
 *
 * @author ADMIN
 */
@MultipartConfig()
public class AdminAddVariant extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        request.setAttribute("Items", new ItemDAO().getItemList());
        request.getRequestDispatcher("admin/addvariant.jsp").forward(request, response);
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
        
        String name = request.getParameter("name");
        int amount = Integer.parseInt(request.getParameter("amount"));
        String realPath = request.getServletContext().getRealPath("/img/variant");
        Part part = request.getPart("image");
        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectory(Paths.get(realPath));
        }
        VariantDAO vd =new VariantDAO();
        Image im = new Image(0, "variant");
        Variant v = new Variant(name, im, amount);
        int iid = Integer.parseInt(request.getParameter("item"));
        int newid = vd.addVariant(v, iid);
        part.write(realPath+"/"+newid+".jpg");
        
        request.setAttribute("mess1", "Added a new variant for ID: "+iid);
        request.setAttribute("mess2", "The new variant has name "+name+".");
        request.getRequestDispatcher("done.jsp").forward(request, response);
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
