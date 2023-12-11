package com.otu.mtbs.saloon.servlet;

import com.otu.mtbs.model.Saloon;
import com.otu.mtbs.saloon.dao.SaloonDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CreateSaloonServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String saloonName = request.getParameter("saloonName");
        String saloonCapacity = request.getParameter("saloonCapacity");

        Saloon saloon = new Saloon();
        saloon.setName(saloonName);
        saloon.setCapacity(saloonCapacity);

        boolean isSuccess = false;

        try {
            isSuccess = SaloonDao.addSaloon(saloon);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        if (isSuccess) {
            response.sendRedirect("Admin/addSaloon.jsp?success=true");
        } else {
            response.sendRedirect("Admin/addSaloon.jsp?error=true");
        }
    }
}
