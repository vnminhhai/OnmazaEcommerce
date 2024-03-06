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
                    <form action="register" method="POST" class="mb-3 fw-bold">
                        <p>
                            First name: <input name="first_name" type="text" value="<%= (request.getAttribute("first_name")==null)? "":(String)request.getAttribute("first_name")%>"><br>
                        </p>
                        <p>
                            Last name: <input name="last_name" type="text" value="<%= (request.getAttribute("last_name")==null)? "":(String)request.getAttribute("last_name")%>"><br>
                        </p>
                        <p>
                            Email: <input name="email" type="text" value="<%= (request.getAttribute("email")==null)? "":(String)request.getAttribute("email")%>"><br>
                        </p>
                        <p>
                            Phone number: <input name="phone" type="text" value="<%= (request.getAttribute("phone")==null)? "":request.getAttribute("phone")%>"><br>
                        </p>
                        <p>
                            Address: <input name="address" type="text" value="<%= (request.getAttribute("address")==null)? "":(String)request.getAttribute("address")%>"><br>
                        </p>
                        <p>
                            Country: <input name="country" type="text" value="<%= (request.getAttribute("country")==null)? "":(String)request.getAttribute("country")%>"><br>
                        <p style="color: red; display: <%= (request.getAttribute("info_message") == null) ? "none" : "inline" %>;">
                            <%= request.getAttribute("info_message") %>
                            <br>
                        </p>
                        <p>
                            User name: <input name="User_Name" type="text"><br>
                        </p>
                        <p>
                            Password: <input name="Password" type="password"><br>
                        </p>
                        <p>
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
