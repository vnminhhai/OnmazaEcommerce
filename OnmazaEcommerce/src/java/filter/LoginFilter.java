/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;
/**
 *
 * @author ADMIN
 */
public class LoginFilter implements Filter{

    @Override
    public void doFilter(ServletRequest sr, ServletResponse sr1, FilterChain fc) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)sr;
        if (request.getSession().getAttribute("customer")==null) {
            request.getSession().setAttribute("current", request.getRequestURL().toString());
            request.getRequestDispatcher("login.jsp").forward(request, sr1);
        }
        else fc.doFilter(sr, sr1);
    }
}
