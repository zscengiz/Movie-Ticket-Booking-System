package com.otu.mtbs.purchase.dao;

import com.otu.mtbs.connection.ConnectionDB;
import com.otu.mtbs.model.Purchase;
import com.otu.mtbs.model.PurchaseBean;
import com.otu.mtbs.model.Session;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PurchaseDao {

    public boolean savePurchase(PurchaseBean purchase) throws ClassNotFoundException {
        boolean isSuccess = false;

        try {
            String query = "INSERT INTO PURCHASE (user_id, session_id, movie_name, quantity, seat_number) VALUES (?, ?, ?, ?, ?);";
            PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(query);
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

    public static List<Purchase> getAllPurchaseByUserId(Integer userId) throws ClassNotFoundException {

        List<Purchase> purchaseList = new ArrayList<>();

        try {
            String query = "SELECT * FROM PURCHASE WHERE user_id = ?";
            PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(query);
            pst.setInt(1, userId);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Purchase purchase = new Purchase();
                purchase.setId(rs.getInt("id"));
                purchase.setMovieName(rs.getString("movie_name"));
                purchase.setQuantity(rs.getInt("quantity"));
                purchase.setSeatNumber(rs.getInt("seat_number"));
                purchase.setSessionId(rs.getInt("session_id"));
                purchaseList.add(purchase);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return purchaseList;
    }
}
