package com.otu.mtbs.purchase.servlet;

import com.otu.mtbs.connection.ConnectionDB;
import com.otu.mtbs.model.PurchaseBean;
import com.otu.mtbs.model.User;
import com.otu.mtbs.purchase.dao.PurchaseDao;
import com.otu.mtbs.movie.dao.MovieDao;
import com.otu.mtbs.session.dao.SessionDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CreatePurchaseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        boolean isSuccess = false;

        try {
            Integer sessionId = Integer.parseInt(request.getParameter("sessionId"));
            Integer seatNumber = Integer.parseInt(request.getParameter("seatNumber"));
            User user = (User) request.getSession().getAttribute("loggedUser");

            int userId = user.getId();
            String movieName = new MovieDao().getMovieBySessionId(sessionId).getName();

            List<Integer> seats = new SessionDao().getPurchasedSeatsBySessionId(sessionId);

            if (seats.contains(seatNumber)) {
                request.setAttribute("errorMessage", "Seat number already purchased.");
                request.getRequestDispatcher("User/purchaseError.jsp").forward(request, response);
                return; // Return to avoid further processing
            }

            PurchaseBean purchase = new PurchaseBean(null, userId, sessionId, movieName, 1, seatNumber);

            isSuccess = new PurchaseDao(ConnectionDB.getConnection()).savePurchase(purchase);

            if (isSuccess) {
                request.setAttribute("successMessage", "Purchase successful. Your tickets have been reserved.");
                request.getRequestDispatcher("User/purchaseSuccess.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Failed to process the purchase.");
                request.getRequestDispatcher("User/purchaseError.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred.");
            request.getRequestDispatcher("User/purchaseError.jsp").forward(request, response);
        }
    }
}
