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
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Update personal info
                            </button>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                                Upload new avatar
                            </button>
                        </div>
                        <div class="col-3 m-0">
                            <img src="getImg?id=${customer.id}&type=user" alt="alt" class="img-fluid pe-5" id="currentAva"/>
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
                <main class="card p-3 mt-5">
                    <table id="table" class="table table-bordered text-center align-middle">
                        <thead>
                            <tr class="">
                                <th colspan="6" class="fw-bolder bg-warning-light">Your orders</th>
                            </tr>
                            <tr>
                                <th onclick="sortTable(0)" style="cursor: pointer">Order date <span class="d-inline float-end"><i class="fa fa-filter me-1"></i></span></th>
                                <th onclick="sortTable(1)" style="cursor: pointer">Required date <span class="d-inline float-end"><i class="fa fa-filter me-1"></i></span></th>
                                <th onclick="sortTable(2)" style="cursor: pointer">Ship address <span class="d-inline float-end"><i class="fa fa-filter me-1"></i></span></th>
                                <th onclick="sortTable(3)" style="cursor: pointer">Status <span class="d-inline float-end"><i class="fa fa-filter me-1"></i></span></th>
                                <th>Confirm</th>
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
                                    </td>
                                    <td>
                                        <a role="button" href="received?id=${o.id}" class="btn btn-primary-light ${o.status.toLowerCase().startsWith("t")?"":"disabled"}">Confirm</a>
                                    </td>
                                    <td>
                                        <a href="order?id=${o.id}">See Detail</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Modal 1 -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New Information</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                              <form method="POST" id="infoform" action="updateinformation">
                                <div class="form-row m-b-55">
                                    <div class="mt-2 form-label">Name</div>
                                    <div class="value">
                                        <div class="row row-space">
                                            <div class="col-6">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5 form-control" value="${customer.first_name}" type="text" name="first_name" placeholder="First Name">
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5 form-control" value="${customer.last_name}" type="text" name="last_name" placeholder="Last Name">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="mt-2 form-label">Address</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5 form-control" value="${customer.address}" type="text" name="address" placeholder="Address">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="mt-2 form-label">Email</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5 form-control" value="${customer.email}" type="email" name="email" placeholder="Email">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row m-b-55">
                                    <div class="mt-2 form-label">Phone</div>
                                    <div class="value">
                                        <div class="row row-refine">
                                            <div class="input-group-desc">
                                                <input class="input--style-5 form-control" type="text" value="${customer.mobile_phone}" name="phone" placeholder="Phone">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="document.getElementById('infoform').submit()">Save changes</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Modal 2 -->
                    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Update avatar</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <div class="wrapper wrapper--w790">
                                <form method="POST" id="avaform" action="updateavatar" enctype="multipart/form-data">
                                    <div class="form-row p-t-20 text-dark fs-4">
                                        Upload an image (.JPG)
                                    </div>
                                    <input type="file" accept="image/jpeg" name="img" id="imgvalue">
                                </form> 
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="document.getElementById('avaform').submit()">Save changes</button>
                          </div>
                        </div>
                      </div>
                    </div>
                </main>
                <div id="div1"></div>
            </div> <!-- container end.// -->
        </section>
        <%@include file="components/footerLink.html" %>
        
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
