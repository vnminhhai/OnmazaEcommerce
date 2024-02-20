<%-- 
    Document   : login
    Created on : Feb 19, 2024, 9:54:34 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form action="login" method="post">
            User name: <input name="User_Name" type="text"><br>
            Password: <input name="Password" type="password"><br>
            <p style="color: red; display: <%= (request.getAttribute("message") == null) ? "none" : "inline" %>;">
                <%= request.getAttribute("message") %>
                <br>
            </p>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
