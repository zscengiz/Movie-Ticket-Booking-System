package com.otu.mtbs.session.dao;

import com.otu.mtbs.model.Session;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SessionDao {

    private static final String URL = "jdbc:mysql://localhost:3306/mtbs";
    private static final String USER = "root";
    private static final String PASSWORD = "tomcat1234";

    public static boolean addSession(Session session) {
        boolean isSuccess = false;

        try {
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pst = con.prepareStatement("INSERT INTO SESSION (movie_id, saloon_id) VALUES (?, ?);");

            if (!isSessionExists(session.getMovieId(), session.getSaloonId())) {
                pst.setInt(1, session.getMovieId());
                pst.setInt(2, session.getSaloonId());

                int rowsAffected = pst.executeUpdate();

                isSuccess = rowsAffected == 1;
            } else {
                // Aynı MovieID ve SaloonID var ise hata sonra düzenle burayı
                System.err.println("Session with the same MovieID and SaloonID already exists.");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return isSuccess;
    }

    public static List<Session> getAllSessions() {
        List<Session> sessions = new ArrayList<>();

        try {
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pst = con.prepareStatement("SELECT * FROM SESSION");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("id"));
                session.setMovieId(rs.getInt("movie_id"));
                session.setSaloonId(rs.getInt("saloon_id"));
                sessions.add(session);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return sessions;
    }

    public static List<Session> getAllSessionsById(Integer id) {
        List<Session> sessions = new ArrayList<>();

        try {

            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pst = con.prepareStatement("SELECT SESSION.ID, SESSION.SALOON_ID, MOVIE.NAME FROM SESSION INNER JOIN MOVIE ON SESSION.MOVIE_ID = ? AND MOVIE.ID = ?;");
            pst.setInt(1, id);
            pst.setInt(2, id);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("id"));
                session.setMovieName(rs.getString("name"));
                session.setSaloonId(rs.getInt("saloon_id"));
                sessions.add(session);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return sessions;
    }

    public static boolean isSessionExists(int movieId, int saloonId) {
        try {
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pst = con.prepareStatement("SELECT COUNT(*) FROM SESSION WHERE movie_id = ? AND saloon_id = ?");

            pst.setInt(1, movieId);
            pst.setInt(2, saloonId);
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

    public static void deleteSessionsByMovieId(int movieId) {
        try {
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pst = con.prepareStatement("DELETE FROM SESSION WHERE movie_id = ?");

            pst.setInt(1, movieId);
            int rowsAffected = pst.executeUpdate();

            if (rowsAffected != 1) {
                System.err.println("Failed to delete sessions for movie with id: " + movieId);
            }

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    public static void deleteSessionsBySessionId(int sessionId) {
        try {
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pst = con.prepareStatement("DELETE FROM SESSION WHERE id = ?");

            pst.setInt(1, sessionId);
            int rowsAffected = pst.executeUpdate();

            if (rowsAffected != 1) {
                System.err.println("Failed to delete session with id: " + sessionId);
            }

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    public Session getSessionById(int sessionId) {
        Session session = null;

        try {
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pst = con.prepareStatement("SELECT * FROM SESSION WHERE id = ?");

            pst.setInt(1, sessionId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                session = new Session();
                session.setId(rs.getInt("id"));
                session.setMovieId(rs.getInt("movie_id"));
                session.setSaloonId(rs.getInt("saloon_id"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return session;
    }
}
