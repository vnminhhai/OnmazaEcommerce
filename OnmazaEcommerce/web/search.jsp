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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <%@include file="components/headerLink.html" %>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <section class="section-intro mb-3 mt-5">
            <div class="container">
                <main class="card p-3">
                    <div class="mb-3 text-center justify-content-around">
                        <h2 class="text-start">Advanced option: </h2>
                        <form>
                            Category:
                            <select name="category" class="d-inline-block m-lg-2">
                                <option value="all">All categories</option>
                                <c:forEach items="${categories}" var="c">
                                    <option>${c.name}</option>
                                </c:forEach>
                            </select>
                            <span class="d-inline-block m-lg-2">
                                Min price: <input type="number" name="fromPrice">
                            </span>
                            <span class="d-inline-block m-lg-2">
                                Max price: <input type="number" name="toPrice">
                            </span>
                            <input type="submit" value="search">
                        </form>
                    </div>
                    <c:forEach items="${requestScope.display_list}" var = "c">
                        <div class="item-container" style="margin: 5px; border: solid black 1px; width: 30%; padding: 5px;">
                            <p>${c.name}</p>
                            <p>${c.category.name}</p>
                            <p>${c.description}</p>
                            <p>${c.price}</p>
                            <form action="buy" method="get">
                                <input type="hidden" value="${c.id}" name="item_id">
                                <input type="submit" value="Buy">
                            </form>
                        </div>
                    </c:forEach>
                </main>
            </div> <!-- container end.// -->
        </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
