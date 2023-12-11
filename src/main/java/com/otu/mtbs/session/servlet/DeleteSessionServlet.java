package com.otu.mtbs.session.servlet;

import com.otu.mtbs.session.dao.SessionDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteSessionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int sessionId = Integer.parseInt(request.getParameter("sessionId"));

        SessionDao.deleteSessionsBySessionId(sessionId);

        response.sendRedirect("Admin/sessionList.jsp?deleteSuccess=true");
    }
}
