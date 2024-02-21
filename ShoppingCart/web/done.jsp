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
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Successful!</h2>
        <button class="link-button" onclick="openURL('./home')">Home</button>
        <script>
            function openURL(url) {
                window.location.href = url;
            }
        </script>
    </body>
</html>
