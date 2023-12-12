package com.otu.mtbs.purchase.dao;

import com.otu.mtbs.model.Purchase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PurchaseDao {

    private final Connection con;
    private String query;
    private PreparedStatement pst;

    public PurchaseDao(Connection con) {
        this.con = con;
    }

    public boolean savePurchase(Purchase purchase) {
        boolean isSuccess = false;

        try {
            query = "INSERT INTO PURCHASE (user_id, session_id, movie_name, quantity, seat_number) VALUES (?, ?, ?, ?, ?);";
            pst = con.prepareStatement(query);
            pst.setInt(1, purchase.getUserId());
            pst.setInt(2, purchase.getSessionId());
            pst.setString(3, purchase.getMovieName());
            pst.setInt(4, purchase.getQuantity());
            pst.setInt(5, purchase.getSeatNumber());

            int rowsAffected = pst.executeUpdate();

            isSuccess = rowsAffected == 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return isSuccess;
    }
}
