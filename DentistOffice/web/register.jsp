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
                <form action="http://localhost:8080/DentistOffice/registerServlet" method="post">
                    <input style="width: 125px" type="text" name="first" placeholder="First Name">
                    <input style="width: 125px" type="text" name="last" placeholder="Last Name"><br>
                    <input type="text" name="address" placeholder="Address"><br>
                    <input type="text" name="email" placeholder="Email"><br>
                    <input type="text" name="insCo" placeholder="Insurance Company"><br>
                    <input type="submit" name="submit">
                </form>
            </div>
        </div>
    </body>
</html>
