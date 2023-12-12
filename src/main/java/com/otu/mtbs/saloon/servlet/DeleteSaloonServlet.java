package com.otu.mtbs.saloon.servlet;

import com.otu.mtbs.saloon.dao.SaloonDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteSaloonServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int saloonId = Integer.parseInt(request.getParameter("saloonId"));

        boolean isSuccess = SaloonDao.deleteSaloonById(saloonId);

        if (isSuccess) {

            response.sendRedirect("Admin/saloonList.jsp?deleteSuccess=true");

        } else {

            response.sendRedirect("Admin/saloonList.jsp?deleteError=true");
        }
    }
}
