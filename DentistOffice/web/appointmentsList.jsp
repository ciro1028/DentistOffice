<%-- 
    Document   : clientHome
    Created on : Mar 20, 2018, 10:52:03 AM
    Author     : Ciro
--%>

<%@page import="Business.Procedures"%>
<%@page import="Business.Patients"%>
<%@page import="Business.Appointments"%>
<%@page import="Business.Dentists"%>
<%@page import="java.util.ArrayList"%>
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
<body>
    <%
        Dentists dentist = new Dentists();
        dentist = (Dentists)session.getAttribute("dentist");
        ArrayList aList = new ArrayList();
        aList = dentist.getAppointmentList(dentist.getId());
        Appointments appointment = new Appointments();
        Patients patient = new Patients();
        Procedures procedure = new Procedures();
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
                  <li><a href="appointments.jsp">Appointments</a></li>
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
                    <h3> Appointments coming up</h3>
                </div>
                <div class="appTable">
                    <table>
                        <tr>
                            <th>Date/Time</th>
                            <th>Patient</th>
                            <th>Procedure</th>
                        </tr>
                        <%
                            for (Object app : aList) {
                                appointment = (Appointments)app;
                        %>
                            <tr>
                                <td><%= appointment.getApptDateTime() %></td>
                                <% patient.selectPatient(appointment.getPatId()); %>
                                <td><%= patient.getFirstName() %> <%= patient.getLastName() %></td>
                                <% procedure.selectProcedure(appointment.getProcCode()); %>
                                <td><%= procedure.getProcName() %></td>
                            </tr>
                        <%          
                                }
                        %>
                    </table>
                </div>
            </div>
            <div class="paddingBottom"></div>
        </div>
    </div>
</body>
</html>


