/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Business.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ciro
 */
@WebServlet(urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //instatiating objects to be used in this servlet
            Patients patient = new Patients();
            Dentists dentist = new Dentists();
            Appointments appointment = new Appointments();
            // getting username and password enterd by the user in the login.jsp
            String enteredUsername = request.getParameter("username");
            String enteredPassword = request.getParameter("password");
            
            //seleceting patient on the database based on the username entered
            patient.selectPatient(enteredUsername);
            //seleceting detist on the database based on the username entered
            dentist.selectDentist(enteredUsername);
            // creating new session
            HttpSession session = request.getSession();
            
            // if statement to determine if user is a dentist, a patient, or if it exists at all
            if (patient.getPatId() == null && dentist.getId() == null){
                //if user doesn't exist send it to error page
                RequestDispatcher rd = request.getRequestDispatcher("/errorLogin.jsp");
                rd.forward(request, response);
                // if user is a patient
            } else if (patient.getPatId() != null){
                //if statement to check if user entered correct password
                if (enteredPassword.equals(patient.getPassword())){
                    // entered here if patient entered correct password
                    // sending current patient to session
                    session.setAttribute("patient", patient);
                    // select appointment based on current patient
                    appointment.selectAppointment("patId", patient.getPatId());
                    // if statement to check if patient has any appointment scheduled
                    if (appointment.getApptDateTime() == null){
                        // no appointment
                        RequestDispatcher rd = request.getRequestDispatcher("/clientHomeNoAppointment.jsp");
                        rd.forward(request, response);
                    } else {
                        // patient has appointment
                        RequestDispatcher rd = request.getRequestDispatcher("clientHome.jsp");
                        rd.forward(request, response);
                    }
                } else {
                    // user entered wrong password
                    RequestDispatcher rd = request.getRequestDispatcher("/errorLoginWrongPsw.jsp");
                    rd.forward(request, response);
                } 
            } else {
                // if statement to check if dentist entered correct password
                if (enteredPassword.equals(dentist.getPassword())){
                    // dentist entered corrent password
                    session.setAttribute("dentist", dentist);
                    RequestDispatcher rd = request.getRequestDispatcher("/dentistHome.jsp");
                    rd.forward(request, response);
                } else {
                    // dentist entered wrong password 
                    RequestDispatcher rd = request.getRequestDispatcher("/errorLoginWrongPsw.jsp");
                    rd.forward(request, response);
                }
            }  
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
