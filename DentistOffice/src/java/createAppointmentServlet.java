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
import Business.Appointments;
import Business.Patients;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Ciro
 */
@WebServlet(urlPatterns = {"/createAppointmentServlet"})
public class createAppointmentServlet extends HttpServlet {

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
            
            //creating new session
            HttpSession session = request.getSession();
            // instatiating objects to be used in this servlet
            Appointments appointment = new Appointments();
            Patients patient = new Patients();
            // getting current patient from session
            patient = (Patients)session.getAttribute("patient");
            // selecting appointment based on current patient
            appointment.selectAppointment("patId", patient.getPatId());
            // formating date obtained from page createAppointment.jsp
            String date = request.getParameter("datepicker") + " " + request.getParameter("time");
            
            //if statement to determine if user is creating new appointment or editing existing one
            if(appointment.getApptDateTime() == null){
                appointment.insertDB(date, patient.getPatId(), request.getParameter("dentist"), request.getParameter("procedure"));
            } else {
                appointment.deleteDB(patient.getPatId());
                appointment.insertDB(date, patient.getPatId(), request.getParameter("dentist"), request.getParameter("procedure"));
            }
            
            // check used on createAppointment.jsp to check to see if user already has appointment
            String check = (String)session.getAttribute("check");
            check = null;
            session.setAttribute("check", check);
            
            // forwarding to clientHome.jsp
            RequestDispatcher rd = request.getRequestDispatcher("clientHome.jsp");
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
