<%@ page import="java.util.List" %>
<%@ page import="com.otu.mtbs.model.Movie" %>
<%@ page import="com.otu.mtbs.movie.dao.MovieDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Admin Movies</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background: #323946;
            }

            main {
                margin-top: 80px;
            }

            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                box-sizing: border-box;
                padding-top: 80px;
            }

            #movieList {
                list-style-type: none;
                padding: 0;
                width: 95%;
                margin: 0 auto;
            }

            .movie {
                margin-bottom: 1em;
                padding: 1em;
                border: 1px solid #ccc;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                display: flex; /* Set display to flex for flexbox layout */
            }

            .movie img {
                max-width: 100%;
                max-height: 200px;
                margin-right: 20px; /* Add margin for spacing between image and details */
            }

            .movie-details {
                flex-grow: 1; /* Allow details to take remaining space */
            }

            h3, p {
                margin: 0;
            }
        </style>
    </head>
    <body>
        <%@include file="../Admin/Header/header.jsp" %>
        <main>
            <div class="container">
                <ul id="movieList">
                    <% 
                        List<Movie> movies = new MovieDao().getAllMovies();
                        for (Movie movie : movies) {
                    %>
                    <li class="movie">
                        <img src="<%= movie.getPoster() %>" alt="<%= movie.getName() %> Poster">
                        <div class="movie-details">
                            <h3><b>Name:      </b> <%= movie.getName() %></h3>
                            <p><b>Director:   </b> <%= movie.getDirector() %></p>
                            <p><b>Cast:       </b> <%= movie.getCasts() %></p>
                            <p><b>Release Date:</b> <%= movie.getReleaseDate() %></p>
                            <p><b>Duration:   </b> <%= movie.getDuration() %></p>
                            <p><b>Description:</b> <%= movie.getDescription() %></p>
                        </div>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </main>
    </body>
</html>
