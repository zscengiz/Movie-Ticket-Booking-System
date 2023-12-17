<%@ page import="java.util.List" %>
<%@ page import="com.otu.mtbs.model.Movie" %>
<%@ page import="com.otu.mtbs.movie.dao.MovieDao" %>
<%@ page import="com.otu.mtbs.movie.dao.DeleteMovieDao" %> 
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    com.otu.mtbs.model.User user = (com.otu.mtbs.model.User)session.getAttribute("loggedAdmin");
    if (user == null) {
        response.sendRedirect("../User/adminLoginError.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .table-container {
                margin-top: 50px;
            }

            .message-container {
                position: fixed;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
                padding: 10px;
                border-radius: 5px;
                width: 300px;
                text-align: center;
                display: none;
            }

            .success {
                background-color: #4caf50;
                color: white;
            }

            .error {
                background-color: #ff4444;
                color: white;
            }
        </style>
        <title>Delete Movie</title>
    </head>
    <body>
        <%@include file="../Admin/Header/header.jsp" %>
        <div class="table-container">
            <h2>Movies List</h2>

            <div id="message-container" class="message-container"></div>

            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Director</th>
                    <th>Release Date</th>
                    <th>Casts</th>
                    <th>Description</th>
                    <th>Poster</th>
                    <th>Duration</th>
                    <th>Actions</th>
                </tr>

                <%
                    List<Movie> movies = new MovieDao().getAllMovies();
                    for (Movie movie : movies) {
                %>
                <tr>
                    <td><%= movie.getId() %></td>
                    <td><%= movie.getName() %></td>
                    <td><%= movie.getDirector() %></td>
                    <td><%= movie.getReleaseDate() %></td>
                    <td><%= movie.getCasts() %></td>
                    <td><%= movie.getDescription() %></td>
                    <td><%= movie.getPoster() %></td>
                    <td><%= movie.getDuration() %></td>
                    <td>
                        <form action="<%= request.getContextPath() %>/DeleteMovieServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this movie?');">
                            <input type="hidden" name="movieID" value="<%= movie.getId() %>">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>

                <% } %>
            </table>
        </div>

        <script>
            var urlParams = new URLSearchParams(window.location.search);
            var messageContainer = document.getElementById('message-container');

            if (urlParams.has('deleteSuccess')) {
                showMessage('Movie deleted successfully!', 'success');
            } else if (urlParams.has('deleteError')) {
                showMessage('Error deleting movie. Please try again.', 'error');
            }

            function showMessage(message, color) {
                messageContainer.innerHTML = message;
                messageContainer.className = 'message-container ' + color;
                messageContainer.style.display = 'block';

                setTimeout(function () {
                    messageContainer.style.display = 'none';
                }, 1500);
            }
        </script>
    </body>
</html>
