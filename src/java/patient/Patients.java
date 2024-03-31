/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package patient;

import dbcon.dbConnect;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nur_n
 */
public class Patients {

    private String username;
    private String password;
    private String name;
    private String email;

    public Patients(String username, String password, String name) {

        this.username = username;
        this.password = password;
        this.name = name;
    }

    public Patients() {
    }

    public boolean storepatient(String username, String password, String email, String role, String phone_number, String name, String dob, String gender, String address) {
        boolean status = false;

        try {
            String sqlUser = "INSERT INTO \"public\".\"user\" (username,email,password,phone_number,role)"
                    + "VALUES ('" + username + "','" + email + "','" + password + "','" + phone_number + "','" + role + "')";

            dbConnect t = new dbConnect();
            int getId = t.insertAndGetId(sqlUser);

            if (getId > 0) {
                String sqlPatient = "INSERT INTO \"public\".\"patient\" (name,dob,gender,address,user_id)"
                        + "VALUES ('" + name + "','" + dob + "','" + gender + "','" + address + "','" + getId + "')";
                int rowAffected = t.executesql(sqlPatient);
                status = rowAffected > 0;
            }

        } catch (Exception ex) {
            Logger.getLogger(Patients.class.getName()).log(Level.SEVERE, null, ex);
        }

        return status;
    }

    public boolean updatepatientdata(int userId, String username, String password, String email, String phone_number, String name, String dob, String gender, String address) {
        boolean status = false;
        String sqlUser = "";
        ResultSet rs = null;

        try {
            sqlUser = "UPDATE \"public\".\"user\" "
                    + "SET email = '" + email + "', "
                    + "username = '" + username + "', "
                    + "phone_number = '" + phone_number + "' "
                    + "WHERE id='" + userId + "'";

            dbConnect t = new dbConnect();
            int rowAffected = t.executesql(sqlUser);

            String sqlgetpatientid = "SELECT * FROM \"public\".\"patient\" WHERE user_id ='" + userId + "'";

            rs = t.sqlquery(sqlgetpatientid);
            rs.next();
            String patient_id = rs.getString("id");

            sqlUser = "UPDATE \"public\".\"patient\" "
                    + "SET name = '" + name + "', "
                    + "dob = '" + dob + "', "
                    + "gender = '" + gender + "', "
                    + "address = '" + address + "' "
                    + "WHERE id='" + patient_id + "'";

            rowAffected = t.executesql(sqlUser);

            if (!password.equals("")) {
                sqlUser = "UPDATE \"public\".\"user\" "
                        + "SET password = '" + password + "', "
                        + "WHERE id='" + userId + "'";

                rowAffected = t.executesql(sqlUser);
            }

            if (rowAffected > 0) {
                status = true;
            }
        } catch (Exception ex) {
            Logger.getLogger(Patients.class.getName()).log(Level.SEVERE, null, ex);
        }

        return status;
    }

    public int checklogin(String email, String password) {
        ResultSet rs = null;
        int x = 0;
        try {

            dbConnect query1 = new dbConnect();

            String sql = "SELECT COUNT(*) as rowcount FROM \"public\".\"user\" WHERE email ='" + email + "' AND password ='" + password + "'";

            rs = query1.sqlquery(sql);
            rs.next();
            x = rs.getInt("rowcount");

        } catch (Exception ex) {
            Logger.getLogger(Patients.class.getName()).log(Level.SEVERE, null, ex);
        }
        /*  catch (SQLException ex) {
         Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
         }*/
        return x;
    }

    public int getId(String email, String password) {
        ResultSet rs = null;
        int id = 0;
        try {

            dbConnect query1 = new dbConnect();

            String sql = "SELECT * FROM \"public\".\"user\" WHERE email ='" + email + "' AND password ='" + password + "'";

            rs = query1.sqlquery(sql);
            rs.next();
            id = rs.getInt("id");

        } catch (Exception ex) {
            Logger.getLogger(Patients.class.getName()).log(Level.SEVERE, null, ex);
        }
        /*  catch (SQLException ex) {
         Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
         }*/
        return id;
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

}
