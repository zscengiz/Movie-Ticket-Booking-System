<%@ page import="com.otu.mtbs.model.User" %>
<%@ page import="com.otu.mtbs.user.dao.UserDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    com.otu.mtbs.model.User userr = (com.otu.mtbs.model.User)session.getAttribute("loggedAdmin");
    if (userr == null) {
        response.sendRedirect("../User/adminLoginError.jsp");
        return;
    }
%>

<!doctype html>

<html>
    <head>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                margin: 0;
                padding-top: 40px;
                color: #2e323c;
                background: #f5f6fa;
                position: relative;
                height: 100%;
            }
            .account-settings .user-profile {
                margin: 0 0 1rem 0;
                padding-bottom: 1rem;
                text-align: center;
            }
            .account-settings .user-profile .user-avatar {
                margin: 0 0 1rem 0;
            }
            .account-settings .user-profile .user-avatar img {
                width: 90px;
                height: 90px;
                -webkit-border-radius: 100px;
                -moz-border-radius: 100px;
                border-radius: 100px;
            }
            .account-settings .user-profile h5.user-name {
                margin: 0 0 0.5rem 0;
            }
            .account-settings .user-profile h6.user-email {
                margin: 0;
                font-size: 0.8rem;
                font-weight: 400;
                color: #9fa8b9;
            }
            .account-settings .about {
                margin: 2rem 0 0 0;
                text-align: center;
            }
            .account-settings .about h5 {
                margin: 0 0 15px 0;
                color: #007ae1;
            }
            .account-settings .about p {
                font-size: 0.825rem;
            }
            .form-control {
                border: 1px solid #cfd1d8;
                -webkit-border-radius: 2px;
                -moz-border-radius: 2px;
                border-radius: 2px;
                font-size: .825rem;
                background: #ffffff;
                color: #2e323c;
            }

            .card {
                background: #ffffff;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                border: 0;
                margin-bottom: 1rem;
            }
        </style>
    </head>
    <body>  
        <%@ include file="../Admin/Header/header.jsp" %>
        <br>
        <br>
        <br>
        <div class="container">
            <div class="row gutters">
                <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="account-settings">
                                <div class="user-profile">
                                    <div class="user-avatar">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">
                                    </div>

                                    <%
                                    com.otu.mtbs.model.User user = (com.otu.mtbs.model.User) session.getAttribute("loggedAdmin");

                                    if (user != null) {
                                    %>
                                    <h5 class="user-name"><%= user.getName() %></h5>
                                    <h6 class="user-email"><%= user.getEmail() %></h6>
                                    <%
                                        } else {
                                    %>
                                    <p style="color: red;">User not logged in. Please <a href="User/login.jsp">login</a>.</p>
                                    <%
                                        }
                                    %>                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
