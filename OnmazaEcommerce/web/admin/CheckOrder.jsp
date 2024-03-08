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
    </head>
    <body>
        <table>
            <thead>
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
                            ${o.status}
                        </td>
                        <td>
                            <a href="resolve?id=${o.id}">Resolve</a>
                        </td>
                        <td>
                            <a href="detail?id=${o.id}">See Detail</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
