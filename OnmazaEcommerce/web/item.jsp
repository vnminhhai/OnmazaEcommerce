<%-- 
    Document   : item
    Created on : Feb 19, 2024, 7:43:26 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.item.name}</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <%@include file="components/headerLink.html" %>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
            <section id="mobile-products" class="product-store position-relative padding-large no-padding-top mt-5">
                <div class="container">
                    <form name="var" action="purchase" method="get" id="twoActionForm">
                        <div class="display-header d-flex justify-content-between pb-3 pt-3 mt-3">
                            <div class="text-dark">
                                <h2 class="display-7 text-dark text-uppercase">${item.name}</h2>
                                <p class="text-dark">Category: ${item.category.name}</p>
                                <p class="text-dark">Description: ${item.description}</p>
                                <p class="text-dark">Price: ${item.price}</p>
                            </div>
                            <div class="text-dark fs-3 text-center">
                                ${item.name} variants:
                                <br>
                                <select name="variant" class="text-center select-list" id="select">
                                    <c:forEach items="${requestScope.item.variants}" var="i">
                                        <option value="${i.name}" class="select-item fs-5">${i.name}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <c:if test="${cart_message!=null}"><p class="text-success">${cart_message}</p></c:if>
                            </div>
                            <div class="text-dark fs-3 text-center">
                                Quantity: <input type="number" value="1" name="quantity" class="w-25" min="1">
                                <br>
                                <input type="hidden" name="item" value="${item.id}">
                                <br>
                                <div style="margin-top: 10px">
                                    <input class="btn btn-warning-light border-gray-dark fs-5 fw-bold" type="submit" value="Quick purchase">
                                </div>
                            </div>
                        </div>
                        <h3>See all variants:</h3>
                        <div class="swiper product-swiper">
                          <div class="swiper-wrapper">
                            <c:forEach var="i" begin="0" end="${requestScope.item.variants.size()-1}" step="1">
                                <div class="swiper-slide">
                                    <div class="product-card position-relative">
                                    <div class="image-holder">
                                        <img src="getImg?id=${requestScope.item.variants[i].image.id}&type=variant" alt="product-item" class="img-fluid w-100" style="width:310px; height:400px;" onclick="pick('${requestScope.item.variants[i].name}')">
                                    </div>
                                    <div class="cart-concern position-absolute">
                                      <div class="cart-button d-flex">
                                          <a href="#" onclick="cart('${requestScope.item.variants[i].name}')" class="btn btn-medium btn-black">Add to Cart<svg class="cart-outline"><use xlink:href="#cart-outline"></use></svg></a>
                                      </div>
                                    </div>
                                    <div class="card-detail d-flex justify-content-around align-items-baseline pt-3">
                                        <h3 class="card-title text-uppercase">
                                            <a href="#">${requestScope.item.variants[i].name}</a>
                                        </h3>
                                        <input type="radio" name="variant" value="${requestScope.item.variants[i].name}" ${i==0?"checked":""}/>
                                        <span>${requestScope.item.variants[i].stock_amount} left</span>
                                    </div>
                                  </div>
                                </div>
                            </c:forEach>
                          </div>
                        </div>
                    </form>
                </div>
                <div class="swiper-pagination position-absolute text-center"></div>
              </section>
            </div> <!-- container end.// -->
        <script>
            function cart(s) {
              // Perform any necessary validation or preprocessing here
              var selectElement = document.getElementById("select");
                for (var i = 0; i < selectElement.options.length; i++) {
                    var option = selectElement.options[i];
                    if (option.value === s) {
                        option.selected = true;
                        break;
                    }
                }
              // Submit the form to "tocart"
              document.getElementById("twoActionForm").action = "tocart";
              document.getElementById("twoActionForm").method = "post";
              document.getElementById("twoActionForm").submit();
            }
            function pick(s) {
                var selectElement = document.getElementById("select");
                for (var i = 0; i < selectElement.options.length; i++) {
                    var option = selectElement.options[i];
                    if (option.value === s) {
                        option.selected = true;
                        break;
                    }
                }
            }
        </script>
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="js/plugins.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>
