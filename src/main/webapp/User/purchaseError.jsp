<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Purchase Error</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                text-align: center;
                padding-top: 100px;
            }

            .error-message {
                background-color: red;
                color: white;
                padding: 10px;
                margin-top: 10px;
                opacity: 1;
                height: 10px;
                transition: opacity 1s ease-in-out;
            }
        </style>
        <script type="text/javascript">
            function redirectToPurchasePage() {
                setTimeout(function () {
                    window.location.href = "/Movie-Ticket-Booking-System/User/userMovies.jsp";
                }, 1500);
            }
            window.onload = redirectToPurchasePage;
        </script>
    </head>
    <body>
        <div id="errorMessage" class="error-message">
            <%= request.getAttribute("errorMessage") %>
        </div>
    </body>
</html>
