<%-- 
    Document   : item
    Created on : Feb 19, 2024, 7:43:26 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.item.name}</title>
    </head>
    <body>
        <h2>${item.name}</h2>
        <p>Category: ${item.category.name}</p>
        <p>Description: ${item.description}</p>
        <p>Price: ${item.price}</p>
        <form name="var" action="purchase" method="post">
            Types:
            <c:forEach var="i" begin="0" end="${requestScope.item.variants.size()-1}" step="1">
                <input type="radio" name="variant" value="${requestScope.item.variants[i].name}" ${i==0?"checked":""}/>
                <span>${requestScope.item.variants[i].image}</span>
                <span>${requestScope.item.variants[i].name}</span>
            </c:forEach>
            <br>
            Quantity: <input type="number" value="1" name="quantity">
            <br>
            <input type="hidden" name="item" value="${item.id}">
            <br>
            <div style="margin-top: 10px">
                <input type="submit" value="Purchase">
            </div>
        </form>
    </body>
</html>
