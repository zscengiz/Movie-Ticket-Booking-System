/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otu.mtbs.user.dao;

import com.otu.mtbs.model.User;
import java.sql.*;

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

            query = "SELECT * FROM USER WHERE ROLE='2' AND EMAIL=? AND PASSWORD=?;";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setName(rs.getString("name"));
                user.setRole(rs.getInt("role"));
                user.setPassword(rs.getString("password"));
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
                pst.setString(2, password);
                pst.setString(3, name);
                
                int isAdded = pst.executeUpdate();

                if(isAdded == 1) {
                    return true;
                }else{
                   return false; 
                }

            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }else{
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

}
