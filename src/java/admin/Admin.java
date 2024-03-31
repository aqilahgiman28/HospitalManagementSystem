/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import dbcon.dbConnect;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author virtualspace
 */
public class Admin {

    private String name;
    static final String DB_URL
            = "jdbc:postgresql://localhost:5432/hmsdb;create=true;user=postgres;password=12345";
    static final String DB_DRV
            = "org.postgresql.Driver";
    ResultSet rst = null;
    Connection con = null;
    Statement stmt = null;

    public Admin() {

    }

    public Admin(String name) {
        this.name = name;
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

   public boolean updateAdmin(String n, String id, String us, String em, String pw, String pn) {
        boolean statusInsert = false;
        try {
            String adminSql = "UPDATE public.admin SET name='" + n + "' WHERE user_id = '" + id + "'";

            dbConnect query1 = new dbConnect();
            int adminRowsAffected = query1.executesql(adminSql);
            String userSql = "UPDATE public.user SET username='" + us + "', password='" + pw + "', email='" + em + "' , phone_number ='" + pn + "' WHERE id = '" + id + "'";
       
            dbConnect query2 = new dbConnect();
            int userRowsAffected = query2.executesql(userSql);
            //int userRowsAffeacted = query1.executesql(userSql);

            if (adminRowsAffected > 0 && userRowsAffected > 0) {
                statusInsert = true;
            }
        } catch (Exception ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }

        return statusInsert;
    }

}
