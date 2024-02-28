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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <%@include file="components/headerLink.html" %>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <section class="section-intro mb-3 mt-5">
            <div class="container">
                <main class="card p-3">
                    <h2>${item.name}</h2>
                    <p>Category: ${item.category.name}</p>
                    <p>Description: ${item.description}</p>
                    <p>Price: ${item.price}</p>
                    <form name="var" action="purchase" method="get" id="twoActionForm">
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
                            <button type="button" onclick="cart()">Add to cart</button>
                            <c:if test="${cart_message!=null}"><p class="text-success">${cart_message}</p></c:if>
                        </div>
                    </form>
                        <script>
                            function cart() {
                              // Perform any necessary validation or preprocessing here

                              // Submit the form to "tocart"
                              document.getElementById("twoActionForm").action = "tocart";
                              document.getElementById("twoActionForm").method = "post";
                              document.getElementById("twoActionForm").submit();
                            }
                      </script>
                </main>
            </div> <!-- container end.// -->
        </section>
    </body>
</html>
