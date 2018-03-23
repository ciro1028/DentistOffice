<%-- 
    Document   : login
    Created on : Mar 20, 2018, 10:42:01 AM
    Author     : Ciro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US">
    <head>
        <title>Login Form</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
    <body>
        <div class="containerTwo">
            <div class="loginbox">
                <img src="Images/avatar.png" class="avatar">
                <h1>Login</h1>
                <form action="http://localhost:8080/DentistOffice/loginServlet" method="post">
                    <p>Username</p>
                    <input type="text" name="username" placeholder="Enter Username">
                    <p>Password</p>
                    <input type="password" name="password" placeholder="Enter Password">
                    <input type="submit" name="submit" value="Login"><br>
                    <a href="forgotPassword.jsp">Forgot Your Password?</a><br>
                    <a href="register.jsp">Register</a>  
                </form>
            </div>
        </div>
    </body>
</html>
