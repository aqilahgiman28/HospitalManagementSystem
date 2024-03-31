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
public class Patient {

    private String name;
    private String dob;
    private String gender;
    private String address;

    static final String DB_URL
            = "jdbc:postgresql://localhost:5432/hmsdb;create=true;user=postgres;password=12345";
    static final String DB_DRV
            = "org.postgresql.Driver";
    ResultSet rst = null;
    Connection con = null;
    Statement stmt = null;

    public Patient() {

    }

    public Patient(String n, String dob, String g, String ad) {
        this.name = n;
        this.dob = dob;
        this.gender = g;
        this.address = ad;
    }

    
   
    public boolean updatePatient(String n, String dob, String g, String ad, String id, String us, String em, String pw, String pn) {
        boolean statusInsert = false;
        try {
            String patientSql = "UPDATE public.patient SET name='" + n + "', dob='" + dob + "', gender='" + g + "', address='" + ad + "' WHERE user_id = '" + id + "'";

            dbConnect query1 = new dbConnect();
            int patientRowsAffected = query1.executesql(patientSql);
            String userSql = "UPDATE public.user SET username='" + us + "', password='" + pw + "', email='" + em + "' , phone_number ='" + pn + "' WHERE id = '" + id + "'";
       
            dbConnect query2 = new dbConnect();
            int userRowsAffected = query2.executesql(userSql);
            //int userRowsAffeacted = query1.executesql(userSql);

            if (patientRowsAffected > 0 && userRowsAffected > 0) {
                statusInsert = true;
            }
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }

        return statusInsert;
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
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

}
