/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package patient;

import dbcon.dbConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nur_n
 */
public class appcancelation extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String app_id = request.getParameter("app_id").trim();
            Integer user_id = (Integer) request.getSession().getAttribute("user_id");

            dbConnect query1 = new dbConnect();
            String sqlUpdateApp = "UPDATE \"public\".\"appointment\" SET status = 'cancel'"
                    + " WHERE id = '" + app_id + "'";

            int rowAffectedApp = query1.executesql(sqlUpdateApp);

            if (rowAffectedApp > 0) {
                ResultSet rs = null;
                String sqlGetPatient = "SELECT * FROM \"public\".\"appointment\" WHERE id ='" + app_id + "'";
                rs = query1.sqlquery(sqlGetPatient);
                rs.next();

                String slot_id = rs.getString("slot_id");

                String sqlUpdateSlot = "UPDATE \"public\".\"slot\" SET status = 'active'"
                        + " WHERE id = '" + slot_id + "'";

                int rowAffectedSlot = query1.executesql(sqlUpdateSlot);

                if (rowAffectedSlot > 0) {
                    response.sendRedirect("/HospitalManagementSystem/patient/my_appointment.jsp?appStatus=update");
                } else {
                    response.sendRedirect("/HospitalManagementSystem/patient/my_appointment.jsp?appStatus=failedUpdate");
                }
            }else{
                response.sendRedirect("/HospitalManagementSystem/patient/my_appointment.jsp?appStatus=failedUpdate2");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(appcancelation.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(appcancelation.class.getName()).log(Level.SEVERE, null, ex);
        }
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
