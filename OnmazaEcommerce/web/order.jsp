<%-- 
    Document   : order
    Created on : Feb 20, 2024, 3:56:29 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Customer" %>
<%@page import="model.Cart" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Order</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <%@include file="components/headerLink.html" %>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <section class="section-intro mb-3 mt-5">
            <div class="container">
                <main class="card p-3">
                    <h1>Confirm your order</h1>
                    <form action="confirm" method="get">
                        <input type="hidden" value="${from_cart}" name="clear_cart">
                        <table class="table table-hover">
                            <thead>
                                <th>Item</th>
                                <th>Variant</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Quantity</th>
                            </thead>
                            <c:forEach items="${cart.item_list}" var="item">
                                <tr>
                                    <td>${item.name}</td>
                                    <td>${item.variant}</td>
                                    <td>${item.description}</td>
                                    <td>${item.price}</td>
                                    <td>${item.quantity}</td>
                                    <input type="hidden" value="${item.id}" name="item">
                                    <input type="hidden" value="${item.variant}" name="variant">
                                    <input type="hidden" value="${item.quantity}" name="quantity">
                                </tr>
                            </c:forEach>
                        </table>
                        <div class="row mb-3">
                            <p class="form-label col-2 text-center text-black fw-bold mt-2">Ship Address: </p>
                            <div class="col-5 pe-5">
                                <input class="form-control" type="text" name="address" value="<%=((Customer)session.getAttribute("customer")).getAddress()%>">
                            </div>
                            <div class="col-5 d-flex justify-content-around">
                                <input type="radio" class="btn-check" name="pay" id="option1" autocomplete="off" checked>
                                <label class="btn btn-secondary" for="option2">Pay after shipment</label>
                                <input type="radio" class="btn-check" name="pay" id="option2" autocomplete="off" disabled>
                                <label class="btn btn-secondary" for="option2">Pay now</label>
                            </div>
                        </div>
                                <h2 class="text-start">Total: ${cart.total}</h2>
                                <input type="submit" value="Order" class="btn btn-black">
                        <p class="text-danger fw-bold mt-5">${mess}</p>
                    </form>
                </main>
            </div>
        </section>
    </body>
</html>
