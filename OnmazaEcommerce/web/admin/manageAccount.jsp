<%-- 
    Document   : manageAccount
    Created on : Mar 10, 2024, 1:28:24 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage User accounts</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Permission</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="u">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.first_name} ${u.last_name}</td>
                        <td>${u.mobile_phone}</td>
                        <td>${u.address}</td>
                        <td>
                            <form action="manageAccount" method="post">
                                <input type="hidden" value="${u.id}" name="cid">
                                <input type="number" value="${u.permission}" name="permission">
                                <input type="submit" value="Change">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
