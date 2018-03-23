<%-- 
    Document   : clientHome
    Created on : Mar 20, 2018, 10:52:03 AM
    Author     : Ciro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script>var __adobewebfontsappname__="dreamweaver"</script>
        <script src="http://use.edgefonts.net/source-sans-pro:n2:default.js" type="text/javascript"></script>
</head>
<body class="homeBody">
    <div class="homeContainer">
        <div class="homeHeader">
            <h3 class="logo">Dentists Inc.</h3>
        </div>
        <div class="leftwrapper">
            <nav>
                <ul id="sidemenu">
                  <form action="http://localhost:8080/DentistOffice/logoutServlet">
                    <li><a href="clientHomeNoAppointment.jsp">Home</a></li> 
                  </form>
                  
                  <li><a href="patientProfile.jsp">Profile</a></li>
                  <form action="http://localhost:8080/DentistOffice/logoutServlet">
                    <li><a href="index.html">Log out</a></li>
                  </form>
                </ul>
            </nav>
        </div>
        <div class="rightwrapper">
            <div class="paddingTop"></div>
            <div class="wrapboxout">
                <div class="detailsHeader">
                    <h3 id="accountConfirm">Your appointment was created successfully!</h3>
                </div>
                <div class="profileTable">
                    
                </div>
            </div>
            <div class="paddingBottom"></div>
        </div>
    </div>
</body>
</html>