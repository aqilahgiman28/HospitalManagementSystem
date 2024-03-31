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
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author virtualspace
 */
public class User {

    private String username;
    private String email;
    private String password;
    private String role;
    static final String DB_URL
            = "jdbc:postgresql://localhost:5432/hmsdb;create=true;user=postgres;password=12345";
    static final String DB_DRV
            = "org.postgresql.Driver";
    ResultSet rst = null;
    Connection con = null;
    Statement stmt = null;

    public User() {

    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;

    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the role
     */
    public String getRole() {
        return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(String role) {
        this.role = role;
    }

    public int CheckUserStatus() throws SQLException {
        ResultSet rs = null;
        int x = 0;
        try {
            dbConnect query1 = new dbConnect();
            String sql = "Select count(*) as rowcount from public.user where email ='" + getEmail() + "' and password = '" + getPassword() + "'";
            rs = query1.getdata(sql);
            rs.next();
            x = rs.getInt("rowcount");

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
    }

}
