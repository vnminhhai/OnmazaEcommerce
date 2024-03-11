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
            <div class="fluid-container row">
                <div class="col-sm-3 col-lg-2 mb-3 text-start">
                    <div class="fw-bold text-dark fs-4 ps-2">Advanced option: </div>
                    <form>
                        <div class="d-inline-block m-2 ps-2">
                            Category:
                            <select name="category" class="d-inline-block w-50">
                                <option value="all">All categories</option>
                                <c:forEach items="${categories}" var="c">
                                    <option <c:if test="${c.name==cat}">selected</c:if> value="${c.name}">${c.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="d-inline-block ps-2 m-2">
                            Min price: <input class="w-50" type="number" name="fromPrice" placeholder="Min">
                        </div>
                        <div class="d-inline-block ps-2 m-2">
                            Max price: <input class="w-50" type="number" name="toPrice" placeholder="Max">
                        </div>
                        <input type="submit" class="ms-2 ps-2 m-2" value="Search">
                    </form>
                </div>
                <main class="col-sm-9 col-lg-10 m-0 border-0">
                    <c:forEach items="${requestScope.display_list}" var = "c">
                        <div class="item-container" style="margin: 0px; border: 0px; width: 30%; padding: 0px;">
                            <p>${c.name}</p>
                            <p>${c.category.name}</p>
                            <p>${c.description}</p>
                            <p>${c.price}</p>
                            <form action="buy" method="get">
                                <input type="hidden" value="${c.id}" name="item_id">
                                <input type="submit" value="Buy" class="m-0">
                            </form>
                        </div>
                    </c:forEach>
                </main>
            </div> <!-- container end.// -->
        </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
