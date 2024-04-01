package dbcon;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author virtualspace
 */
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.CachedRowSet;

/**
 *
 * @author virtualspace
 */
public class dbConnect {

    CachedRowSet rowSet;
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement ps = null;
    String driver;   //"org.gjt.mm.mysql.Driver"
    String urlcon; //"jdbc:mysql://localhost:3306/database"
    String username;//select count(*) as rowcount from users where username=(?) and password=(?)
    String password;

    public dbConnect() {
        this.driver = "org.postgresql.Driver";
        this.urlcon = "jdbc:postgresql://localhost:5432/hmsdb";
        this.username = "postgres";
        this.password = "12345";
    }

    public dbConnect(String driver, String urlcon, String u, String p) {
        this.driver = driver;
        this.username = u;
        this.password = p;

    }

    public ResultSet sqlquery(String executesql) throws SQLException {

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(urlcon, username, password);
            ps = con.prepareStatement(executesql);
            // stmt=con.createStatement();
            rs = ps.executeQuery();
        } catch (ClassNotFoundException ex) {
            // Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);

        }
        return rs;

    }

    public int executesql(String executesql) throws SQLException {
        int affectedRows = -1;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(urlcon, username, password);
            ps = con.prepareStatement(executesql);

            affectedRows = ps.executeUpdate();

        } catch (ClassNotFoundException ex) {
            //    Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
        }
        return affectedRows;
    }

    public int insertAndGetId(String executesql) throws SQLException {
        int getId = -1;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(urlcon, username, password);
            ps = con.prepareStatement(executesql, Statement.RETURN_GENERATED_KEYS);
            // Execute the INSERT statement
            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    getId = rs.getInt(1); // Get the first generated key
                }
            }
        } catch (ClassNotFoundException ex) {
            //    Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
        }
        return getId;
    }

    public int deletedata(String sql) {
        int rowsAffected = 0;
        try {
            Class.forName("org.postgresql.Driver");
            this.con = DriverManager.getConnection(urlcon, username, password);
            this.stmt = this.con.createStatement();
            rowsAffected = this.stmt.executeUpdate(sql);

        } catch (SQLException var4) {
            Logger.getLogger(dbConnect.class.getName()).log(Level.SEVERE, (String) null, var4);
        } catch (ClassNotFoundException var5) {
            Logger.getLogger(dbConnect.class.getName()).log(Level.SEVERE, (String) null, var5);
        }

        return rowsAffected;
    }

    public ResultSet getdata(String sql) {
        ResultSet temp = null;

        try {
            Class.forName("org.postgresql.Driver");
            this.con = DriverManager.getConnection(urlcon, username, password);
            this.stmt = this.con.createStatement();
            temp = this.stmt.executeQuery(sql);
        } catch (SQLException var4) {
            Logger.getLogger(dbConnect.class.getName()).log(Level.SEVERE, (String) null, var4);
        } catch (ClassNotFoundException var5) {
            Logger.getLogger(dbConnect.class.getName()).log(Level.SEVERE, (String) null, var5);
        }

        return temp;
    }

    ResultSet sqlquery() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
