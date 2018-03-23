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
        
        Dentists dentist = new Dentists();
        dentist = (Dentists)session.getAttribute("dentist");
        dentist.selectDentist(dentist.getId());

        String successMsg = (String)session.getAttribute("successMsg");
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
                  <li><a href="dentistHome.jsp">Home</a></li> 
                  <li><a href="dentistProfile.jsp">Profile</a></li>
                  <li><a href="appointmentsList.jsp">Appointments</a></li>
                  <form action="http://localhost:8080/DentistOffice/logoutServlet">
                    <li><a href="index.html">Log out</a></li>
                  </form>
                </ul>
            </nav>
        </div>
        <div class="rightwrapper">
            <div class="paddingTop"></div>
            <div class="wrapboxout">
                <form class="editTable" action="http://localhost:8080/DentistOffice/editDentistServlet" method="post">
                    <table>
                        <tr>
                            <td>First Name</td>
                            <td>Last Name</td>
                        </tr>
                        <tr>
                            <td><input type="text" name="fName" value="<%= dentist.getFirstName() %>"></td>
                            <td><input type="text" name="lName" value="<%= dentist.getLastName() %>"></td>
                        </tr>
                        <tr>
                            <td colspan="2">Email</td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="text" name="email" value="<%= dentist.getEmail() %>"></td>
                        </tr>
                        <tr>
                            <td colspan="2">Office</td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="text" name="office" value="<%= dentist.getOffice() %>"></td>
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


