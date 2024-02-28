<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="section-header position-fixed top-0 start-0 end-0" style="z-index: 100">
    <section class="header-main bg-dark border-bottom py-lg-3 py-2">
        <div class="fluid-container">
            <div class="row gx-2 align-items-center">
                <div class="col-sm-2 flex-grow-0 align-items-center justify-content-evenly text-center">
                    <a class="brand-wrap me-3" href="home">
                        <img class="logo" height="40" src="./LighterOnmaza.png" alt="onmaza-logo">
                    </a> <!-- brand-wrap end.// -->
                </div> <!-- col end.// -->

                <div class="col-sm-7">
                    <form action="search" class="search my-3 my-lg-0">
                        <div class="input-group">
                            <input type="search" class="form-control" style="width:30%" placeholder="Search" name="keyword" value="${param.keyword}">
                            <button class="btn btn-warning-light">
                                <i class="fa fa-search"></i>
                            </button>
                        </div> <!-- input-group end.// -->
                    </form> <!-- search-wrap end.// -->
                </div> <!-- col end.// -->

                <div class="col-sm-3">

                    <!-- widgets-wrap  -->
                    <div class="text-light text-center">
                        <c:choose>
                            <c:when test="${sessionScope.customer == null}">
                                <div class="widget-header mx-2 text-center" style="min-width:44px">
                                    <a href="login" class="d-inline-block align-middle">
                                        <b>Login</b>
                                    </a>
                                </div>

                                <div class="widget-header mx-2 text-center" style="min-width: 44px;">
                                    <a href="register" class="d-inline-block align-middle">
                                        <b>Register</b>
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="widget-header mx-2 text-center" style="min-width: 44px;">
                                    <a href="cart" class="d-inline-block align-middle">
                                        <span class="fs-5 d-inline-block"> <i class="fa fa-shopping-cart"></i> </span>
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

                            </c:otherwise>
                        </c:choose>
                    </div>
                </div> <!-- col end.// -->
            </div> <!-- row end.// -->
        </div> <!-- container end.// -->
    </section> <!-- header-main end.// -->
</header>
<div style="height: 60px"></div>