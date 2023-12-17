<%@ page import="java.util.List" %>
<%@ page import="com.otu.mtbs.model.Saloon" %>
<%@ page import="com.otu.mtbs.saloon.dao.SaloonDao" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    com.otu.mtbs.model.User user = (com.otu.mtbs.model.User)session.getAttribute("loggedAdmin");
    if (user == null) {
        response.sendRedirect("../User/adminLoginError.jsp");
        return;
    }
%>
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

            .message-container {
                position: fixed;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
                padding: 10px;
                border-radius: 5px;
                width: 300px;
                text-align: center;
                display: none;
            }

            .success {
                background-color: #4caf50;
                color: white;
            }

            .error {
                background-color: #ff4444;
                color: white;
            }
        </style>
    </head>
    <body>
        <%@ include file="../Admin/Header/header.jsp" %>
        <div class="table-container">
            <h2>Saloons List</h2>

            <div id="message-container" class="message-container"></div>

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
                        <form action="/Movie-Ticket-Booking-System/DeleteSaloonServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this saloon?');">
                            <input type="hidden" name="saloonId" value="<%= saloon.getId() %>">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>

        <script>
            var urlParams = new URLSearchParams(window.location.search);
            var messageContainer = document.getElementById('message-container');

            if (urlParams.has('deleteSuccess')) {
                showMessage('Saloon deleted successfully!', 'success');
            } else if (urlParams.has('deleteError')) {
                showMessage('Error deleting saloon. Please try again.', 'error');
            }

            function showMessage(message, color) {
                messageContainer.innerHTML = message;
                messageContainer.className = 'message-container ' + color;
                messageContainer.style.display = 'block';

                setTimeout(function () {
                    messageContainer.style.display = 'none';
                }, 1500);
            }
        </script>
    </body>
</html>
