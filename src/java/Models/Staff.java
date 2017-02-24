/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gary-
 */
public class Staff {

    public Staff() {

    }

    public Connection ConnectToDB() {
        Connection conn = null;

        try {
            String myDriver = "org.gjt.mm.mysql.Driver";
            String myURL = "jbdc:mysql://silva.computing.dundee.ac.uk/16agileteam6db";
            Class.forName(myDriver);
            conn = DriverManager.getConnection(myURL, "16agileteam6", "0045.at6.5400");
            return conn;

        } catch (SQLException e) {
            System.err.println(" there was an SQL exception");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    //Check if user credentials are valid
    public boolean IsValidStaff(String staffID, String password) {

        Connection conn = ConnectToDB();
        PreparedStatement ps;
        
        
        if (conn != null) {
            
                       
            try {
                String query = "SELECT StaffID FROM Staff WHERE StaffID=? AND Password=?;";

                ps = conn.prepareStatement(query);
                ps.setString(1, staffID);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                
                //!rs.isBeforeFirst()
                
                //cheap dodgy way of doing this
                if (!rs.next()) {
                    System.err.println("StaffID/Password correct");
                    conn.close();
                    return true;
                } else {
                    System.err.println("StaffID/Password incorrect");
                    conn.close();
                    return true;
                }

            } catch (Exception e) {
                System.err.println(" there was an exception");
            }

        }

        return false;
    }

}
