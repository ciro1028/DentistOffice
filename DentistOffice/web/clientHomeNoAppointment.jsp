<%-- 
    Document   : clientHome
    Created on : Mar 20, 2018, 10:52:03 AM
    Author     : Ciro
--%>

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
        // instatiating objects to be used in this jsp
        Patients patient = new Patients();
        Appointments appointment = new Appointments();
        // gettin patient from session
        patient = (Patients)session.getAttribute("patient"); 
        
        // selecting appointent with the right patient
        appointment.selectAppointment("patId", patient.getPatId());
    %>
    <div class="homeContainer">
        <div class="homeHeader">
            <h3 class="logo">Dentists Inc.</h3>
        </div>
        <div class="leftwrapper">
            <nav>
                <ul id="sidemenu">
                  <li><a href="clientHomeNoAppointment.jsp">Home</a></li>  
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
                    <h3> Welcome  <%= patient.getFirstName() %> <%= patient.getLastName() %>.</h3>
                </div>
                <div class="homeClientBoxN">
                    <div class="appMessage">
                        <h3>You don't have any appointments scheduled at this time.</h3>
                    </div>
                    <div class="appButton">
                        <form action="createAppointment.jsp">
                            <input type="submit" value="Create Appointment">
                            
                        </form>
                    </div>
                </div>
            </div>
            <div class="paddingBottom"></div>
        </div>
    </div>
</body>
</html>



