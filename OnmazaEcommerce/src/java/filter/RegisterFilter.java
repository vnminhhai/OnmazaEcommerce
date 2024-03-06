/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filter;

import dal.CustomerDAO;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 *
 * @author ADMIN
 */
public class RegisterFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain fc) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;        
        if(httpRequest.getMethod().equalsIgnoreCase("GET")){
            fc.doFilter(request, response);
        }
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String country = request.getParameter("country");
        String email = request.getParameter("email");
        if (first_name==null||last_name==null||phone==null||address==null||country==null||email==null||first_name.equals("")||
        last_name.equals("")||phone.equals("")||address.equals("")||country.equals("")||email.equals("")) {
            request.setAttribute("info_message", "Please fill in all the information!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else {
            String User_Name = request.getParameter("User_Name");
            String Password = request.getParameter("Password");
            String rePassword = request.getParameter("rePassword");
            CustomerDAO cd = new CustomerDAO();
            if (User_Name==null||Password==null||User_Name.equals("")||Password.equals(""))
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
                request.setAttribute("first_name", first_name);
                request.setAttribute("last_name", last_name);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("country", country);
                request.setAttribute("email", email);
                request.setAttribute("Password", Password);
                request.setAttribute("User_Name", User_Name);
                fc.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }
    
}
