package AgileQuiz.libraries;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author petersallai
 */
public class DBconnection {
    
    Connection con;
    
    public Connection getCon() {
        
        String myDriver="org.gjt.mm.mysql.Driver";
        String myURL = "jdbc:mysql://silva.computing.dundee.ac.uk/16agileteam6db";
        try {
            Class.forName(myDriver);
            con = DriverManager.getConnection(myURL, "16agileteam6", "0045.at6.5400");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBconnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBconnection.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQLException: " + ex.getMessage());
        }
        return con;
    }
}