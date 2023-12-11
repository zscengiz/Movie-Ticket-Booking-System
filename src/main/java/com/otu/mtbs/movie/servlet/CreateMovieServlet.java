package com.otu.mtbs.movie.servlet;

import com.otu.mtbs.model.Movie;
import com.otu.mtbs.movie.dao.MovieDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class CreateMovieServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String director = request.getParameter("director");
        String releaseDate = request.getParameter("releaseDate");
        String casts = request.getParameter("casts");
        String description = request.getParameter("description");
        String poster = request.getParameter("posterUrl");
        String duration = request.getParameter("duration");

        Movie movie = new Movie();
        movie.setName(name);
        movie.setDirector(director);
        movie.setReleaseDate(releaseDate);
        movie.setCasts(casts);
        movie.setDescription(description);
        movie.setPoster(poster);
        movie.setDuration(duration);

        boolean isSuccess = false;

        try {
            isSuccess = MovieDao.addMovie(movie);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        if (isSuccess) {
            response.sendRedirect("Admin/addMovie.jsp?success=true");
        } else {
            response.sendRedirect("Admin/addMovie.jsp?error=true");
        }
    }
}
