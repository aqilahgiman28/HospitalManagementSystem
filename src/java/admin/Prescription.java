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
public class Prescription {

    private String quantity;
    
    static final String DB_URL
            = "jdbc:postgresql://localhost:5432/hmsdb;create=true;user=postgres;password=12345";
    static final String DB_DRV
            = "org.postgresql.Driver";
    ResultSet rst = null;
    Connection con = null;
    Statement stmt = null;

    public Prescription() {

    }

    public Prescription(String d) {
        this.quantity = d;
    }

    /**
     * @return the status
     */
    
  

    
    public boolean updatePrescription(String quantity, String prescriptionId) {
    boolean statusInsert = false;
    try {
        String sql = "UPDATE public.prescription SET quantity='" + quantity + "' WHERE id = '" + prescriptionId + "'";
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
    public String getQuantity() {
        return quantity;
    }

    /**
     * @param description the description to set
     */
    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

}
