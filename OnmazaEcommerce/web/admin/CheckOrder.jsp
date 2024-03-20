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
    
   Object orderListObj = request.getAttribute("orders");
   int lsize = 0;
   if (orderListObj instanceof List) {
      List<Order> orderList = (List<Order>) orderListObj;
      lsize = orderList.size();
   }
   request.setAttribute("numPage", lsize/pageSize + ((lsize%pageSize==0)? 0:1));
   request.setAttribute("pageSize", pageSize);
   if (request.getParameter("page")==null) request.setAttribute("pageNo", 0);
   else request.setAttribute("pageNo", Integer.parseInt(request.getParameter("page"))-1);
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
        <main class="card p-3 mt-5 m-5">
            <div class="m-2">
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="switch" ${check=="true"?"checked":""} onchange="window.location.href='?transporting='+document.getElementById('switch').checked">
                    <label class="form-check-label fs-6" for="flexSwitchCheckChecked">View transporting orders</label>
                </div>
            </div>
            <table class="table table-bordered text-center align-middle" id="table">
                <thead>
                    <tr class="">
                        <th colspan="6" class="fw-bolder bg-warning-light">All orders</th>
                    </tr>
                    <tr>
                        <th onclick="sortTable(0)" style="cursor: pointer">Order date <span class="d-inline float-end"><i class="fa fa-filter me-1"></i></span></th>
                        <th onclick="sortTable(1)" style="cursor: pointer">Required date <span class="d-inline float-end"><i class="fa fa-filter me-1"></i></span></th>
                        <th onclick="sortTable(2)" style="cursor: pointer">Ship address <span class="d-inline float-end"><i class="fa fa-filter me-1"></i></span></th>
                        <th onclick="sortTable(3)" style="cursor: pointer">Status <span class="d-inline float-end"><i class="fa fa-filter me-1"></i></span></th>
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
                    <c:if test="${numPage!=0}">
                        <p class="text-center">Page ${pageNo+1} out of ${numPage}</p>
                        <c:forEach begin="${pageNo*pageSize}" end="${Math.min(pageNo*pageSize+pageSize-1, orders.size()-1)}" var="i">
                            <tr>
                                <td>
                                    ${orders[i].order_date}
                                </td>
                                <td>
                                    ${orders[i].required_date}
                                </td>
                                <td>
                                    ${orders[i].ship_address}
                                </td>
                                <td>
                                    <span class="fs-6 badge rounded-pill bg-<c:choose><c:when test="${orders[i].getStatus().toLowerCase().startsWith('p')}">info</c:when><c:when test="${orders[i].getStatus().toLowerCase().startsWith('t')}">warning</c:when><c:when test="${orders[i].getStatus().toLowerCase().startsWith('d')}">success</c:when><c:otherwise>secondary</c:otherwise></c:choose>">${orders[i].status}</span></td>
                                <td>
                                    <a href="resolve?id=${orders[i].id}" class="btn btn-primary-light ${orders[i].status.toLowerCase().startsWith("p")?"":"disabled"}">Resolve</a>
                                </td>
                                <td>
                                    <a href="order?id=${orders[i].id}">See Detail</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
            <div class="container d-flex justify-content-around mt-3">
                <nav aria-label="Page navigation example" class="">
                    <ul class="pagination pagination justify-content-center">
                        <c:if test="${numPage<=6}">
                            <li class="page-item ${pageNo==0?'disabled':''}">
                                <a class="page-link" href="?transporting=${check}&page=${pageNo}" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <c:forEach begin="1" end="${numPage}" var="i">
                                <li class="page-item" aria-current="page">
                                    <a href="?transporting=${check}&page=${i}" class="page-link">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item ${pageNo==(numPage-1)?'disabled':''}">
                                <a class="page-link" href="?transporting=${check}&page=${pageNo+2}">Next</a>
                            </li>
                        </c:if>
                        <c:if test="${numPage>6}">
                            <li class="page-item ${pageNo==0?'disabled':''}">
                                <a class="page-link" href="?transporting=${check}&page=1" tabindex="-1" aria-disabled="true">First</a>
                            </li>
                            <li class="page-item ${pageNo==0?'disabled':''}">
                                <a class="page-link" href="?transporting=${check}&page=${pageNo}" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <c:if test="${pageNo>=2}">
                                <li class="page-item">
                                    <a class="page-link" tabindex="-1" aria-disabled="true">...</a>
                                </li>
                            </c:if>
                            <c:forEach begin="${Math.max(1, pageNo+0)}" end="${Math.min(numPage+0,pageNo+2)}" var="i">
                                <li class="page-item" aria-current="page">
                                    <a href="?transporting=${check}&page=${i}" class="page-link">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${pageNo<=numPage-3}">
                                <li class="page-item">
                                    <a class="page-link" tabindex="-1" aria-disabled="true">...</a>
                                </li>
                            </c:if>
                            <li class="page-item ${pageNo==(numPage-1)?'disabled':''}">
                                <a class="page-link" href="?transporting=${check}&page=${pageNo+2}" tabindex="-1" aria-disabled="true">Next</a>
                            </li>
                            <li class="page-item ${pageNo==(numPage-1)?'disabled':''}">
                                <a class="page-link" href="?transporting=${check}&page=${numPage}" tabindex="-1" aria-disabled="true">Last</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </main>
        <script>
        function sortTable(col) {
          var table, rows, switching, i, x, y, shouldSwitch;
          table = document.getElementById("table");
          switching = true;
          /*Make a loop that will continue until
          no switching has been done:*/
          while (switching) {
            //start by saying: no switching is done:
            switching = false;
            rows = table.rows;
            /*Loop through all table rows (except the
            first, which contains table headers):*/
            for (i = 2; i < (rows.length - 1); i++) {
              //start by saying there should be no switching:
              shouldSwitch = false;
              /*Get the two elements you want to compare,
              one from current row and one from the next:*/
              x = rows[i].getElementsByTagName("TD")[col];
              y = rows[i + 1].getElementsByTagName("TD")[col];
              //check if the two rows should switch place:
              if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                //if so, mark as a switch and break the loop:
                shouldSwitch = true;
                break;
              }
            }
            if (shouldSwitch) {
              /*If a switch has been marked, make the switch
              and mark that a switch has been done:*/
              rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
              switching = true;
            }
          }
        }
        </script>
    </body>
</html>
