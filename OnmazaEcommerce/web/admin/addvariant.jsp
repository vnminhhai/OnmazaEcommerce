<%-- 
    Document   : addvariant
    Created on : Mar 2, 2024, 11:39:51 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a variant</title>
    </head>
    <body>
        <form action="addVariant" method="post" enctype="multipart/form-data">
            <p>    
                Item:
                <select id="items" name="item">
                    <c:forEach items="${Items}" var="i">
                        <option value="${i.id}">${i.name}</option>
                    </c:forEach>
                </select>
            </p>
            <p>
                Variant name: <input type="text" placeholder="Name" name="name">
            </p>
            <p>
                Stock amount: <input type="number" placeholder="Quantity" name="amount">
            </p>
            <p>
                Image: <input type="file" accept="image/*" name="image">
            </p>
            <input type="submit" value="Add">
        </form>
    </body>
</html>
