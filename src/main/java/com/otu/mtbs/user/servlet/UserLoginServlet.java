/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otu.mtbs.user.servlet;

import com.otu.mtbs.connection.ConnectionDB;
import com.otu.mtbs.model.User;
import com.otu.mtbs.user.dao.UserDao;
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

/**
 *
 * @author zcengiz
 */
public class UserLoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
  try (PrintWriter out = response.getWriter()) {
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            UserDao dao = new UserDao(ConnectionDB.getConnection());
            
            User user = dao.logUser(email, password);
            
            if(user != null){
                HttpSession session = request.getSession();
                session.setAttribute("loggedAdmin", user);
                response.sendRedirect("Navbar/navbar.jsp");

            }else{
                response.sendRedirect("User/login.jsp");

            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
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
    }// </editor-fold>
}
    


