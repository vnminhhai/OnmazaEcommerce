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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <%@include file="components/headerLink.html" %>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <section class="section-intro mb-3 mt-5">
            <div class="container">
                <main class="card p-3">
                    <form action="login" method="post">
                        User name: <input name="User_Name" type="text"><br>
                        Password: <input name="Password" type="password"><br>
                        <p style="color: red; display: <%= (request.getAttribute("message") == null) ? "none" : "inline" %>;">
                            <%= request.getAttribute("message") %>
                            <br>
                        </p>
                        <input type="submit" value="Login">
                    </form>
                </main>
            </div> <!-- container end.// -->
        </section>
    </body>
</html>
