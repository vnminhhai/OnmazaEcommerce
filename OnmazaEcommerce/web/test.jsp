<%-- 
    Document   : test
    Created on : Mar 16, 2024, 12:42:37 AM
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
        <form method="POST" id="avaform" action="updateavatar" enctype="multipart/form-data">
            <div class="form-row p-t-20 text-dark fs-4">
                Upload an image (.JPG)
            </div>
            <input type="file" accept="image/jpeg" value="Browse files" name="img" id="imgvalue">
            <input type="submit" value="Update">
        </form> 
    </body>
</html>
