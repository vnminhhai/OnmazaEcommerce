<%-- 
    Document   : order
    Created on : Feb 20, 2024, 3:56:29 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Customer" %>
<%@page import="model.Item" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Order</title>
    </head>
    <body>
        <h1>Confirm your order</h1>
        <form action="confirm" method="post">
            <p>Item: ${item.name} (${variant})</p>
            <p>${item.description}</p>
            <p>Price: ${item.price}</p>
            <p>Quantity: ${quantity}</p>
            <p>Ship Address: <input type="text" name="address" value="<%=((Customer)session.getAttribute("customer")).getAddress()%>"></p>
            <h2>Total: <%= Integer.parseInt((String)request.getAttribute("quantity"))*((Item)request.getAttribute("item")).getPrice()%></h2>
            <input type="hidden" value="${item.id}" name="item">
            <input type="hidden" value="${variant}" name="variant">
            <input type="hidden" value="${quantity}" name="quantity">
            <p>Payment:
                <input type="radio" name="pay" value="After" checked="checked" /> Pay after shipment
                <input type="radio" name="pay" value="Before" /> Pay now
            </p>
            <input type="submit" value="Order">
        </form>
    </body>
</html>
