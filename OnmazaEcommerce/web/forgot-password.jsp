<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot password</title>

    </head>
    <body>
            <div class="container py-3"></div>
            <div id="logreg-forms">
                <form class="form-signin" action="forgot" method="post">
                <c:if test="${error!=null }">
                    <div class="alert alert-danger" role="alert">${error}</div>
                </c:if>
                <c:if test="${mess!=null}">
                    <div class="alert alert-success" role="alert">
                        ${mess}
                    </div>
                </c:if>
                <h3 style="text-align: center">Forgot password</h3>
                <p><input name="username" type="text" class="form-control" placeholder="User name" >
                <p><input name="email" type="text" class="form-control" placeholder="Email" >
                    <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i>Send</button> 
            </form>
        </div>
    </body>
</html>