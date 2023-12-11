package com.otu.mtbs.saloon.dao;

import com.otu.mtbs.model.Saloon;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SaloonDao {

    private static final String URL = "jdbc:mysql://localhost:3306/mtbs";
    private static final String USER = "root";
    private static final String PASSWORD = "tomcat1234";

    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    private static void closeResources(Connection con, Statement stmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean addSaloon(Saloon saloon) {
        boolean isSuccess = false;

        try {
            Connection con = getConnection();
            PreparedStatement pst = con.prepareStatement("INSERT INTO SALOON (name, capacity) VALUES (?, ?);");

            pst.setString(1, saloon.getName());
            pst.setString(2, saloon.getCapacity());

            int rowsAffected = pst.executeUpdate();
            isSuccess = rowsAffected == 1;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return isSuccess;
    }

    public static List<Saloon> getAllSaloons() {
        List<Saloon> saloons = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM SALOON;");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Saloon saloon = new Saloon();
                saloon.setId(rs.getInt("id"));
                saloon.setName(rs.getString("name"));
                saloon.setCapacity(rs.getString("capacity"));
                saloons.add(saloon);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return saloons;
    }

    public static Saloon getSaloonById(Integer saloonId) {
        Saloon saloon = null;

        try {
            Connection con = getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM SALOON WHERE id = ?;");

            pst.setInt(1, saloonId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                saloon = new Saloon();
                saloon.setId(rs.getInt("id"));
                saloon.setName(rs.getString("name"));
                saloon.setCapacity(rs.getString("capacity"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return saloon;
    }

    public static boolean deleteSaloonById(int saloonId) {
        boolean isSuccess = false;

        try {
            Connection con = getConnection();
            PreparedStatement pst = con.prepareStatement("DELETE FROM SALOON WHERE id = ?;");

            pst.setInt(1, saloonId);

            int rowsAffected = pst.executeUpdate();
            isSuccess = rowsAffected == 1;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return isSuccess;
    }
}
