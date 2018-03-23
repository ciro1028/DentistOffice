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
        Patients patient = new Patients();
        patient = (Patients)session.getAttribute("patient"); 
        Appointments appointment = new Appointments();
        appointment.selectAppointment("patId", patient.getPatId());
        Dentists dentist = new Dentists();
        dentist.selectDentist(appointment.getDentId());
        Procedures procedure = new Procedures();
        procedure.selectProcedure(appointment.getProcCode());
    %>
    <div class="homeContainer">
        <div class="homeHeader">
            <h3 class="logo">Dentists Inc.</h3>
        </div>
        <div class="leftwrapper">
            <nav>
                <ul id="sidemenu">
                  <li><a href="clientHome.jsp">Home</a></li>  
                  <li><a href="patientProfile.jsp">Profile</a></li>
                  <li><a href="index.html">Log out</a></li>
                </ul>
            </nav>
        </div>
        <div class="rightwrapper">
            <div class="paddingTop"></div>
            <div class="wrapboxout">
                <div class="detailsHeader">
                    <h3> Welcome  <%= patient.getFirstName() %> <%= patient.getLastName() %>.</h3>
                </div>
                <div class="homeClientBox">
                    <h3>Your next appointment will be on: <%= appointment.getApptDateTime() %>. </h3>
                    <h3>With doctor <%= dentist.getFirstName() + " " + dentist.getLastName() %>. </h3>
                    <h3>For a <%= procedure.getProcName() %>. </h3>
                    <form action="http://localhost:8080/DentistOffice/editAppointmentServlet">
                        <input type="submit" value="Edit Appointment">
                    </form>
                </div>
            </div>
            <div class="paddingBottom"></div>
        </div>
    </div>
</body>
</html>


