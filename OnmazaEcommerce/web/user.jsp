<%-- 
    Document   : user
    Created on : Feb 28, 2024, 5:46:12 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <%@include file="components/headerLink.html" %>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <section class="section-intro mb-3 mt-5">
            <div class="container">
                <main class="card p-3">
                    <div class="row">
                        <div class="col-9 m-0">
                            <p class="text-dark mt-3 ms-2"> Name: ${customer.first_name} ${customer.last_name} </p>
                            <p class="text-dark ms-2"> Address: ${customer.address} </p>
                            <p class="text-dark mt-3 ms-2"> Email: ${customer.email} </p>
                            <p class="text-dark ms-2"> Phone number: ${customer.mobile_phone} </p>
                            <a class="text-primary fs-5 ms-2" href="updateInfo">Update personal info</a>
                            <a class="text-primary fs-5 ms-5" href="updateAvatar">Upload new avatar</a>
                        </div>
                        <div class="col-3 m-0">
                            <img src="getImg?id=${customer.id}&type=user" alt="alt" class="img-fluid pe-5 "/>
                        </div>
                    </div>
                    <div class="row text-center mt-3">
                        <div class="col-4 fs-4">
                            <c:if test="${customer.permission == 1}">
                                You are a staff.
                            </c:if>
                            <c:if test="${customer.permission == 2}">
                                You are a manager.
                            </c:if>
                        </div>
                        <div class="col-4 text-primary fs-4">
                            <c:if test="${customer.permission >= 1}">
                                <a class="text-primary hover\:bg-light" href="staff">Staff site</a>
                            </c:if>
                        </div>
                        <div class="col-4 text-primary fs-4">
                            <c:if test="${customer.permission >= 2}">
                                <a class="text-primary hover\:opacity-1" href="admin">Manager site</a>
                            </c:if>
                        </div>
                    </div>
                </main>
                <main class="card p-3 mt-lg-5">
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
                                <th>Received</th>
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
                                        <a href="received?id=${o.id}">Confirm</a>
                                    </td>
                                    <td>
                                        <a href="order?id=${o.id}">See Detail</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </main>
            </div> <!-- container end.// -->
        </section>
    </body>
</html>
