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
                <main class="card">
                    <div class="card-header">
                        <h2 class="text-center">Sign up</h2>
                    </div>
                    <div class="container mt-3">
                        <form action="register" method="POST" class="mb-3">
                            <div class="row">
                                <div class="col-6">
                                    <p class="form-label text-dark">First name: </p>
                                    <input class="form-control" placeholder="First Name" name="first_name" type="text" value="<%= (request.getAttribute("first_name")==null)? "":(String)request.getAttribute("first_name")%>"><br>
                                </div>
                                <div class="col-6">
                                    <p class="form-label text-dark">Last name: </p>
                                    <input class="form-control" placeholder="Last Name" name="last_name" type="text" value="<%= (request.getAttribute("last_name")==null)? "":(String)request.getAttribute("last_name")%>"><br>
                                </div>
                            </div>
                            <div>
                                <p class="form-label text-dark">Address: </p>
                                <input class="form-control" placeholder="Address" name="address" type="text" value="<%= (request.getAttribute("address")==null)? "":(String)request.getAttribute("address")%>"><br>
                            </div>
                            <div>
                                <p class="form-label text-dark">Country: </p>
                                <input class="form-control" placeholder="Country" name="country" type="text" value="<%= (request.getAttribute("country")==null)? "":(String)request.getAttribute("country")%>"><br>
                            <p style="color: red; display: <%= (request.getAttribute("info_message") == null) ? "none" : "inline" %>;">
                                <%= request.getAttribute("info_message") %>
                                <br>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <p class="form-label text-dark">Email: </p>
                                    <input placeholder="myemail@domain.com" class="form-control" name="email" type="text" value="<%= (request.getAttribute("email")==null)? "":(String)request.getAttribute("email")%>"><br>
                                </div>
                                <div class="col-6">
                                    <p class="form-label text-dark">Phone number: </p>
                                    <input placeholder="000-000-0000" class="form-control" name="phone" type="text" value="<%= (request.getAttribute("phone")==null)? "":request.getAttribute("phone")%>"><br>
                                </div>
                            </div>
                            <div>
                                <p class="form-label text-dark">User name: </p>
                                <input class="form-control" name="User_Name" type="text" placeholder="UserName"><br>
                            </div>
                            <div>
                                <p class="form-label text-dark">Password: </p>
                                <input class="form-control" name="Password" type="password" placeholder="Password"><br>
                            </div>
                            <div>
                                <p class="form-label text-dark">Re-enter password: </p>
                                <input class="form-control" name="rePassword" type="password" placeholder="Password"><br>
                            <p style="color: red; display: <%= (request.getAttribute("message") == null) ? "none" : "inline" %>;">
                                <%= request.getAttribute("message") %>
                                <br>
                            </div>
                            <div class="text-center">
                                <input class="btn btn-dark fw-bold" type="submit" value="Register">
                            </div>
                        </form>
                    </div>
                </main>
            </div> <!-- container end.// -->
        </section>
    </body>
</html>
