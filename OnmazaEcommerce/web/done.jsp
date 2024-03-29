<%-- 
    Document   : done
    Created on : Feb 21, 2024, 3:40:19 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order status</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="d-flex align-items-center justify-content-center vh-100">
            <div class="text-center">
                <h1 class="display-1 fw-bold">Successful</h1>
                <p class="fs-3"> <span class="fw-bold text-success">Done!</span> ${mess1}</p>
                <p class="lead">
                    ${mess2}
                </p>
                <a href="${pageContext.request.contextPath}" class="btn btn-primary">Home</a>
            </div>
        </div>
    </body>
</html>
