<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Purchase Success</title>
        <script type="text/javascript">
            function redirectToUserMovies() {
                setTimeout(function () {
                    window.location.href = "/Movie-Ticket-Booking-System/User/login.jsp";
                }, 2000);
            }
            window.onload = redirectToUserMovies;
        </script>
    </head>
    <body>
        <div style="background-color: #4CAF50; color: white; padding: 10px;">
            Success Message: <%= request.getAttribute("successMessage") %>
        </div>
    </body>
</html>
