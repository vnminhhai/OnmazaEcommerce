<%-- 
    Document   : updateItem
    Created on : Mar 18, 2024, 7:37:55 PM
    Author     : ADMIN
--%>
<%@page import="dal.ItemDAO" %>
<% 
    if (request.getParameter("id")!=null) {
        request.setAttribute("choice",Integer.parseInt(request.getParameter("id")));
        request.setAttribute("item", new ItemDAO().getRecordById(Integer.parseInt(request.getParameter("id"))));
    } 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Item</title>
        <%@include file="../components/headerLink.html" %>
    </head>
    <body>
        <%@include file="../components/header.jsp" %>
        <section class="section-intro mb-3 mt-5">
            <div class="container">
                <main class="card p-3 mb-3">
                    <div class="card-header fw-bold text-center">Update item</div>
                    <div class="mt-3">
                        <div class="row mb-2">
                            <select name="item" id="selector" onchange="{window.location.href='?id='+document.getElementById('selector').value;}" class="col-4 ms-4">
                                <option ${choice!=null?"disabled":""}>Choose an item</option>
                                <c:forEach items="${list}" var="i">
                                    <option value="${i.id}" ${i.id==choice?"selected":""}>${i.name}</option>
                                </c:forEach>
                            </select>
                            <form action="" class="col-7">
                                <input name="keyword">
                                <input type="submit" value="Search" />
                            </form>
                        </div>
                        <c:if test="${item!=null}">
                            <form action="updateItem" class="form" method="post">
                                <span class="form-label m-3">Name: </span><input value="${item.name}" class="form-control mb-2" name="name">
                                <span class="form-label m-3">Description: </span><input value="${item.description}" class="form-control mb-2" name="description">
                                <span class="form-label m-3">Price: </span><input value="${item.price}" class="form-control mb-2" name="price">
                                <input type="hidden" name="id" value="${item.id}">
                                <p class="form-label m-3"></p><input type="submit" value="Update" class="btn btn-dark" />
                            </form>
                            <div class="mt-3">
                                <p class="fw-bolder text-black text-center">Variants:</p>
                                <c:forEach items="${item.variants}" var="v">
                                    <form action="updateVariant" class="form mt-3" method="post">
                                        <div class="row">
                                            <div class="col-9">
                                                <span class="form-label m-3">Name: </span><input value="${v.name}" class="form-control mb-2" name="name">
                                                <span class="form-label m-3">Stock: </span><input value="${v.stock_amount}" class="form-control mb-2" name="stock">
                                                <input type="submit" value="Update" class="btn btn-dark mt-3" />
                                                <button type="button" class="btn btn-dark mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                    Upload new image
                                                </button>
                                            </div>
                                            <div class="col-3">
                                                <span class="form-label m-3"><img src="getImg?id=${v.image.id}&type=variant" alt="${v.name}" class="img-fluid text-center" style="height: 210px; width: 150px;"/>
                                            </div>
                                        </div>
                                        <input type="hidden" name="id" value="${item.id}">
                                    </form>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                                <!-- ----------modal---------- -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Update image</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <div class="wrapper wrapper--w790">
                                <form method="POST" id="imgform" action="updateavatar" enctype="multipart/form-data">
                                    <div class="form-row p-t-20 text-dark fs-4">
                                        Upload an image (.JPG)
                                    </div>
                                    <input type="file" accept="image/jpeg" name="img" id="imgvalue">
                                </form> 
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="document.getElementById('imgform').submit()">Save changes</button>
                          </div>
                        </div>
                      </div>
                    </div>
                </main>
            </div> <!-- container end.// -->
        </section>
        <script>
            
        </script>
    </body>
</html>
