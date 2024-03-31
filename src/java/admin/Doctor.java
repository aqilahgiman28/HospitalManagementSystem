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
public class Doctor {

    private String name;
    private String rate_consult;
    private String specialization;
    private User user;

    static final String DB_URL
            = "jdbc:postgresql://localhost:5432/hmsdb;create=true;user=postgres;password=12345";
    static final String DB_DRV
            = "org.postgresql.Driver";
    ResultSet rst = null;
    Connection con = null;
    Statement stmt = null;

    public Doctor() {

    }

    public Doctor(String n, String rs, String s) {
        this.name = n;
        this.rate_consult = rs;
        this.specialization = s;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the rate_consult
     */
    public String getRate_consult() {
        return rate_consult;
    }

    /**
     * @param rate_consult the rate_consult to set
     */
    public void setRate_consult(String rate_consult) {
        this.rate_consult = rate_consult;
    }

    /**
     * @return the specialization
     */
    public String getSpecialization() {
        return specialization;
    }

    /**
     * @param specialization the specialization to set
     */
    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public boolean registerDoctor(String n, String rs, String s, String us, String em, String pw, String pn, String r) {
        boolean statusInsert = false;
        try {
            String userSql = "INSERT INTO \"public\".\"user\" (username,password,email,phone_number, role) "
                    + "VALUES ('" + us + "', '" + pw + "', '" + em + "' , '" + pn + "', '" + r + "' )";

            dbConnect query = new dbConnect();
            int getId = query.insertAndGetId(userSql);
            //int userRowsAffected = query2.executesql(userSql);

            if (getId > 0) {
                String doctorSql = "INSERT INTO public.doctor (name,rate_consultation,specialization, user_id)"
                        + "VALUES ('" + n + "','" + rs + "','" + s + "', '" + getId + "')";
                
                int doctorRowsAffected = query.executesql(doctorSql);

                statusInsert = doctorRowsAffected>0;

            }

        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }

        return statusInsert;
    }

    public boolean updateDoctor(String n, String rs, String s, String id, String us, String em, String pw, String pn) {
        boolean statusInsert = false;
        try {
            String doctorSql = "UPDATE public.doctor SET name='" + n + "', rate_consultation='" + rs + "', specialization='" + s + "' WHERE user_id = '" + id + "'";

            dbConnect query1 = new dbConnect();
            int doctorRowsAffected = query1.executesql(doctorSql);
            String userSql = "UPDATE public.user SET username='" + us + "', password='" + pw + "', email='" + em + "' , phone_number ='" + pn + "' WHERE id = '" + id + "'";

            dbConnect query2 = new dbConnect();
            int userRowsAffected = query2.executesql(userSql);
            //int userRowsAffeacted = query1.executesql(userSql);

            if (doctorRowsAffected > 0 && userRowsAffected > 0) {
                statusInsert = true;
            }
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }

        return statusInsert;
    }

}
