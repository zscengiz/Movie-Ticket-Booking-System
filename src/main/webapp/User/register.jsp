<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/User/css/style.css">
    </head>
    <body>
    <%@ include file="../User/Navbar/navbar.jsp" %>

        <div class="wrapper">
            <h2 class="text-right">Welcome</h2>
            <div class="form-wrapper login">

                <div class="form-wrapper register">
                    <form action="/Movie-Ticket-Booking-System/RegisterServlet" method="post">
                        <h2>Registration</h2>
                        <div class="input-box">
                            <span class="icon">
                                <ion-icon name="person"></ion-icon>
                            </span>
                            <input type="text" id="name" name="name" placeholder="Name" required>

                        </div>
                        <div class="input-box">
                            <span class="icon">
                                <ion-icon name="mail"></ion-icon>
                            </span>
                            <input type="email" id="email" name="email" placeholder="Email" required>

                        </div>
                        <div class="input-box">
                            <span class="icon">
                                <ion-icon name="lock-closed"></ion-icon>
                            </span>
                            <input type="password" id="password" name="password" placeholder="Password" required>

                        </div>
                        <% String errorMessage = (String)request.getAttribute("loginError"); %>
                        <% if (errorMessage != null) { %>
                        <p style="color: red; margin-top: 10px;"><%= errorMessage %></p>
                        <% } %>

                        <button type="submit">Register</button>
                        <div class="sign-link">
                            <p>Already have an account? <a href="login.jsp">Login</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>