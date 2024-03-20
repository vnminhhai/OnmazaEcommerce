<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Category, dal.CategoryDAO, java.util.List" %>
<% request.setAttribute("categories", new CategoryDAO().getCategoryList()); %>
<%request.setAttribute("cat", request.getParameter("category")); %>

<header class="section-header position-fixed top-0 start-0 end-0" style="z-index: 100">
    <section class="header-main bg-dark border-bottom py-lg-3 py-2">
        <div class="fluid-container">
            <div class="row gx-2 align-items-center">
                <div class="col-sm-2 flex-grow-0 align-items-center justify-content-evenly text-center">
                    <a class="brand-wrap me-3" href="${pageContext.request.contextPath}">
                        <img class="logo" height="40" src="./LighterOnmaza.png" alt="onmaza-logo">
                    </a> <!-- brand-wrap end.// -->
                </div> <!-- col end.// -->

                <div class="col-sm-7">
                    <div class="text-light text-center">
                        <div class="widget-header mx-5 px-4 text-center" style="min-width:44px">
                            <a href="" class="d-inline-block align-middle">
                                <span class="fs-5 d-inline-block"> <i class="fa fa-bar-chart"></i> </span>
                                <small style="max-width:80px;" class="d-block text-truncate"> Statistic </small>
                            </a>
                        </div>

                        <div class="widget-header mx-5 px-4 text-center" style="min-width: 44px;">
                            <a href="" class="d-inline-block align-middle">
                                <span class="fs-5 d-inline-block"> <i class="fa fa-newspaper"></i> </span>
                                <small style="max-width:80px;" class="d-block text-truncate"> Dashboard </small>
                            </a>
                        </div>
                        
                        <div class="widget-header mx-5 px-4 text-center" style="min-width:44px">
                            <a href="${pageContext.request.contextPath}/manageAccount" class="d-inline-block align-middle">
                                <span class="fs-5 d-inline-block"> <i class="fa fa-id-card"></i> </span>
                                <small style="max-width:80px;" class="d-block text-truncate"> Accounts </small>
                            </a>
                        </div>

                        <div class="widget-header mx-5 px-4 text-center" style="min-width: 44px;">
                            <a href="" class="d-inline-block align-middle">
                                <span class="fs-5 d-inline-block"> <i class="fa fa-sitemap"></i> </span>
                                <small style="max-width:80px;" class="d-block text-truncate"> Features </small>
                            </a>
                        </div>
                    </div>
                </div> <!-- col end.// -->

                <div class="col-sm-3">

                    <!-- widgets-wrap  -->
                    <div class="text-light text-center">
                        <div class="widget-header mx-2 text-center" style="min-width: 44px;">
                            <a href="cart" class="d-inline-block align-middle">
                                <span class="fs-5 d-inline-block"> <i class="fa fa-shopping-cart"></i> </span>
                                <c:if test="${cart_item_number>0}">
                                    <span class="badge rounded-pill badge-notification bg-danger position-fixed px-1">${cart_item_number}</span>
                                </c:if>
                                <small style="max-width:80px;" class="d-block text-truncate"> Cart </small>
                            </a>
                        </div>

                        <div class="widget-header mx-2 text-center" style="min-width:44px">
                            <a href="user" class="d-inline-block align-middle">
                                <span class="fs-5 d-inline-block"> <i class="fa fa-user"></i> </span>
                                <small style="max-width:80px;" class="d-block text-truncate"> Profile </small>
                            </a>
                        </div>

                        <div class="widget-header mx-2 text-center" style="min-width: 44px;">
                            <a href="logout" class="d-inline-block align-middle">
                                <span class="fs-5 d-inline-block"> <i class="fas fa-sign-out-alt"></i> </span>
                                <small style="max-width:80px;" class="d-block text-truncate"> Logout </small>
                            </a>
                        </div>
                    </div>
                </div> <!-- col end.// -->
            </div> <!-- row end.// -->
        </div> <!-- container end.// -->
    </section> <!-- header-main end.// -->
</header>
<div style="height: 60px"></div>