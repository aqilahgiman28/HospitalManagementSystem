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
public class Medicine {

    private String name;
    private String price;
    static final String DB_URL
            = "jdbc:postgresql://localhost:5432/hmsdb;create=true;user=postgres;password=12345";
    static final String DB_DRV
            = "org.postgresql.Driver";
    ResultSet rst = null;
    Connection con = null;
    Statement stmt = null;

    public Medicine() {

    }

    public Medicine(String n, String p) {
        this.name = n;
        this.price = p;

    }

    public boolean registerMedicine(String n, String p) {
        boolean statusInsert = false;
        try {
            String sql = "INSERT INTO public.medicine (name,price)"
                    + "VALUES ('" + n + "','" + p + "')";
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

    public boolean updateMedicine(String n, String p, String id) {
        boolean statusInsert = false;
        try {
            String sql = "UPDATE public.medicine SET name='" + n + "',price='" + p + "'"
                    + " WHERE id = '" + id + "'";
            dbConnect query1 = new dbConnect();

            int rowAffected = query1.executesql(sql);

            if (rowAffected > 0) {
                statusInsert = true;
            }

        } catch (Exception ex) {
            Logger.getLogger(Medicine.class.getName()).log(Level.SEVERE, null, ex);
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
     * @return the price
     */
    public String getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(String price) {
        this.price = price;
    }

}
