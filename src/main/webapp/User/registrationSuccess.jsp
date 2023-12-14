<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Success</title>
    <script type="text/javascript">
        function hideMessageAndRedirect() {
            setTimeout(function () {
                document.getElementById("successMessage").style.display = "none";
                window.location.href = "/Movie-Ticket-Booking-System/User/userMovies.jsp";
            }, 2000);
        }
    </script>
</head>
<body onload="hideMessageAndRedirect()">
    <div id="successMessage" style="background-color: #4CAF50; color: white; padding: 10px;">
        <%= session.getAttribute("registrationSuccess") %>
    </div>
</body>
</html>
