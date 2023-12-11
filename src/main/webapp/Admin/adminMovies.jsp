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
                background-color: #f4f4f4;
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
                width: 60%;
                margin: 0 auto;
            }

            .movie {
                margin-bottom: 1em;
                padding: 1em;
                border: 1px solid #ccc;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                text-align: center;
            }

            h3, p {
                margin: 0;
            }

            img {
                max-width: 100%;
                max-height: 200px;
                margin-top: 10px;
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
                        <h3>Name: <%= movie.getName() %></h3>
                        <p>Director: <%= movie.getDirector() %></p>
                        <p>Cast: <%= movie.getCasts() %></p>
                        <p>Release Date: <%= movie.getReleaseDate() %></p>
                        <p>Duration: <%= movie.getDuration() %></p>
                        <p>Description: <%= movie.getDescription() %></p>

                        Poster: <img src="<%= movie.getPoster() %>" alt="<%= movie.getName() %> Poster">
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </main>
    </body>
</html>
