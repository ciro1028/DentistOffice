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
        // intantiating objects to be used in this page
        Patients patient = new Patients();
        // getting patient from the current session
        patient = (Patients)session.getAttribute("patient");
        // selecting current patient from the database
        patient.selectPatient(patient.getPatId());
        // message to be displayed when profile is updated
        String successMsg = (String)session.getAttribute("successMsg");
        // if statement to reset success message string to null
        if (successMsg == null) {
            successMsg = "";
        }
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
                  <form action="http://localhost:8080/DentistOffice/logoutServlet">
                    <li><a href="index.html">Log out</a></li>
                  </form>
                </ul>
            </nav>
        </div>
        <div class="rightwrapper">
            <div class="paddingTop"></div>
            <div class="wrapboxout">
                <form class="editTable" action="http://localhost:8080/DentistOffice/editPatientServlet" method="post">
                    <table>
                        <tr>
                            <td>First Name</td>
                            <td>Last Name</td>
                        </tr>
                        <tr>
                            <td><input type="text" name="fName" value="<%= patient.getFirstName() %>"></td>
                            <td><input type="text" name="lName" value="<%= patient.getLastName() %>"></td>
                        </tr>
                        <tr>
                            <td colspan="2">Address</td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="text" name="address" value="<%= patient.getAddress() %>"></td>
                        </tr>
                        <tr>
                            <td colspan="2">Email</td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="text" name="email" value="<%= patient.getEmail() %>"></td>
                        </tr>
                        <tr>
                            <td colspan="2">Insurance Company</td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="text" name="insCo" value="<%= patient.getInsCo() %>"></td>
                        </tr>
                        <tr>
                            <td style="color: red"> <%= successMsg %> </td>
                            <td><input type="submit" value="Submit"></td>
                        </tr>   
                    </table>
                </form>
            </div>
            <div class="paddingBottom"></div>
        </div>
    </div>
    <% session.removeAttribute("successMsg"); %>
</body>
</html>


