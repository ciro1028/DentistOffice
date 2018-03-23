<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create Your Account</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    
    <body>
        <div class="containerTwo">
            <div class="registerbox">
                <h1>Register</h1>
                <form action="http://localhost:8080/TheCleaners/registerServlet" method="post">
                    <input style="width: 125px" type="text" name="first" placeholder="First Name">
                    <input style="width: 125px" type="text" name="last" placeholder="Last Name"><br>
                    <input type="text" name="street" placeholder="Street"><br>
                    <input id="state" style="width: 215px" type="text" name="city" placeholder="City">
                    <input style="width: 35px" type="text" name="state" placeholder="State"><br>
                    <input type="text" name="phone" placeholder="Phone"> <br>
                    <input type="text" name="email" placeholder="Email"><br>
                    <input type="text" name="username" placeholder="Username"><br>
                    <input style="width: 125px" type="password" name="password1" placeholder="Password">
                    <input style="width: 125px" type="password" name="password2" placeholder="Confirm Password"><br>
                    <input type="submit" name="submit">
                </form>
            </div>
        </div>
    </body>
</html>
