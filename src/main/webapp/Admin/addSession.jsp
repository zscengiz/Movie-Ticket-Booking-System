<%@ page import="java.util.List" %>
<%@ page import="com.otu.mtbs.model.Movie" %>
<%@ page import="com.otu.mtbs.movie.dao.MovieDao" %>
<%@ page import="com.otu.mtbs.model.Saloon" %>
<%@ page import="com.otu.mtbs.saloon.dao.SaloonDao" %>
<%@ page import="com.otu.mtbs.session.dao.SessionDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background: #323946;
            }

            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }


            form {
                max-width: 800px;
                width: 100%;
                padding: 30px;
                border: 1px solid #ccc;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                margin-top: 2cm;
            }

            .form-group {
                width: 48%;
                box-sizing: border-box;
                margin-bottom: 5px;
            }


            label {
                display: block;
                margin: 1px 0 1px;
                text-align: left;
                color: #555;
            }

            input, textarea, select {
                width: calc(100% - 12px);
                padding: 12px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-bottom: 10px;
            }

            input[type="date"] {
                padding: 12px;
            }

            button {
                background-color: #4caf50;
                color: white;
                padding: 9px 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 12px;
                text-align: center;
            }

            button:hover {
                background-color: #45a049;
            }
            h2 {
                color: #333;
                width: 100%;
                margin-bottom: 0.4cm;
            }

        </style>S
        <title>Add Session</title>

        <script>
            function showMessage(message, color) {
                var messageBox = document.createElement('div');
                messageBox.innerHTML = message;
                messageBox.style.position = 'fixed';
                messageBox.style.bottom = '10px';
                messageBox.style.left = '50%';
                messageBox.style.transform = 'translateX(-50%)';
                messageBox.style.padding = '10px';
                messageBox.style.background = color;
                messageBox.style.color = 'white';
                messageBox.style.borderRadius = '5px';
                document.body.appendChild(messageBox);
                setTimeout(function () {
                    messageBox.style.display = 'none';
                }, 3000);
            }

            window.onload = function () {
                var errorParam = '<%= request.getParameter("error") %>';
                if (errorParam === 'true') {
                    showMessage('Invalid parameters. Please check the values and try again.', 'red');
                }
                var successParam = '<%= request.getParameter("success") %>';
                if (successParam && successParam.toLowerCase() === 'true') {
                    showMessage('Session added successfully!', 'green');
                } else {
                    var errorParam = '<%= request.getParameter("error") %>';
                    if (errorParam && errorParam.toLowerCase() === 'true') {
                        showMessage('Invalid parameters. Please check the values and try again.', 'red');
                    }
                }
            };
        </script>

    </head>
    <body>
        <%@include file="../Admin/Header/header.jsp" %>
    <center>

        <form action="/Movie-Ticket-Booking-System/CreateSessionServlet" method="post" onsubmit="return validateForm()">
            <h2>Add Session</h2>

            <label for="movieID">Movie:</label>
            <select id="movieID" name="movieID" required>
                <option value="">Select a Movie</option>
                <% List<Movie> movies = new MovieDao().getAllMovies();
                   for (Movie movie : movies) { %>
                <option value="<%= movie.getId() %>"><%= movie.getName() %></option>
                <% } %>
            </select>

            <label for="saloonID">Saloon:</label>
            <select id="saloonID" name="saloonID" required>
                <option value="">Select a Saloon</option>
                <% List<Saloon> saloons = SaloonDao.getAllSaloons();
                   for (Saloon saloon : saloons) { %>
                <option value="<%= saloon.getId() %>"><%= saloon.getName() %></option>
                <% } %>
            </select>

            <button type="submit">Add Session</button>
        </form>

        <% 
            String movieIDParam = request.getParameter("movieID");
            String saloonIDParam = request.getParameter("saloonID");

            if (movieIDParam != null && saloonIDParam != null) {
                try {
                    int selectedMovieID = Integer.parseInt(movieIDParam);
                    int selectedSaloonID = Integer.parseInt(saloonIDParam);

                    if (SessionDao.isSessionExists(selectedMovieID, selectedSaloonID)) {
        %>
        <script>showMessage('There is another session with the same Movie ID and Saloon ID. Session not saved.', 'orange');</script>
        <%
                    }
                } catch (NumberFormatException ex) {
        %>
        <script>showMessage('Invalid parameters. Please check the values and try again.', 'red');</script>
        <%
                }
            }
        %>
    </center>

</body>
</html>
