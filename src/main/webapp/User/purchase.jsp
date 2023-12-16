<%@ page import="java.util.List" %>
<%@ page import="com.otu.mtbs.model.Movie" %>
<%@ page import="com.otu.mtbs.model.Saloon" %>
<%@ page import="com.otu.mtbs.model.Session" %>
<%@ page import="com.otu.mtbs.session.dao.SessionDao" %>
<%@ page import="com.otu.mtbs.purchase.dao.PurchaseDao" %>
<%@ page import="com.otu.mtbs.movie.dao.MovieDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="purchaseBean" class="com.otu.mtbs.model.PurchaseBean" scope="request" />
<%
    com.otu.mtbs.model.User userr = (com.otu.mtbs.model.User)session.getAttribute("loggedUser");
    if (userr == null) {
        response.sendRedirect("../User/indxLoginError.jsp");
        return;
    }
%>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/User/Navbar/navbar.css">

        <meta charset="UTF-8">
        <title>Purchase Tickets</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                height: 200px;
                margin-top: 30px;

            }

            #movieDetails {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                color: #333;
            }

            select, input {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                background-color: #4caf50;
                color: #fff;
                cursor: pointer;
            }

            .success-message {
                background-color: #4CAF50;
                color: white;
                padding: 10px;
                margin-top: 10px;
                opacity: 1;
                height: 10px;
                transition: opacity 1s ease-in-out;
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
        <script>
            function hideSuccessMessage() {
                var successMessage = document.getElementById('successMessage');
                var errorMessage = document.getElementById('errorMessage');
                if (successMessage) {
                    setTimeout(function () {
                        successMessage.style.opacity = '0';
                    }, 1200);
                } else if (errorMessage) {
                    setTimeout(function () {
                        errorMessage.style.opacity = '0';
                    }, 1200);
                }
            }
            window.onload = hideSuccessMessage;
        </script>
    </head>
    <body>
        <%@ include file="../User/Navbar/navbar.jsp" %>

    <center>
        <form method="post" action="/Movie-Ticket-Booking-System/CreatePurchaseServlet">
            <label for="sessionId">Select Movie Session:</label>
            <select name="sessionId" id="sessionId">
                <% 
                    String movieId = request.getParameter("movieId"); 
                       session.setAttribute("movieId", movieId);


                    if (movieId != null && !movieId.isEmpty()) {
                        List<Session> sessions = SessionDao.getAllSessionsById(Integer.parseInt(movieId));
                        for (Session movieSession : sessions) {                     
                %>
                <option value="<%= movieSession.getId()%>">
                    <%= movieSession.getMovieName() %> - Saloon <%= movieSession.getSaloonId() %>
                </option>
                <% 
                        }
                    }
                %>
            </select>

            <br>

            <label for="seatNumber">Select Seat Number:</label>
            <input type="number" name="seatNumber" required>

            <br>

            <button type="submit">Purchase Ticket</button>
        </form>
    </center>
    <% 
        String successMessage = (String) request.getAttribute("successMessage");
        if (successMessage != null) {
    %>
    <div id="successMessage" class="success-message">
        <%= successMessage %>
    </div>
    <% } %>

    <% 
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
    <div id="errorMessage" class="error-message">
        <%= errorMessage %>
    </div>
    <% } %>

</body>
</html>
