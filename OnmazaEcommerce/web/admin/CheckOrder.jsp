<%-- 
    Document   : CheckOrder
    Created on : Mar 7, 2024, 6:47:05 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Orders</title>
        <%@include file="../components/headerLink.html" %>
    </head>
    <body>
        <%@include file="../components/header.jsp" %>
        <main class="card p-3 mt-lg-5 m-5">
            <table class="table table-bordered text-center">
                <thead>
                    <tr class="">
                        <th colspan="6" class="fw-bolder bg-warning-light">Your orders</th>
                    </tr>
                    <tr>
                        <th>Order date</th>
                        <th>Required date</th>
                        <th>Ship address</th>
                        <th>Status</th>
                        <th>Resolve</th>
                        <th>Detail</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${orders.size()==0}">
                        <tr>
                            <td colspan="6" style="text-align: center">No pending order</td>
                        </tr>
                    </c:if>
                    <c:forEach items="${orders}" var="o">
                        <tr>
                            <td>
                                ${o.order_date}
                            </td>
                            <td>
                                ${o.required_date}
                            </td>
                            <td>
                                ${o.ship_address}
                            </td>
                            <td>
                                <span class="badge rounded-pill bg-<c:choose><c:when test="${o.getStatus().toLowerCase().startsWith('p')}">info</c:when><c:when test="${o.getStatus().toLowerCase().startsWith('t')}">warning</c:when><c:when test="${o.getStatus().toLowerCase().startsWith('d')}">success</c:when><c:otherwise>secondary</c:otherwise></c:choose>">${o.status}</span></td>
                            <td>
                                <a href="resolve?id=${o.id}" class="btn btn-primary-light ${o.status.toLowerCase().startsWith("p")?"":"disabled"}">Resolve</a>
                            </td>
                            <td>
                                <a href="order?id=${o.id}">See Detail</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </body>
</html>
