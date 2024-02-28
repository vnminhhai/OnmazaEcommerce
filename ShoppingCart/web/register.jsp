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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <%@include file="components/headerLink.html" %>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <section class="section-intro mb-3 mt-5">
            <div class="container">
                <main class="card p-3">
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
                </main>
            </div> <!-- container end.// -->
        </section>
    </body>
</html>
