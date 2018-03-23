<%-- 
    Document   : clientHome
    Created on : Mar 20, 2018, 10:52:03 AM
    Author     : Ciro
--%>

<%@page import="java.awt.event.ActionEvent"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.awt.event.ActionListener"%>ß
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.swing.Timer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Business.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
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
    <%  
        // instatiating objects to be used within the page.
        Dentists dentist = new Dentists();
        // getting dentist from the session
        dentist = (Dentists)session.getAttribute("dentist");
    %>
    
    <div class="homeContainer">
        <div class="homeHeader">
            <h3 class="logo">Dentists Inc.</h3>
        </div>
        <div class="leftwrapper">
            <nav>
                <ul id="sidemenu">
                  <li><a href="dentistHome.jsp">Home</a></li>  
                  <li><a href="dentistProfile.jsp">Profile</a></li>
                  <li><a href="appointmentsList.jsp">Appointments</a></li>
                  <li><a href="index.html">Log out</a></li>
                </ul>
            </nav>
        </div>
        <div class="rightwrapper">
            <div class="paddingTop"></div>
            <div class="wrapboxout">
                <div class="detailsHeader">
                    <h3> Welcome  <%= dentist.getFirstName() %> <%= dentist.getLastName() %></h3>
                    <h3> </h3>
                </div>
                <div class="homeClientBox">
                    <h3> Click on Appointments to check a list of appointments coming up.</h3>
                    <h3> </h3>
                    <h3> </h3>
                </div>
            </div>
            <div class="paddingBottom"></div>
        </div>
    </div>
</body>
</html>


