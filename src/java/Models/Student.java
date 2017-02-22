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
public class Student {
    
    public Student() {
        
    }
    
    public Connection ConnectToDB()
    {
        Connection conn= null;
 
        try
        {
          String myDriver="org.gjt.mm.mysql.Driver";
          String myURL = "jbdc:mysql://silva.computing.dundee.ac.uk/16agileteam6db";
          Class.forName(myDriver);
          conn = DriverManager.getConnection(myURL, "16agileteam6", "0045.at6.5400");
          return conn;
                 
        } catch ( SQLException e)
        {
            System.err.println(" there was an SQL exception");
        } catch (ClassNotFoundException ex) {              
            Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
        }
                       
        return conn;
    }
    
    
    public boolean RegisterStudent(int matricNo, String password){
        
        boolean isUniqueMatric = existingUserCheck(matricNo);
        
        if (isUniqueMatric){
            //TODO: Encode password
         
            
            try{
                Connection con = ConnectToDB();
                
                String query = "INSERT INTO STUDENT (MatricNo, Password)" + "VALUES (?, ?)";

                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, matricNo);
                ps.setString(2, password);
                
                ps.execute();

                con.close();

                return true;
                
            } catch (SQLException e)
            {
                
            }
        }
        
        return false;
    }
    
    public boolean existingUserCheck(int matricNo){
        
        //PreparedStatement ps = session.prepare("select login from userprofiles where login =?");

        ResultSet rs = null;
        //BoundStatement boundstatement = new BoundStatement(ps);
        try {
            //rs = session.execute(
            //        boundstatement.bind(
            //                matricNo));
            
            if (!rs.isBeforeFirst() ) {
                //No existing matric found
                return true;
            } else {
                System.out.println("Matriculation number already in use");
                return false;
            }
        } catch (SQLException ex) {
            System.err.println(" there was an SQL exception");
        }
        
        return false;
                
    }
    
}
