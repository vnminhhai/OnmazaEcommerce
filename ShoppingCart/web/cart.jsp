<%-- 
    Document   : cart
    Created on : Feb 27, 2024, 11:14:43 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <%@include file="components/headerLink.html" %>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <section class="section-intro mb-3 mt-5">
            <div class="container">
                <main class="card p-3">
                    <div class="row">
                        <aside class="col-lg-3">
                            <nav class="nav flex-column nav-pills mb-3 mb-lg-0">
                                <c:forEach var="category" items="${categories}">
                                    <a class="nav-link text-truncate" href="search?category=${category.slug}"><b>${category.name}</b></a>
                                        </c:forEach>
                            </nav>
                        </aside>
                        <div class="col-lg-9">

                            <div class="row">
                                <div class="col-xxl-9 col-lg-8">

                                    <!-- carousel -->
                                    <div id="carouselMain" class="carousel-main carousel slide" data-bs-ride="carousel">
                                        <div class="carousel-inner">
                                            <article class="carousel-item active">
                                                <div class="carousel-caption">
                                                    <h2 class="mb-3">
                                                        <span class="fw-normal">Latest trending</span> <br> <strong>Electronic items</strong>
                                                    </h2>
                                                    <a href="#" class="btn btn-warning"> View more </a>
                                                </div>
                                                <img style="height: 352px;" src="https://bootstrap-ecommerce-web.netlify.app/images/banners/main-tech.png" class="d-block w-100 img-cover" alt="Banner">
                                            </article>
                                            <article class="carousel-item">
                                                <div class="carousel-caption">
                                                    <h2 class="mb-3">
                                                        <span class="fw-normal">Latest delas</span> <br> <strong>Best Smartphones</strong>
                                                    </h2>
                                                    <a href="#" class="btn btn-warning"> View more </a>
                                                </div>
                                                <img style="height: 352px;" src="https://bootstrap-ecommerce-web.netlify.app/images/banners/main-phone.png" class="d-block w-100 img-cover" alt="Banner">
                                            </article>
                                        </div>  <!-- carousel-inner .// -->

                                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselMain" data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Previous</span>
                                        </button>

                                        <button class="carousel-control-next" type="button" data-bs-target="#carouselMain" data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Next</span>
                                        </button>

                                    </div>
                                    <!-- carousel .//end -->

                                </div>
                                <div class="col-xxl-3 col-lg-4 d-none d-lg-block">
                                    <!-- main-right -->
                                    <div class="bg-primary-light p-3 rounded mb-3">
                                        <c:choose>
                                            <c:when test="${sessionScope.customer == null}">
                                                <p class="d-flex mb-3 text-base">
                                                    <img src="https://bootstrap-ecommerce-web.netlify.app/images/avatars/avatar.jpg" class="img-avatar me-2" width="44" height="44" alt="">
                                                    <span>Hi, user <br> please login!</span>
                                                </p>
                                                <a href="login" class="btn btn-sm btn-primary w-100">Login</a>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="d-flex mb-3 text-base">
                                                    <img src="image/user?id=${sessionScope.customer.id}" class="img-avatar me-2" width="44" height="44" style="object-fit: cover" alt="${sessionScope.customer.first_name}">
                                                    <span>Hi, ${sessionScope.customer.first_name} ${sessionScope.customer.last_name} <br> let's shopping!</span>
                                                </p>
                                                <a href="logout" class="btn btn-sm btn-primary w-100">Logout</a>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>

                                    <div class="bg-warning text-white p-3 rounded mb-2">
                                        Get US $10 off with a new supplier account 
                                        <br> <a href="#" class="text-white mt-1 fw-bold d-inline-block">Get now</a>
                                    </div>
                                    <div class="bg-info text-white p-3 rounded mb-2">
                                        Send quotes with supplier preferences 
                                        <br> <a href="#" class="text-white mt-1 fw-bold d-inline-block">Try now</a>
                                    </div>
                                    <!-- main-right -->
                                </div>
                            </div> <!-- row.// -->
                        </div>
                        <!-- col.// -->
                    </div>
                </main>
            </div> <!-- container end.// -->
        </section>
    </body>
</html>
