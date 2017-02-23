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
    
    
        public Quiz()
    {
        
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
          
         
        }          
                catch ( Exception e)
                        {
                        System.err.println(" there was an SQL exception");
                        }
              
               
         return conn;
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
                
            return true;
        }
          catch ( Exception e)
                        {
                        System.err.println(" there was an SQL exception");
                        }
         return false;
    }
    
    public int GetQuizID(String quiz_name, int staff_ID)
    {
        Connection conn =  ConnectToDB();
        
        PreparedStatement ps ;
        int quizid = 0;
        if (conn!=null)
        {
            try
            {
                String query = "SELECT QuizID FROM Quiz WHERE QuizName=? AND staff_ID=?;";

               ps = conn.prepareStatement(query);
               ps.setString(1,quiz_name);
               ps.setInt(2, staff_ID);
               ResultSet rs = ps.executeQuery();

               while (rs.next())
               {
                  quizid = rs.getInt("QuizID");
               }

               
               conn.close();
               return quizid;
               
            }       
                    
            
              catch ( Exception e)
            {
                       System.err.println(" there was an exception");
            }
                    
                 finally
            {
              /*  if (ps != null)
                {
                    ps.close();
                }

                if( conn !=null)
                {
                    conn.close();
                }
                */
            }
        }
        
        else
        {
            System.out.println("It was not possible to make a connection");
        }
        return quizid;
    }
    
    public boolean NewQuestion(int question_number , int quiz_id , String question, String answer, boolean iscorrect)
    {
               
        try
        {
            //Quiz quizConnect = new Quiz();
            Connection conn = ConnectToDB();
            String query = "INSERT INTO Question (QuizID, QuestionNo, Question)" + "VALUES (?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, quiz_id);
            ps.setInt(2, question_number);
            ps.setString(3, question);

            ps.execute();
            ps.close();
            
            //retrieve question ID and insert into answer table along with answer text and bool.
            String query2 = "INSERT INTO Answer (AnswerText, Correct, QuestionID)" + "VALUES (?, ?, ?)";

             ps = conn.prepareStatement(query2);
            //ps.setString(1, );
            ps.setInt(2, question_number);
            ps.setString(3, question);

            ps.execute();
            ps.close();
            
            
            conn.close();
                
            return true;
        }
          catch ( Exception e)
                        {
                        System.err.println(" there was an SQL exception");
                        }
         return false;
        
        return true;
    }
    
    
    
}
