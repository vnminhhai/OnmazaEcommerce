<%@ page isErrorPage="true" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Opps!</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
        <% Throwable throwable = (Throwable) request.getAttribute("jakarta.servlet.error.exception"); %>
        <% String errorMessage = (throwable != null) ? throwable.getMessage() : "Unknown error"; %>
        <div class="d-flex align-items-center justify-content-center vh-100">
            <div class="text-center">
                <h1 class="display-1 fw-bold">${requestScope["jakarta.servlet.error.status_code"]}</h1>
                <p class="fs-3"> <span class="text-danger">Opps!</span> <%= errorMessage %></p></p>
                <p class="lead">
                    Page doesn't exist or you're not permitted.
                    <br>
                    Or maybe the back-end was fked-up.
                  </p>
                <a href="." class="btn btn-primary">Go Home</a>
            </div>
        </div>
    </body>


</html>
