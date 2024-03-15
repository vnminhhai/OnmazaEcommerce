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

                    <!-- Modal 1 -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New Information</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <form method="POST">
                                <div class="form-row m-b-55">
                                    <div class="name">Name</div>
                                    <div class="value">
                                        <div class="row row-space">
                                            <div class="col-2">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" name="first_name">
                                                    <label class="label--desc">first name</label>
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" name="last_name">
                                                    <label class="label--desc">last name</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="name">Company</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="text" name="company">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="name">Email</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="email" name="email">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row m-b-55">
                                    <div class="name">Phone</div>
                                    <div class="value">
                                        <div class="row row-refine">
                                            <div class="col-3">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" name="area_code">
                                                    <label class="label--desc">Area Code</label>
                                                </div>
                                            </div>
                                            <div class="col-9">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" name="phone">
                                                    <label class="label--desc">Phone Number</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row p-t-20">
                                    <label class="label label--block">Are you an existing customer?</label>
                                    <div class="p-t-15">
                                        <label class="radio-container m-r-55">Yes
                                            <input type="radio" checked="checked" name="exist">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">No
                                            <input type="radio" name="exist">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </form>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Modal 2 -->
                    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New Information</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <div class="wrapper wrapper--w790">
                                <form method="POST">
                                    <div class="form-row p-t-20 text-dark fs-4">
                                        Upload an image (.JPG)
                                    </div>
                                    <input type="file" accept="image/jpeg" value="Browse files" name="img">
                                </form> 
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                          </div>
                        </div>
                      </div>
                    </div>
                </main>
                <div id="div1"></div>
            </div> <!-- container end.// -->
        </section>
<!--        <script>
            $(document).ready(function(){
                $("#ava").click(function(){
                    $("#div1").load("components/informationForm.html");
                });
            });
            $(document).ready(function(){
                $("#info").click(function(){
                    $("#div1").load("components/informationForm.html");
                });
            });
        </script>-->
        <%@include file="components/footerLink.html" %>
    </body>
</html>
