/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;
import java.sql.*;
import java.util.Calendar;
/**
 *
 * @author Brodie
 * This class exists to fetch data from and write to the database according to requests from the servlets
 */
public class Quiz {
    
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
          
         
        }          
                catch ( Exception e)
                        {
                        System.err.println(" there was an SQL exception");
                        }
              
               
         return conn;
    }
    public Quiz()
    {
        
    }
    
    public boolean NewQuiz(String quiz_name,String module, int staff_ID)
    {
        
        try
        {
            //Quiz quizConnect = new Quiz();
            Connection conn = ConnectToDB();
            String query = "INSERT INTO QUIZ (QuizName, Module, StaffID)" + "VALUES (?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, quiz_name);
            ps.setString(2, module);
            ps.setInt(3, staff_ID);

            ps.execute();

            conn.close();
                
       
        }
          catch ( Exception e)
                        {
                        System.err.println(" there was an SQL exception");
                        }
         return true;
    }
    
    
    public boolean NewQuestion()
    {
        return true;
    }
    
    
    
}
