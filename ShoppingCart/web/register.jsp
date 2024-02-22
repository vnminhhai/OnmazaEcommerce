<%-- 
    Document   : register
    Created on : Feb 22, 2024, 10:11:04 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <form action="register" method="POST">
            First name: <input name="first_name" type="text" value="<%= request.getParameter("first_name")%>"><br>
            Last name: <input name="last_name" type="text" value="<%= request.getParameter("last_name")%>"><br>
            Email: <input name="email" type="text" value="<%= request.getParameter("email")%>"><br>
            Phone number: <input name="phone" type="text" value="<%= request.getParameter("phone")%>"><br>
            Address: <input name="address" type="text" value="<%= request.getParameter("address")%>"><br>
            Country: <input name="country" type="text" value="<%= request.getParameter("country")%>"><br>
            <p style="color: red; display: <%= (request.getAttribute("info_message") == null) ? "none" : "inline" %>;">
                <%= request.getAttribute("info_message") %>
                <br>
            </p>
            User name: <input name="User_Name" type="text"><br>
            Password: <input name="Password" type="password"><br>
            Re-enter password: <input name="rePassword" type="password"><br>
            <p style="color: red; display: <%= (request.getAttribute("message") == null) ? "none" : "inline" %>;">
                <%= request.getAttribute("message") %>
                <br>
            </p>
            <input type="submit" value="Register">
        </form>
    </body>
</html>
