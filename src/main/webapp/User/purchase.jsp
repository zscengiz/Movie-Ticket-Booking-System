<%@ page import="java.util.List" %>
<%@ page import="com.otu.mtbs.model.Movie" %>
<%@ page import="com.otu.mtbs.model.Saloon" %>
<%@ page import="com.otu.mtbs.model.Session" %>
<%@ page import="com.otu.mtbs.session.dao.SessionDao" %>
<%@ page import="com.otu.mtbs.purchase.dao.PurchaseDao" %>
<%@ page import="com.otu.mtbs.movie.dao.MovieDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Purchase Tickets</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 20px;
                display: flex;
                justify-content: space-between;
            }

            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                height: 200px;
                margin-right: 20px;
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
                }else if(errorMessage){
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

        <form method="post" action="/Movie-Ticket-Booking-System/CreatePurchaseServlet">
            <label for="sessionId">Select Movie Session:</label>
            <select name="sessionId" id="sessionId">
                <% 
                    String movieId = request.getParameter("movieId"); 

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
        
<!-- bu aşağısı kaldırılacak satın aldığı zaman satın alındı denilecek ve ve tekrar ana sayfaya geçecek  profile bilgilerinde ne aldğı gözükecek.-->
        <div id="movieDetails">
            <h2>Selected Movie Details</h2>
            <%
                int selectedSessionId = 0;
                String sessionIdParam = request.getParameter("sessionId");
                if (sessionIdParam != null && !sessionIdParam.isEmpty()) {
                    selectedSessionId = Integer.parseInt(sessionIdParam);
                }
                Movie selectedMovie = new MovieDao().getMovieBySessionId(selectedSessionId);
            %>

            <% if (selectedMovie != null) { %>
            <p><strong>Name:</strong> <%= selectedMovie.getName() %></p>
            <p><strong>Director:</strong> <%= selectedMovie.getDirector() %></p>
            <p><strong>Release Date:</strong> <%= selectedMovie.getReleaseDate() %></p>
            <p><strong>Casts:</strong> <%= selectedMovie.getCasts() %></p>
            <p><strong>Description:</strong> <%= selectedMovie.getDescription() %></p>
            <p><strong>Duration:</strong> <%= selectedMovie.getDuration() %></p>        
            <% } else { %>
            <!--  update  -->
            <% } %>
        </div>
    </body>
</html>
