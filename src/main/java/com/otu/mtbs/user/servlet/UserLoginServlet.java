package com.otu.mtbs.user.servlet;

import com.otu.mtbs.connection.ConnectionDB;
import com.otu.mtbs.model.User;
import com.otu.mtbs.user.dao.UserDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserLoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            UserDao dao = new UserDao(ConnectionDB.getConnection());

            User user = dao.logUser(email, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedAdmin", user);
                response.sendRedirect("Navbar/navbar.jsp");

            } else {
                // Hata mesajını request üzerinden iletiyoruz
                request.setAttribute("loginError", "Invalid email or password. Please try again.");

                // Hata durumunda login sayfasına geri yönlendirme
                RequestDispatcher rd = request.getRequestDispatcher("User/login.jsp");
                rd.forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
