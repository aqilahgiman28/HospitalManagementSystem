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
import java.sql.Time;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author virtualspace
 */
public class Slot {

    private String date;
    private String time;
    private String status;
    static final String DB_URL
            = "jdbc:postgresql://localhost:5432/hmsdb;create=true;user=postgres;password=12345";
    static final String DB_DRV
            = "org.postgresql.Driver";
    ResultSet rst = null;
    Connection con = null;
    Statement stmt = null;

    public Slot() {

    }

    public Slot(String s, String d, String t) {
        this.status = s;
        this.date = d;
        this.time = t;
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

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the time
     */
    public String getTime() {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(String time) {
        this.time = time;
    }

    public boolean registerSlot(String s, String d, String t, String id) {
        boolean statusInsert = false;
        try {
            String sql = "INSERT INTO public.slot (status, date, time, doctor_id) VALUES ('" + s + "', '" + d + "', '" + t + "', '" + id + "')";
            dbConnect query1 = new dbConnect();

            int rowAffected = query1.executesql(sql);

            if (rowAffected > 0) {
                statusInsert = true;
            }
        } catch (Exception ex) {
            Logger.getLogger(Slot.class.getName()).log(Level.SEVERE, null, ex);
        }

        return statusInsert;
    }

    public boolean updateSlot(String s, String d, String t, String id) {
        boolean statusInsert = false;
        try {
            String sql = "UPDATE public.slot SET status='" + s + "',date='" + d + "',time='" + t + "'"
                    + " WHERE id = '" + id + "'";
            dbConnect query1 = new dbConnect();

            int rowAffected = query1.executesql(sql);

            if (rowAffected > 0) {
                statusInsert = true;
            }

        } catch (Exception ex) {
            Logger.getLogger(Slot.class.getName()).log(Level.SEVERE, null, ex);
        }

        return statusInsert;
    }

}
