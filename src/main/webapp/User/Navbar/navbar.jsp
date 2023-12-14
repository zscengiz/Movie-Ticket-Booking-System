<%@ page import="java.util.List" %>
<%@ page import="com.otu.mtbs.model.Movie" %>
<%@ page import="com.otu.mtbs.movie.dao.MovieDao" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index</title>
        <link rel="stylesheet" href="../Navbar/navbar.css">
    </head>
    <body>
        <header>
            <a href="#" class="logo">MTBS</a>
            <nav>
              <!--  <a href="/Movie-Ticket-Booking-System/User/Navbar/navbar.jsp" class="active">Home</a> api yap?l?rsa konulacak-->
                <a href="/Movie-Ticket-Booking-System/User/userMovies.jsp">Filmler</a>
                <div class="dropdown">
                    <a href="#" class="login">Login</a>
                    <div class="dropdown-content">
                        <a href="/Movie-Ticket-Booking-System/Admin/login.jsp">Admin Login</a>
                        <a href="/Movie-Ticket-Booking-System/User/login.jsp">User Login</a>
                    </div>
                </div>   
                <div class="dropdown">
                    <a href="#" class="login">Profile</a>
                    <div class="dropdown-content">
                        <a href="/Movie-Ticket-Booking-System/User/userProfile.jsp" class="login">Profil</a>
                        <a href="/Movie-Ticket-Booking-System/User/logout.jsp" class="login">Logout</a>
                    </div>
                </div>     
                <a href="#contact">Contact</a>
            </nav>
        </header>

        <script src="navbar.js"></script>
    </body>
</html>
