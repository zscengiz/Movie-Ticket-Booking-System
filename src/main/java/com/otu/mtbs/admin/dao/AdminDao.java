/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otu.mtbs.admin.dao;

import com.otu.mtbs.model.User;
import java.sql.*;

/**
 *
 * @author zcengiz
 */
public class AdminDao {

    private final Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public AdminDao(Connection con) {
        this.con = con;

    }

    public User logAdmin(String email, String password) {

        User admin = null;

        try {

            query = "SELECT * FROM USER WHERE ROLE='1' AND EMAIL=? AND PASSWORD=?;";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();

            if (rs.next()) {
                admin = new User();
                admin.setId(rs.getInt("id"));
                admin.setEmail(rs.getString("email"));
                admin.setName(rs.getString("name"));
                admin.setRole(rs.getInt("role"));
                admin.setPassword(rs.getString("password"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return admin;

    }

}
