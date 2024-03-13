<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping cart</title>
        <%@include file="components/headerLink.html" %>
    </head>
    <%@page import="model.Customer, dal.CustomerDAO, dal.CartDAO" %>
    <%
        Customer c = (Customer)request.getSession().getAttribute("customer");
        if (c==null) response.sendRedirect("login");
        else {
            request.setAttribute("cart", new CartDAO().getCartByID(c.getId()));
        }
    %>
    <%@include file="components/header.jsp" %>
    <body>
            <div class="container py-5"></div>
            <div class="container pt-4">
            <c:if test="${error!=null }">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </c:if>
            <c:if test="${mess!=null }">
                <div class="alert alert-success" role="alert">
                    ${mess}
                </div>
            </c:if>
            <div class="card text-center mb-4">
                <h3 class="card-header">Your cart</h3>
                <div class="card-body pb-2">
                    <div class="row justify-content-center">
                        <div class="col-md-12 d-flex">
                            <table class="table table-bordered align-content-center align-items-center" style="vertical-align: middle">
                                <thead>
                                    <tr>
                                        <th>Item</th>
                                        <th>Unit price</th>
                                        <th>Variant</th>
                                        <th>Quantity</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="total" value="0" />
                                    <c:if test="${empty cart.item_list}">
                                        <tr>
                                            <th colspan="5">No item found.</th>
                                        </tr>
                                    </c:if>
                                    <c:forEach items="${cart.item_list}" var="o">
                                        <tr>
                                            <th>
                                                <div class="p-2">
                                                    <img src="getImg?id=${o.id}&type=item" width="70" class="img-fluid">
                                                    <div class="ml-3">
                                                        <h7>
                                                            <a href="buy?item_id=${o.id}" class="text-dark">${o.name}</a>
                                                        </h7>
                                                    </div>
                                                </div>
                                            </th>
                                            <td><strong>${o.price}</strong></td>
                                            <td><strong>${o.variant}</strong></td>
                                            <td>
                                                <a href="subamountcart?pID=${o.id}&amount=${o.quantity}">
                                                    <button class="btn btn-gray-light p-2 m-2 text-center">-</button>
                                                </a> 
                                                <strong>${o.quantity}</strong>
                                                <a href="addamountcart?pID=${o.id}&amount=${o.quantity}">
                                                    <button class="btn btn-gray-light p-2 m-2 text-center">+</button>
                                                </a>
                                            </td>
                                            <td><a href="deletecart?pID=${o.id}">
                                                    <button type="button" class="btn btn-sm btn-danger">Remove</button>
                                                </a>
                                            </td>
                                        </tr>
                                        <c:set var="total" value="${total + o.price * o.quantity}" />
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>                    
                <div class="container pt-0 mt-0 justify-content-center d-flex">
                    <c:if test="${total>0}">
                        <div class="fw-bolder fs-3">Total: ${total}</div>
                        <form action="purchase" class="text-end fw-bolder">
                            <input type="hidden" value="cart" name="item">
                            <input type="submit" value="Purchase all" class="btn btn-dark mb-4 text-end ms-5 fw-bolder">
                        </form>
                    </c:if>
                </div>
            </div>
        </div>  
    </body>
</html>
