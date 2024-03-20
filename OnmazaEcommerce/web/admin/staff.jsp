<%-- 
    Document   : staff
    Created on : Mar 7, 2024, 2:21:34 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add an item</title>
        <%@include file="../components/headerLink.html" %>
    </head>
    <body>
        <%@include file="../components/header.jsp" %>
        <div class="container mt-5 d-flex justify-content-around">
            <div class="card p-2 mt-3">
                <span class="fs-5 d-inline-block">
                    <i class="fa fa-credit-card"></i>
                    <a href="checkOrder">Check orders</a>
                </span>
            </div>
            <div class="card p-2 mt-3">
                <span class="fs-5 d-inline-block">
                    <i class="fa fa-cube"></i>
                    <a href="updateItem">Update items</a>
                </span>
            </div>
            <div class="card p-2 mt-3">
                <span class="fs-5 d-inline-block">
                    <i class="fa fa-plus-square"></i>
                    <a href="addItem">Add an item</a>
                </span>
            </div>
            <div class="card p-2 mt-3">
                <span class="fs-5 d-inline-block">
                    <i class="fa fa-tags"></i>
                    <a href="addVariant">Add a variant</a>
                </span>
            </div>
        </div>
    </body>
</html>
