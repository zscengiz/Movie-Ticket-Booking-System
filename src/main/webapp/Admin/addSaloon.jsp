<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Saloon</title>
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

        #message {
            display: none;
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            padding: 10px;
            border-radius: 5px;
            width: 300px;
            text-align: center;
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
    <center>
        <form action="/Movie-Ticket-Booking-System/CreateSaloonServlet" method="post">
            <h2>Add Saloon</h2>
            <label for="saloonName">Saloon Name:</label>
            <input type="text" id="saloonName" name="saloonName" required maxlength="200">

            <label for="saloonCapacity">Capacity:</label>
            <input type="text" id="saloonCapacity" name="saloonCapacity" required>

            <div id="message"></div>

            <button type="submit">Add Saloon</button>
        </form>
        <script>
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
                showMessage('Saloon added successfully!', 'success');
            } else if (urlParams.has('error')) {
                showMessage('Error adding saloon. Please try again.', 'error');
            }
        </script>
    </center>
</body>
</html>
