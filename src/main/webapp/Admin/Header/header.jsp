<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index</title>
        <link rel="stylesheet" href="Header/header.css">
    </head>

    <body>

        <header>
            <a href="#" class="logo">Dashboard</a>
            <nav>
                <a href="navbar.jsp" class="active"></a>
                <a href="/Movie-Ticket-Booking-System/Admin/adminMovies.jsp">Movies</a>
                <div class="dropdown">
                    <a href="#" class="login">Add</a>
                    <div class="dropdown-content">
                        <a href="/Movie-Ticket-Booking-System/Admin/addMovie.jsp">Create Movie</a>
                        <a href="/Movie-Ticket-Booking-System/Admin/addSaloon.jsp">Add Saloon</a>
                        <a href="/Movie-Ticket-Booking-System/Admin/addSession.jsp">Add Session</a>
                    </div>
                </div>    

                <div class="dropdown">
                    <a href="#" class="login">Delete</a>
                    <div class="dropdown-content">
                        <a href="/Movie-Ticket-Booking-System/Admin/moviesList.jsp">Delete Movie</a>
                        <a href="/Movie-Ticket-Booking-System/Admin/saloonList.jsp">Delete Saloon</a>
                        <a href="/Movie-Ticket-Booking-System/Admin/sessionList.jsp">Delete Session</a>

                    </div>
                </div>    
                <div class="dropdown">
                    <a href="#" class="login">Profile</a>
                    <div class="dropdown-content">
                <a href="/Movie-Ticket-Booking-System/Admin/adminProfile.jsp">Profile</a>
                <a href="/Movie-Ticket-Booking-System/User/logout.jsp" class="login">Logout</a>


                    </div>
                </div>  


            </nav>

        </header>

        <script src="navbar.js"></script>

    </body>
</html>

