<%-- 
    Document   : cart
    Created on : Feb 27, 2024, 11:14:43 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Shopping Cart</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <%@include file="components/headerLink.html" %>
    </head>
    <body>
        <% if (session.getAttribute("customer")==null) response.sendRedirect("."); %>
        <%@include file="components/header.jsp" %>
        <section class="section-intro mb-3 mt-5">
            <div class="container">
                <main class="card p-3">
                    <c:set var="total" value="0" />
                    <c:forEach items="${cart.item_list}" var="i">        
                        <div class="mb-3">
                            <table class="table-secondary m-auto justify-content-evenly text-center">
                                <thead>
                                    <tr class="">
                                        <th class="col-sm-2">Name</th>
                                        <th>Variant</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>${i.name}</td>
                                        <td>${i.variant}</td>
                                        <td>${i.quantity}</td>
                                        <td>${i.price}</td>
                                        <td>
                                            <form action="removefromcart">
                                                <input type="hidden" name="item" value="${i.id}">
                                                <input type="hidden" name="variant" value="${i.variant}">
                                                <input type="submit" value="Remove">
                                            </form>
                                        </td>
                                        <c:set var="total" value="${total + i.price * i.quantity}" />
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </c:forEach>
                    <c:if test="${total>0}">
                        <div class="text-end fw-bolder">Total: ${total}</div>
                        <form action="purchase" class="text-end fw-bolder">
                            <input type="hidden" value="cart" name="item">
                            <input type="submit" value="Purchase all" class="fw-bolder text-gray-dark">
                        </form>
                    </c:if>
                    <c:if test="${total==0}">
                        <div class="text-center fw-bold">You have no item in your cart.</div>
                    </c:if>
                </main>
            </div> <!-- container end.// -->
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
