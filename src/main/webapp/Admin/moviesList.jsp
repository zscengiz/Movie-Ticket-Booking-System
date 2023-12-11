<%@ page import="java.util.List" %>
<%@ page import="com.otu.mtbs.model.Movie" %>
<%@ page import="com.otu.mtbs.movie.dao.MovieDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        </style>
        <title>Delete Movie</title>
    </head>
    <body>
        <%@include file="../Admin/Header/header.jsp" %>
        <div class="table-container">
            <h2>Movies List</h2>

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
                        <form action="<%= request.getContextPath() %>/DeleteMovieServlet" method="post">
                            <input type="hidden" name="movieID" value="<%= movie.getId() %>">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
    </body>
</html>
