<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin/css/style.css">
    </head>
    <body>
        <div class="wrapper">
            <h2 class="text-right">Welcome</h2>
            <div class="form-wrapper login">
                <form action="/Movie-Ticket-Booking-System/AdminLoginServlet" method="post">
                    <h2>Admin Login</h2>
                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="mail"></ion-icon>
                        </span>
                        <input type="email" id="email" name="email" placeholder="Email" maxlength="100" required>
                    </div>
                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="lock-closed"></ion-icon>
                        </span>
                        <input type="password" id="password" name="password" placeholder="Password" maxlength="100" required>
                    </div>
                    <button type="submit">Login</button>
                    <% String errorMessage = (String)request.getAttribute("loginError"); %>
                    <% if (errorMessage != null) { %>
                    <p style="color: red; margin-top: 10px;"><%= errorMessage %></p>
                    <% } %>

                </form>
            </div>
        </div>

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
