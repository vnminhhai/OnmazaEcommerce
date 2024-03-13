<%-- 
    Document   : login
    Created on : Feb 19, 2024, 9:54:34 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <%@include file="components/headerLink.html" %>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <section class="section-intro mb-3 mt-5">
            <div class="container">
                <main class="card p-3">
                    <form action="login" method="post">
                        User name: <input name="User_Name" type="text"><br>
                        Password: <input name="Password" type="password"><br>
                        <p style="color: red; display: <%= (request.getAttribute("message") == null) ? "none" : "inline" %>;">
                            <%= request.getAttribute("message") %>
                            <br>
                        </p>
                        <input type="submit" value="Login">
                    </form>
                    <div class="text-sm flex items-center justify-center gap-1">
                        <span>Don't have account?</span>
                        <a
                            href="${pageContext.request.contextPath}/register"
                            class="text-primary transition-all"
                        >
                            Register now
                        </a>
                    </div>
                </main>
            </div> <!-- container end.// -->
        </section>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            const loginBtn = document.querySelector("#loginBtn");
            const loginMessageBox = document.querySelector("#loginMessage");
            const loginMessage = loginMessageBox.querySelector("p");
            
            const email = document.querySelector("#email");
            const password = document.querySelector("#password");
            
            const inputs = [email, password];
            
            inputs.forEach((input) => {
                input.onchange = () => {
                    loginMessageBox.classList.add("hidden");
                }
            })
            
            const loadingChild =
                `<svg
                    class="animate-spin -ml-1 mr-3 h-5 w-5 text-white"
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                >
                    <circle
                        class="opacity-25"
                        cx="12"
                        cy="12"
                        r="10"
                        stroke="currentColor"
                        strokeWidth="4"
                    ></circle>
                    <path
                        class="opacity-75"
                        fill="currentColor"
                        d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
                    ></path>
                </svg>`;
            const setBtnLoading = (isLoading) => {
                if(isLoading) {
                    loginBtn.disabled = true;
                    loginBtn.innerHTML = loadingChild;
                } else {
                    loginBtn.disabled = false;
                    loginBtn.innerHTML = `<span class="text-white font-semibold">Login</span>`
                }
            }
            
            loginBtn.onclick = () => {
                setBtnLoading(true);
                $.ajax({
                    type:"post",
                    url:"/login",
                    data: {
                        email: email.value,
                        password: password.value,
                        redirect: (new URL(document.location)).searchParams.get("redirect")
                    },
                    cache: false,
                    success: function (response) {
                        switch(response) {
                            case "Logged":
                                window.open("/", "_self");
                                break;
                            case "Invalid email":
                                setBtnLoading(false);
                                loginMessageBox.classList.remove("hidden");
                                loginMessage.textContent = "Invalid email, please try again!";
                                break;
                            case "Invalid password":
                                setBtnLoading(false);
                                loginMessageBox.classList.remove("hidden");
                                loginMessage.textContent = "Incorrect password, please try again!";
                                break;
                            case "Banned":
                                setBtnLoading(false);
                                loginMessageBox.classList.remove("hidden");
                                loginMessage.textContent = "You have been banned by the administrator!";
                                break;
                            default:
                                window.open(response, "_self");
                        }
                    }
                });
            }
            window.addEventListener('keyup', function(event) {
                if (event.keyCode === 13) {
                    loginBtn.click();
                }
            });
        </script>
    </body>
</html>
