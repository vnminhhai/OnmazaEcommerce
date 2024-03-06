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
        <title>JSP Page</title>
    </head>
    <body>
        <p>
            <a href=".${applicationScope.appName}/checkOrder">Check orders</a>
        </p>
        <p>
            <a href=".${applicationScope.appName}/addItem">Add an item</a>
        </p>
        <p>
            <a href=".${applicationScope.appName}/addVariant">Add a variant</a>
        </p>
    </body>
</html>
