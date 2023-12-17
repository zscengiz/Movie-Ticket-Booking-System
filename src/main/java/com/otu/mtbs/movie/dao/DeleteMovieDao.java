package com.otu.mtbs.movie.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteMovieDao {

    private static final String URL = "jdbc:mysql://localhost:3306/mtbs";
    private static final String USER = "root";
    private static final String PASSWORD = "tomcat1234";

    public static boolean deleteMovie(int movieId) {
        boolean isSuccess = false;

        try {
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pst = con.prepareStatement("DELETE FROM MOVIE WHERE id = ?");

            pst.setInt(1, movieId);

            int rowsAffected = pst.executeUpdate();

            isSuccess = rowsAffected == 1;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }

}
