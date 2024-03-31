/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import dbcon.dbConnect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author virtualspace
 */
public class Appointment {

    private String status;
    
    static final String DB_URL
            = "jdbc:postgresql://localhost:5432/hmsdb;create=true;user=postgres;password=12345";
    static final String DB_DRV
            = "org.postgresql.Driver";
    ResultSet rst = null;
    Connection con = null;
    Statement stmt = null;

    public Appointment() {

    }

    public Appointment(String s) {
        this.status = s;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

        public int CheckAppointmentStatus() throws SQLException {
        ResultSet rs = null;
        int x = 0;
        try {
            dbConnect query1 = new dbConnect();
            String sql = "Select count(*) as rowcount from public.appointment where status ='" + getStatus()+"'";
            rs = query1.getdata(sql);
            rs.next();
            x = rs.getInt("rowcount");

        } catch (SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
    }

    
    public boolean updateAppointment(String s, String id) {
        boolean statusInsert = false;
        try {
            String sql = "UPDATE public.appointment SET status='" + s + "'"
                    + " WHERE id = '" + id + "'";
            dbConnect query1 = new dbConnect();
            
            int rowAffected = query1.executesql(sql);

            if (rowAffected > 0) {
                statusInsert = true;
            }

        } catch (Exception ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }

        return statusInsert;
    }

}
