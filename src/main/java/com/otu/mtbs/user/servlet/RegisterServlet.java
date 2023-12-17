/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otu.mtbs.user.servlet;

import com.otu.mtbs.admin.servlet.AdminLoginServlet;
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

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");

            if (!email.endsWith(".com")) {
                request.setAttribute("emailError", "The email must end with '.com.' .");
                RequestDispatcher rd = request.getRequestDispatcher("User/register.jsp");
                rd.forward(request, response);
                return;
            }

            UserDao dao = new UserDao(ConnectionDB.getConnection());

            Boolean isSuccess = dao.registerUser(email, password, name);

            if (isSuccess) {
                HttpSession session = request.getSession();
                request.setAttribute("successMessage", "Successful registration, you are directed to the login page.");
                out.println("<script>");
                out.println("alert('successful registration!');");
                out.println("window.location.href = 'User/login.jsp';");
                out.println("</script>");
            } else {
                request.setAttribute("loginError", "Invalid email. Please try again.");

                RequestDispatcher rd = request.getRequestDispatcher("User/register.jsp");
                rd.forward(request, response);

            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
