/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package patient;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nur_n
 */
public class updatepatient extends HttpServlet {

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
            String email = request.getParameter("email").trim();
            String phoneno = request.getParameter("phone_number").trim();
            String pss = request.getParameter("password").trim();
            String confirmpass = request.getParameter("confirm-password").trim();

            String name = request.getParameter("name").trim();
            String dob = request.getParameter("dob").trim();
            String gender = request.getParameter("gender").trim();
            String address = request.getParameter("address").trim();
            Integer user_id = (Integer) request.getSession().getAttribute("user_id");

            Patients register = new Patients();
            boolean statusRegister = register.updatepatientdata(user_id, email, pss, email, phoneno, name, dob, gender, address);

            if (statusRegister) {
                request.getSession().setAttribute("email", email);
                response.sendRedirect("/HospitalManagementSystem/patient/edit_profile.jsp?status=updated");
            } else {
                response.sendRedirect("/HospitalManagementSystem/patient/edit_profile.jsp?status=failed");
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
