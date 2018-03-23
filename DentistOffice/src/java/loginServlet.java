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
            
            String enteredUsername = request.getParameter("username");
            String enteredPassword = request.getParameter("password");
            
            Patients patient = new Patients();
            patient.selectPatient(enteredUsername);
            
            Dentists dentist = new Dentists();
            dentist.selectDentist(enteredUsername);
            
            HttpSession session = request.getSession();
            
            if (patient.getPatId() == null && dentist.getId() == null){
                RequestDispatcher rd = request.getRequestDispatcher("/errorLogin.jsp");
                rd.forward(request, response);
            } else if (patient.getPatId() != null){
                if (enteredPassword.equals(patient.getPassword())){
                    session.setAttribute("patient", patient);
                    Appointments appointment = new Appointments();
                    appointment.selectAppointment("patId", patient.getPatId());
                    if (appointment.getApptDateTime() == null){
                        RequestDispatcher rd = request.getRequestDispatcher("/clientHomeNoAppointment.jsp");
                        rd.forward(request, response);
                        
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("clientHome.jsp");
                        rd.forward(request, response);
                    }
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("/errorLoginWrongPsw.jsp");
                    rd.forward(request, response);
                } 
            } else {
                if (enteredPassword.equals(dentist.getPassword())){
                    session.setAttribute("dentist", dentist);
                    RequestDispatcher rd = request.getRequestDispatcher("/dentistHome.jsp");
                    rd.forward(request, response);
                } else {
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
