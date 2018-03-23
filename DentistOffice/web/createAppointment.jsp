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
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script>var __adobewebfontsappname__="dreamweaver"</script>
        <script src="http://use.edgefonts.net/source-sans-pro:n2:default.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $( function() {
            $( "#datepicker" ).datepicker();
            } );
        </script>
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
        
        String message = "Create your new appointment.";
        String message2 = "";
        String check = (String)session.getAttribute("check");
        if(check != null) {
          message = "Choose new appointment"; 
          message2 = "Old appointment: " + appointment.getApptDateTime() + "        Dentist: " + dentist.getFirstName() + " " + dentist.getLastName() + "          Proc: " + procedure.getProcName();
        }
        
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
                    <h4><%= message %></h4>
                    <h6><%= message2 %></h6>
                </div>
                <div class="createAppointmentBox">
                    <form action="http://localhost:8080/DentistOffice/createAppointmentServlet" method="post">
                        <table>
                            <tr>
                                <td>Date:</td>
                                <td><input type="text" id="datepicker" name="datepicker" placeholder="click to select"></td>
                            </tr>
                            <tr>
                                <td>Time:</td>
                                <td>
                                    <select id="time" name='time'>
                                        <option value="8am">8am</option>
                                        <option value="9am">9am</option>
                                        <option value="10am">10am</option>
                                        <option value="11am">11am</option>
                                        <option value="12pm">12pm</option>
                                        <option value="1pm">1pm</option>
                                        <option value="2pm">2pm</option>
                                        <option value="3pm">3pm</option>
                                        <option value="4pm">4pm</option>
                                        <option value="5pm">5pm</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Dentist:</td>
                                <td>
                                    <select id="dentist" name='dentist'>
                                    <option value="D201">Frank Martin</option>
                                    <option value="D202">Susan Cassidy</option>
                                    <option value="D203">Jerry York</option>
                                    <option value="D204">Wayne Patterson</option>
                                    </select> 
                                </td>
                            </tr>
                            <tr>
                                <td>Procedure:</td>
                                <td>
                                    <select id="procedure" name='procedure'>
                                    <option value="P114">Cleaning/Exam</option>
                                    <option value="P119">X-Ray</option>
                                    <option value="P122">Whitening</option>
                                    <option value="P321">Cavity</option>
                                    <option value="P650">Top Denture</option>
                                    <option value="P660">Bottom Denture</option>
                                    <option value="P780">Crown</option>
                                    <option value="P790">Root Canal</option>
                                 </select> 
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" value="Create Appointment"></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="paddingBottom"></div>
        </div>
    </div>
</body>
</html>



