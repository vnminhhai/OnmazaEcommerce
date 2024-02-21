<%-- 
    Document   : home
    Created on : Feb 18, 2024, 5:05:30 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <div id="header-div">
            <span id="logo">
                
            </span>
            <span id="search">
                <form action="search" style="display: inline">
                    <input type="text" name="keyword">
                    <input type="submit" value="Search">
                </form>
            </span>
            <span id="login-button" style="float: right; margin-right: 15px;">
                <button class="link-button" onclick="openURL('./login')">Login</button>
                <button class="link-button" onclick="openURL('./register')">Register</button>
            </span>
            <nav style="display: flex; justify-content: space-around; font-size: 24px;">
                <ul style="display: flex; justify-content: space-around; align-items: center; list-style-type: none; padding: 0; width: 80%">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Products</a></li>
                    <li><a href="#">Cart</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
            </nav>
        </div>
        
        <header>
            <h1>Welcome to Onmaza</h1>
        </header>

        <main>
            <section>
                <h2>Featured Products</h2>
                <!-- Display featured products here -->
            </section>

            <section>
                <h2>New Arrivals</h2>
                <!-- Display new arrival products here -->
            </section>
        </main>

        <footer>
            <p>&copy; 2024 Onmaza. All rights reserved.</p>
        </footer>
        <div id="body">
            
        </div>
        <script>
            function openURL(url) {
                window.location.href = url;
            }
        </script>
    </body>
</html>
