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
@WebServlet(urlPatterns = {"/recoverPasswordServlet"})
public class recoverPasswordServlet extends HttpServlet {

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
            
            // instating objects to be used in this jsp
            Patients patient = new Patients();
            Dentists dentist = new Dentists();
            // getting username entered by the user to recover password
            String enteredUsername = request.getParameter("username");
            // selecting patient from database based on username entered
            patient.selectPatient(enteredUsername);
            // selecting dentist from database based on username entered
            dentist.selectDentist(enteredUsername);
            
            String password = "";
            String user = "";
            //if statement to check if username entered is from a dentist, patient. or if it exists at all
            if (patient.getPatId() == null && dentist.getId() == null && enteredUsername != null){
                // username does not exist
                password = "This username is not registered.";
            } else if (patient.getPatId() != null){
                // username is from a patient
                // showing username and password based on the username entered
                password = "Your password is: " + patient.getPassword();
                user = "Username: " + patient.getPatId();
            } else {
                // username is from a dentist
                // showing username and password based on the username entered
                password = "Your password is: " + dentist.getPassword();
                user = "Username: " + dentist.getId();
            }
            // creating new session
            HttpSession session = request.getSession();
            // sending objects to session
            session.setAttribute("password", password);
            session.setAttribute("user", user);
            // forwarding to forgotpassword.jsp
            RequestDispatcher rd = request.getRequestDispatcher("forgotPassword.jsp");
            rd.forward(request, response);
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
