package com.otu.mtbs.session.servlet;

import com.otu.mtbs.model.Session;
import com.otu.mtbs.session.dao.SessionDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CreateSessionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String movieIDString = request.getParameter("movieID");
        String saloonIDString = request.getParameter("saloonID");

        boolean isSuccess = false;

        try {
            Integer movieID = Integer.parseInt(movieIDString);
            Integer saloonID = Integer.parseInt(saloonIDString);

            Session session = new Session();
            session.setMovieId(movieID);
            session.setSaloonId(saloonID);

            isSuccess = SessionDao.addSession(session);
        } catch (NumberFormatException ex) {
            ex.printStackTrace();
            isSuccess = false;
        } catch (Exception ex) {
            ex.printStackTrace();
            isSuccess = false;
        }

        if (isSuccess) {
            response.sendRedirect("Admin/addSession.jsp?success=true");
        } else {
            response.sendRedirect("Admin/addSession.jsp?error=true");
        }
    }
}
