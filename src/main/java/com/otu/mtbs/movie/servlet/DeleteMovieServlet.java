package com.otu.mtbs.movie.servlet;

import com.otu.mtbs.movie.dao.DeleteMovieDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteMovieServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String movieIDString = request.getParameter("movieID");

        if (movieIDString != null && !movieIDString.isEmpty()) {
            try {
                Integer movieID = Integer.parseInt(movieIDString);

                boolean isSuccess = DeleteMovieDao.deleteMovie(movieID);

                if (isSuccess) {
                    response.sendRedirect("Admin/adminMovies.jsp?deleteSuccess=true");
                } else {
                    response.sendRedirect("Admin/adminMovies.jsp?deleteError=true");
                }
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                response.sendRedirect("Admin/adminMovies.jsp?deleteError=true");
            }
        } else {
            response.sendRedirect("Admin/adminMovies.jsp?deleteError=true");
        }
    }
}
