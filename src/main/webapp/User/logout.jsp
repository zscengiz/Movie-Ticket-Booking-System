<%@ page import="java.io.IOException" %>
<%@ page import="jakarta.servlet.http.HttpSession, jakarta.servlet.http.Cookie" %>
<%@ page import="com.otu.mtbs.user.dao.UserDao" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="com.otu.mtbs.connection.ConnectionDB" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession currentSession = request.getSession();

  
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
                cookie.setPath("/Movie-Ticket-Booking-System");
                response.addCookie(cookie);
            }
        }
    if (currentSession != null) {
        currentSession.invalidate();
    }

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Logout</title>
    </head>
    <body>
        <div id="logoutMessage" style="display:none; background-color: #4CAF50; color: white; padding: 10px; position: fixed; top: 0; left: 50%; transform: translateX(-50%); z-index: 1000;">

            The session has been terminated successfully.

        </div>

        <script>
            document.getElementById("logoutMessage").style.display = "block";

            setTimeout(function () {
                document.getElementById("logoutMessage").style.display = "none";
            }, 2000);

            setTimeout(function () {
                window.location.href = "<%= request.getContextPath() %>/index.jsp";
            }, 2000);
        </script>
    </body>
</html>
