<%-- 
    Document   : additem
    Created on : Mar 2, 2024, 11:07:33 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add an item</title>
        <%@include file="../components/headerLink.html" %>
    </head>
    <body>
        <%@include file="../components/header.jsp" %>
        <main class="m-5">
        <form action="addItem" method="post">
            <p>
                Item name: <input type="text" placeholder="Name" name="name">
            </p>
            <p>
                Description: <input type="text" placeholder="Description" name="description">
            <p>
                Price: <input type="text" placeholder="Price" name="price">
            </p>
            <p>    
                Category:
                <select id="categories" name="category">
                    <c:forEach items="${Categories}" var="c">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
            </p>
            <input type="submit" value="Add">
        </form></main>
    </body>
</html>
