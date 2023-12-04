/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otu.mtbs.connection;

import java.sql.*;


/**
 *
 * @author zcengiz
 */
public class ConnectionDB {
    
        
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        
         try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/mtbs", "root", "tomcat1234");
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        }

        
    
    }

    
}
