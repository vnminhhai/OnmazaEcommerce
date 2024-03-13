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
import java.io.InputStream;
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
        int id =Integer.parseInt(request.getParameter("id"));
        String var = request.getParameter("variant");
        System.out.println("Id in imageretirve="+id);
        VariantDAO vd = new VariantDAO();
        try {
//            byte[] imgLen = vd.getRecordByName(id, var).getImage();
//            System.out.println(imgLen.length);
//            if(true){
//                int len = imgLen.length;
//                byte [] rb = new byte[len];
//                InputStream readImg = new ByteArrayInputStream(vd.getRecordByName(id, var).getImage());
//
//                int index=readImg.read(rb, 0, len);  
//                System.out.println("index"+index);
//
//                response.reset();
//                response.setContentType("image/jpg");
//                response.getOutputStream().write(rb,0,len);
//                response.getOutputStream().flush();
//                response.getOutputStream().close();
//            }

            response.setContentType("image/jpg");
            response.getOutputStream().write(vd.getRecordByName(id, var).getImage().readAllBytes());
            response.getOutputStream().flush();
            response.getOutputStream().close();
        }
        catch (Exception e){
          e.printStackTrace();
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
