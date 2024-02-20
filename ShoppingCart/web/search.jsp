<%-- 
    Document   : search
    Created on : Feb 18, 2024, 5:25:47 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Browse items</title>
    </head>
    <body>
        <div id="header-div">
            <span id="logo">
                
            </span>
            <span id="search">
                <form action="search">
                    <input type="text" name="keyword">
                    <input type="submit" value="Search">
                </form>
            </span>
            <span id="login-button">
                
            </span>
        </div>
        <div id="body" style="display: flex;">
            <c:forEach items="${requestScope.display_list}" var = "c">
                <div class="item-container" style="margin: 5px; border: solid black 1px; width: 30%; padding: 5px;">
                    <p>${c.name}</p>
                    <p>${c.category.name}</p>
                    <p>${c.description}</p>
                    <p>${c.price}</p>
                    <form action="buy" method="post">
                        <input type="hidden" value="${c.id}" name="item_id">
                        <input type="submit" value="Buy">
                    </form>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
