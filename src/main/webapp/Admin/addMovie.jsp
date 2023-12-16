<%@ page import="java.util.List" %>
<%@ page import="com.otu.mtbs.model.Movie" %>
<%@ page import="com.otu.mtbs.movie.dao.MovieDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    com.otu.mtbs.model.User user = (com.otu.mtbs.model.User)session.getAttribute("loggedAdmin");
    if (user == null) {
        response.sendRedirect("../User/adminLoginError.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>

        <title>Add Movie</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background: #323946;
            }

            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            form {
                max-width: 800px;
                width: 100%;
                padding: 30px;
                border: 1px solid #ccc;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                margin-top: 2cm;
            }

            .form-group {
                width: 48%;
                box-sizing: border-box;
                margin-bottom: 5px;
            }

            label {
                display: block;
                margin: 1px 0 1px;
                text-align: left;
                color: #555;
            }

            input, textarea, select {
                width: calc(100% - 12px);
                padding: 12px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-bottom: 10px;
            }

            input[type="date"] {
                padding: 12px;
            }

            button {
                background-color: #4caf50;
                color: white;
                padding: 9px 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 12px;
                text-align: center;
            }

            button:hover {
                background-color: #45a049;
            }

            h2 {
                color: #333;
                width: 100%;
                margin-bottom: 0.4cm;
            }

            #posterPreview {
                max-width: 100%;
                max-height: 200px;
                margin-top: 10px;
            }

            #message {
                display: none;
                position: fixed;
                top: 10px;
                left: 50%;
                transform: translateX(-50%);
                padding: 10px;
                border-radius: 5px;
                z-index: 1000;
            }

            .success {
                background-color: green;
                color: white;
            }

            .error {
                background-color: red;
                color: white;
            }
        </style>
    </head>

    <body>
        <%@include file="../Admin/Header/header.jsp" %>
        <main>
            <center>
                <form action="/Movie-Ticket-Booking-System/CreateMovieServlet" method="post">
                    <h2>Create Movie</h2>
                    <div id="message"></div>
                    <div class="form-group">
                        <label for="name">Movie Name:</label>
                        <input type="text" id="name" name="name" required maxlength="100">

                        <label for="director">Director:</label>
                        <input type="text" id="director" name="director" required maxlength="100">

                        <label for="casts">Cast:</label>
                        <input type="text" id="casts" name="casts" required maxlength="100">

                        <div id="uploadImage">
                            <label for="poster">Poster:</label>
                            <input type="text" id="poster" name="posterUrl" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="releaseDate">Release Date:</label>
                        <input type="datetime-local" id="releaseDate" name="releaseDate" required maxlength="100">

                        <label for="duration">Duration:</label>
                        <input type="number" id="duration" name="duration" required maxlength="100">

                        <label for="description">Description:</label>
                        <textarea type="text" id="description" name="description" rows="4" required maxlength="150"></textarea>
                    </div>

                    <button type="submit">Add Movie</button>
                </form>
                <script src="js/imageUpload.js"></script>
                <script>
                    //hata mesajı için
                    function showMessage(message, color) {
                        var messageDiv = document.getElementById('message');
                        messageDiv.innerHTML = message;
                        messageDiv.className = color;
                        messageDiv.style.display = 'block';

                        setTimeout(function () {
                            messageDiv.style.display = 'none';
                        }, 1500);
                    }

                    var urlParams = new URLSearchParams(window.location.search);
                    if (urlParams.has('success')) {
                        showMessage('Movie added successfully!', 'success');
                    } else if (urlParams.has('error')) {
                        showMessage('Error adding movie. Please try again.', 'error');
                    }


                    document.addEventListener('DOMContentLoaded', function () {
                        var form = document.querySelector('form');
                        form.addEventListener('submit', function (event) {
                            // Form gönderilmeden önce kontrol yapalım
                            var posterUrlInput = document.getElementById('poster');
                            var posterUrl = posterUrlInput.value.trim();

                            if (!isValidUrl(posterUrl)) {
                                // Eğer HTTP veya HTTPS ile başlamıyorsa formu göndermeyi engelle
                                event.preventDefault();

                                // Hata mesajını göster
                                showMessage('Poster URL must start with "http://" or "https://".', 'error');
                            }
                        });

                        function isValidUrl(url) {
                            return url.startsWith('http://') || url.startsWith('https://');
                        }
                    });

                </script>
            </center>
        </main>
    </body>
</html>
