<%@ page import="java.util.List" %>
<%@ page import="com.otu.mtbs.model.Session" %>
<%@ page import="com.otu.mtbs.session.dao.SessionDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .table-container {
                margin-top: 50px;
            }
        </style>
        <title>Delete Session</title>
    </head>
    <body>
        <%@include file="../Admin/Header/header.jsp" %>
        <div class="table-container">
            <h2>Sessions List</h2>
            <% if (request.getParameter("deleteSuccess") != null) { %>
            <p style="color: green;">Session deleted successfully!</p>
            <% } else if (request.getParameter("deleteError") != null) { %>
            <p style="color: red;">Error deleting saloon. Please try again.</p>
            <% } %>

            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Movie ID</th>
                    <th>Saloon ID</th>
                </tr>
                <%
                    List<Session> sessionList = new SessionDao().getAllSessions();
                    for (Session s : sessionList) {
                %>
                <tr>
                    <td><%= s.getId() %></td>
                    <td><%= s.getMovieId() %></td>
                    <td><%= s.getSaloonId() %></td>
                    <td>
                        <form action="/Movie-Ticket-Booking-System/DeleteSessionServlet" method="post">
                            <input type="hidden" name="sessionId" value="<%= s.getId() %>">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
    </body>
</html>
