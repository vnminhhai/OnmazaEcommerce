<%-- 
    Document   : CheckOrder
    Created on : Mar 7, 2024, 6:47:05 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="model.Order, dal.OrderDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
    if (request.getParameter("transporting")!=null) request.setAttribute("check",request.getParameter("transporting"));
    else {
        request.setAttribute("check","false");
    }
    if (request.getAttribute("check").equals("true")) ((List<Order>)request.getAttribute("orders")).addAll(new OrderDAO().getAllOrdersByStatus(1));
    
    int pageSize = 8;
    int lsize = request.getAttribute("orders").size();
    request.setAttribute("numPage", lsize/pageSize + ((lsize%pageSize==0)? 0:1));
    request.setAttribute("pageSize", pageSize);
    if (request.getParameter("page")==null) request.setAttribute("page", 0);
    else request.setAttribute("page", Integer.parseInt(request.getParameter("page")));
%>
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
            <div class="m-2">
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="switch" ${check=="true"?"checked":""} onchange="window.location.href='?transporting='+document.getElementById('switch').checked">
                    <label class="form-check-label fs-6" for="flexSwitchCheckChecked">View transporting orders</label>
                </div>
            </div>
            <table class="table table-bordered text-center align-middle">
                <thead>
                    <tr class="">
                        <th colspan="6" class="fw-bolder bg-warning-light">All orders</th>
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
                                <span class="fs-6 badge rounded-pill bg-<c:choose><c:when test="${o.getStatus().toLowerCase().startsWith('p')}">info</c:when><c:when test="${o.getStatus().toLowerCase().startsWith('t')}">warning</c:when><c:when test="${o.getStatus().toLowerCase().startsWith('d')}">success</c:when><c:otherwise>secondary</c:otherwise></c:choose>">${o.status}</span></td>
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
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-end">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
        </main>
    </body>
</html>
