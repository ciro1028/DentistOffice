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
        // creating objects to be used in this jsp
        Dentists dentist = new Dentists();
        ArrayList aList = new ArrayList();
        Appointments appointment = new Appointments();
        Patients patient = new Patients();
        Procedures procedure = new Procedures();
        
        // getting dentist from session
        dentist = (Dentists)session.getAttribute("dentist");
        // getting the list of appointments from the Dentist class
        aList = dentist.getAppointmentList(dentist.getId());
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
                            //for loop to show each appointment in the table
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


