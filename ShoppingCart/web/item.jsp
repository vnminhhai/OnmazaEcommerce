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
            <c:forEach items="${requestScope.item.variants}" var="v">
                <input type="radio" name="variant" value="${v.name}" />
                <span>${v.image}</span>
                <span>${v.name}</span>
            </c:forEach>
            <input type="hidden" name="item" value="${item.id}">
            <br>
            <div style="margin-top: 10px">
                <input type="submit" value="Purchase">
            </div>
        </form>
    </body>
</html>
