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
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Item;
import model.Variant;
import org.apache.commons.fileupload2.jakarta.JakartaServletFileUpload;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import util.InputStreamHelper;
import java.nio.file.Files;
import java.nio.file.Paths;
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminAddVariant</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddVariant at " + request.getContextPath () + "</h1>");
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
        boolean isMultiPart = JakartaServletFileUpload.isMultipartContent(request);
//        File tempFile = new File("C:\\Users\\ADMIN\\Onmaza\\OnmazaEcommerce\\web\\img\\temp");
        
        String name = request.getParameter("name");
        int amount = Integer.parseInt(request.getParameter("amount"));
//        String realPath = request.getServletContext().getRealPath("/uploads");
        String realPath = request.getServletContext().getRealPath("/img/temp");
        Part part = request.getPart("image");
        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectory(Paths.get(realPath));
        }
        part.write(realPath+"/"+fileName);
        PrintWriter out = response.getWriter();
        try {
            response.setContentType("text/html;charset=UTF-8");
            out.print("<h2>Ten: "+name+" </h2>");
            out.print("<img src='img/temp/"+fileName+"'>");
        } catch (Exception e) {
            System.out.println("Loi");
        }
//        Variant v = new Variant(name, fis, amount);
//        int iid = Integer.parseInt(request.getParameter("item"));
//        new VariantDAO().addVariant(v, iid);
//        request.setAttribute("mess1", "Added a new variant for ID: "+iid);
//        request.setAttribute("mess2", "The new variant has name "+name+".");
//        request.getRequestDispatcher("done.jsp").forward(request, response);
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
