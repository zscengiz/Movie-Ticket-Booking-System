<%@ page import="java.util.List" %>
<%@ page import="com.otu.mtbs.model.Saloon" %>
<%@ page import="com.otu.mtbs.saloon.dao.SaloonDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Delete Saloon</title>
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
        </style></head>
    <body>
        <%@include file="../Admin/Header/header.jsp" %>
        <div class="table-container">
            <h2>Saloons List</h2>

            <% if (request.getParameter("deleteSuccess") != null) { %>
            <p style="color: green;">Saloon deleted successfully!</p>
            <% } else if (request.getParameter("deleteError") != null) { %>
            <p style="color: red;">Error deleting saloon. Please try again.</p>
            <% } %>

            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Capacity</th>
                    <th>Delete</th>
                </tr>

                <% 
                    List<Saloon> saloons = new SaloonDao().getAllSaloons();
                    for (Saloon saloon : saloons) {
                %>
                <tr>
                    <td><%= saloon.getId() %></td>
                    <td><%= saloon.getName() %></td>
                    <td><%= saloon.getCapacity() %></td>
                    <td>
                        <form action="/Movie-Ticket-Booking-System/DeleteSaloonServlet" method="post">
                            <input type="hidden" name="saloonId" value="<%= saloon.getId() %>">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
    </body>
</html>
