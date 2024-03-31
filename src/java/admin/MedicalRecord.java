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
public class MedicalRecord {

    private String description;
    
    static final String DB_URL
            = "jdbc:postgresql://localhost:5432/hmsdb;create=true;user=postgres;password=12345";
    static final String DB_DRV
            = "org.postgresql.Driver";
    ResultSet rst = null;
    Connection con = null;
    Statement stmt = null;

    public MedicalRecord() {

    }

    public MedicalRecord(String d) {
        this.description = d;
    }

    /**
     * @return the status
     */
    

        public int CheckMedicalRecordStatus() throws SQLException {
        ResultSet rs = null;
        int x = 0;
        try {
            dbConnect query1 = new dbConnect();
            String sql = "Select count(*) as rowcount from public.medical_record where status ='" + getDescription()+"'";
            rs = query1.getdata(sql);
            rs.next();
            x = rs.getInt("rowcount");

        } catch (SQLException ex) {
            Logger.getLogger(MedicalRecord.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
    }

    
    public boolean updateMedicalRecord(String d, String id) {
        boolean statusInsert = false;
        try {
            String sql = "UPDATE  public.medical_record SET description='" + d + "'"
                    + " WHERE id = '" + id + "'";
            dbConnect query1 = new dbConnect();
            
            int rowAffected = query1.executesql(sql);

            if (rowAffected > 0) {
                statusInsert = true;
            }

        } catch (Exception ex) {
            Logger.getLogger(MedicalRecord.class.getName()).log(Level.SEVERE, null, ex);
        }

        return statusInsert;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

}
