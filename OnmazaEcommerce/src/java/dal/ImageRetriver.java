package dal;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */



import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import model.Variant;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="ImageRetriver", urlPatterns={"/getImg"})
public class ImageRetriver extends HttpServlet{
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        System.out.println("Id in imageretirve="+id+", type: "+type);
        String path="";
        String realPath = request.getServletContext().getRealPath("/");
        path = switch (type.toLowerCase().trim()) {
            case "user" -> realPath+"img/user/";
            case "variant" -> realPath+"img/variant/";
            default -> realPath+"img/product/";
        };
        
        response.setContentType("image/jpeg");
        String imagePath = path + id + ".jpg";
        
        if (Files.exists(Paths.get(imagePath))) {
            FileInputStream fis = new FileInputStream(imagePath);
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                response.getOutputStream().write(buffer, 0, bytesRead);
            }
            fis.close();
        } else {
            FileInputStream defaultImage = new FileInputStream(path + "0.jpg");
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = defaultImage.read(buffer)) != -1) {
                response.getOutputStream().write(buffer, 0, bytesRead);
            }
            defaultImage.close();
        }
//        try {
//            PrintWriter out = response.getWriter();
//            response.setContentType("text/html;charset=UTF-8");
//            if (!Files.exists(Paths.get(path+id+".jpg"))) {
//                out.print("<img src='"+path+0+".jpg'>");
//            }
//            else out.print("<img src='"+path+id+".jpg'>");
//            response.getOutputStream().flush();
//            response.getOutputStream().close();
//        }
//        catch (Exception e){
//            e.printStackTrace();
//        }
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
