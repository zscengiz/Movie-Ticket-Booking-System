<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="5; url=/Movie-Ticket-Booking-System/User/userMovies.jsp">
    <title>Logout Successful</title>
    <style>
        body {
            background-color: #4CAF50;
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
    </style>
</head>
<body>
    <h1>Logout Successful</h1>
    <p>You have successfully logged out.</p>
</body>
<script>
    setTimeout(function () {
        window.location.href = "/Movie-Ticket-Booking-System/index.jsp";
    }, 2000);
</script>
</html>
