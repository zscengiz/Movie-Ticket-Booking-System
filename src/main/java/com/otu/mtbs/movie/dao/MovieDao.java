package com.otu.mtbs.movie.dao;

import com.otu.mtbs.connection.ConnectionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.otu.mtbs.model.Movie;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class MovieDao {

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

    public Movie getMovieById(int movieId) {
        Movie movie = null;

        try {
            Connection con = getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM MOVIE WHERE id = ?");

            pst.setInt(1, movieId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                movie = new Movie();
                movie.setId(rs.getInt("id"));
                movie.setName(rs.getString("name"));
                movie.setDirector(rs.getString("director"));
                movie.setReleaseDate(rs.getString("release_date"));
                movie.setCasts(rs.getString("casts"));
                movie.setDescription(rs.getString("description"));
                movie.setPoster(rs.getString("poster"));
                movie.setDuration(rs.getString("duration"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return movie;
    }

    public Movie getMovieBySessionId(int sessionId) {
        Movie movie = null;

        try {
            Connection con = getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT M.* FROM MOVIE M " + "JOIN SESSION S ON M.id = S.movie_id " + "WHERE S.id = ?");

            pst.setInt(1, sessionId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                movie = new Movie();
                movie.setId(rs.getInt("id"));
                movie.setName(rs.getString("name"));
                movie.setDirector(rs.getString("director"));
                movie.setReleaseDate(rs.getString("release_date"));
                movie.setCasts(rs.getString("casts"));
                movie.setDescription(rs.getString("description"));
                movie.setPoster(rs.getString("poster"));
                movie.setDuration(rs.getString("duration"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return movie;
    }

    public static boolean addMovie(Movie movie) {
        boolean isSuccess = false;

        if (!isMovieNameExists(movie.getName())) {
            try {
                Connection con = getConnection();
                PreparedStatement pst = con.prepareStatement("INSERT INTO MOVIE (name, director, release_date, casts, description, poster, duration) VALUES (?, ?, ?, ?, ?, ?, ?);");

                pst.setString(1, movie.getName());
                pst.setString(2, movie.getDirector());

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date parsedDate = dateFormat.parse(movie.getReleaseDate());
                java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

                pst.setDate(3, sqlDate);
                pst.setString(4, movie.getCasts());
                pst.setString(5, movie.getDescription());
                pst.setString(6, movie.getPoster());
                pst.setString(7, movie.getDuration());

                int rowsAffected = pst.executeUpdate();
                isSuccess = rowsAffected == 1;

            } catch (SQLException | ParseException ex) {
                ex.printStackTrace();
            }
        }

        return isSuccess;
    }

    private static boolean isMovieNameExists(String movieName) {
        try {
            Connection con = getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT COUNT(*) FROM MOVIE WHERE name = ?");

            pst.setString(1, movieName);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    public List<Movie> getAllMovies() throws ClassNotFoundException {
        List<Movie> movies = new ArrayList<>();

        try {
            Connection con = ConnectionDB.getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM MOVIE");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Movie movie = new Movie();
                movie.setId(rs.getInt("id"));
                movie.setName(rs.getString("name"));
                movie.setDirector(rs.getString("director"));
                movie.setReleaseDate(rs.getString("release_date"));
                movie.setCasts(rs.getString("casts"));
                movie.setDescription(rs.getString("description"));
                movie.setPoster(rs.getString("poster"));
                movie.setDuration(rs.getString("duration"));
                movies.add(movie);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return movies;
    }
}
