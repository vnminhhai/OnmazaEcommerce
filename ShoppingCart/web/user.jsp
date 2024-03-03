<%-- 
    Document   : user
    Created on : Feb 28, 2024, 5:46:12 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <%@include file="components/headerLink.html" %>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <section class="section-intro mb-3 mt-5">
            <div class="container">
                <main class="card p-3">
                    <p> Name: ${customer.first_name} ${customer.last_name} </p>
                    <p> Address: ${customer.address} </p>
                    <div class="row">
                        <div class="col-4">
                            <c:if test="${customer.permission == 1}">
                                You are a staff.
                            </c:if>
                            <c:if test="${customer.permission == 2}">
                                You are a manager.
                            </c:if>
                        </div>
                        <div class="col-4">
                            <c:if test="${customer.permission >= 1}">
                                <a href="staff">Staff site</a>
                            </c:if>
                        </div>
                        <div class="col-4">
                            <c:if test="${customer.permission >= 2}">
                                <a href="admin">Manager site</a>
                            </c:if>
                        </div>
                    </div>
                </main>
            </div> <!-- container end.// -->
        </section>
    </body>
</html>
