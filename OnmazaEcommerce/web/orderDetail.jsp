<%-- 
    Document   : orderDetail.jsp
    Created on : Mar 11, 2024, 11:44:56 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order detail</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <%@include file="components/headerLink.html" %>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <section class="section-intro mb-3 mt-5">
            <div class="container">
                <main class="card p-3">
                    <c:set var="total" value="0" />
                    <c:forEach items="${order.detail.item_list}" var="i">
                        <div class="mb-3">
                            <table class="table-secondary m-auto justify-content-evenly text-center">
                                <thead>
                                    <tr class="">
                                        <th class="col-sm-2">Name</th>
                                        <th>Variant</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>${i.name}</td>
                                        <td>${i.variant}</td>
                                        <td>${i.quantity}</td>
                                        <td>${i.price}</td>
                                        <c:set var="total" value="${total + i.price * i.quantity}" />
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </c:forEach>
                    <c:if test="${total>0}">
                        <div class="text-end fw-bolder">Total: ${total}</div>
                    </c:if>
                </main>
            </div>
        </section>
    </body>
</html>
