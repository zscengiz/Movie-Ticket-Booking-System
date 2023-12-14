/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otu.mtbs.user.dao;

import com.otu.mtbs.model.User;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import org.mindrot.jbcrypt.BCrypt;

public class UserDao {

    private final Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public UserDao(Connection con) {
        this.con = con;

    }

    public User logUser(String email, String password) {

        User user = null;

        try {

            query = "SELECT * FROM USER WHERE ROLE='2' AND EMAIL=?";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            rs = pst.executeQuery();

            if (rs.next()) {

                if (checkPassword(password, rs.getString("password"))) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setEmail(rs.getString("email"));
                    user.setName(rs.getString("name"));
                    user.setRole(rs.getInt("role"));
                }

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return user;

    }

    public Boolean registerUser(String email, String password, String name) {

        if (!isUserExist(email)) {

            try {

                query = "INSERT INTO USER (email, password, name,role) VALUES (?, ?, ?, 2);";
                pst = con.prepareStatement(query);
                pst.setString(1, email);
                pst.setString(2, hashPassword(password));
                pst.setString(3, name);

                int isAdded = pst.executeUpdate();

                if (isAdded == 1) {
                    return true;
                } else {
                    return false;
                }

            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        } else {
            return false;
        }
        return false;

    }

    public Boolean isUserExist(String email) {

        User user = null;

        try {

            query = "SELECT * FROM USER WHERE ROLE='2' AND EMAIL=?";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            rs = pst.executeQuery();

            if (!rs.isBeforeFirst()) {
                System.out.println("result set is empty");
                return false;

            } else {
                System.out.println("Result set is not empty");
                return true;

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return true;

    }

    public void changePassword(int userId, String newPassword) {
        try {
            query = "UPDATE USER SET password = ? WHERE id = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, newPassword);
            pst.setInt(2, userId);

            int updatedRows = pst.executeUpdate();

            if (updatedRows == 0) {
                System.out.println("Password update failed for user with ID: " + userId);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void logout(HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
    }

    public String hashPassword(String plainTextPassword) {
        String hashedPassword = BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
        return hashedPassword;
    }

    public boolean checkPassword(String enteredPassword, String hashedPasswordFromDatabase) {
        return BCrypt.checkpw(enteredPassword, hashedPasswordFromDatabase);
    }

}
