<%-- 
    Document   : errorLogin
    Created on : Mar 20, 2018, 10:52:37 AM
    Author     : Ciro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Business.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<!doctype html>
<html lang="en-US">
    <head>
        <title>Login Form</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <%
        // getting password of current user from session
        String password = (String)session.getAttribute("password");
        // getting usernname of current user from session
        String user = (String)session.getAttribute("user");
        // if statement to reset password and user string to empty
        if (password == null){
            password = "";
        }
        if (user == null){
            user = "";
        }
    %>
        <div class="containerTwo">
            <div class="loginbox">
                <img src="Images/avatar.png" class="avatar">
                <h1>Login</h1>
                <form action="http://localhost:8080/DentistOffice/recoverPasswordServlet" method="post">
                    <p></p>
                    <input type="text" name="username" placeholder="Enter Username">
                    <h4 style="text-align: center; color: red"> <%= user %></h4>
                    <h4 style="text-align: center; color: red"><%= password %></h4>
                        <br>
                        <% session.removeAttribute("user"); session.removeAttribute("password"); %>
                    <input type="submit" name="submit" value="Recover Password"><br>
                    <a href="login.jsp">Back to Login</a> 
                </form>
            </div>
        </div>
    </body>
</html>