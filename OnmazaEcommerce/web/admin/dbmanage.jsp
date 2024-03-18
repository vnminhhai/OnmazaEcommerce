<%-- 
    Document   : dbmanage
    Created on : Feb 29, 2024, 1:19:03 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin site</title>
        <%@include file="../components/headerLink.html" %>
    </head>
    <body>
        <%@include file="../components/adminHeader.jsp" %>
        <div class="container mt-5">
            <p>
                <a href="manageAccount">Add or remove staff</a>
            </p>
            <p>
                <a href="checkOrder">Check orders</a>
            </p>
            <p>
                <a href="addItem">Add an item</a>
            </p>
            <p>
                <a href="addVariant">Add a variant</a>
            </p>
        </div>
    </body>
</html>
