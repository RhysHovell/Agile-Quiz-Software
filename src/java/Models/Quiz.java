/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Brodie This class exists to fetch data from and write to the database
 * according to requests from the servlets
 */
public class Quiz {

    public Quiz() {

    }

    public Connection ConnectToDB() {
        Connection conn = null;

        try {
            String myDriver = "com.mysql.jdbc.Driver";
            String myURL = "jdbc:mysql://silva.computing.dundee.ac.uk/16agileteam6db";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(myURL, "16agileteam6", "0045.at6.5400");
            return conn;

        } catch (SQLException e) {
            System.err.println(" there was an SQL exception");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Quiz.class.getName()).log(Level.SEVERE, null, ex);
        }

        return conn;
    }

    public boolean NewQuiz(String quiz_name, String module, int staff_ID) {

        try {
            //Quiz quizConnect = new Quiz();
            Connection conn = ConnectToDB();
            String query = "INSERT INTO QUIZ (QuizName, ModuleCode, StaffID) VALUES (?, ?, ?);";

            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, quiz_name);
            ps.setString(2, module);
            ps.setInt(3, staff_ID);

            ps.execute();

            conn.close();

            return true;
        } catch (Exception e) {
            System.err.println(" there was an SQL exception");
        }
        return false;
    }

    public int GetQuizID(String quiz_name, int staff_ID) {
        Connection conn = ConnectToDB();

        PreparedStatement ps;
        int quizid = 0;
        if (conn != null) {
            try {
                String query = "SELECT QuizID FROM quiz WHERE QuizName=? AND StaffID=?;";

                ps = conn.prepareStatement(query);
                ps.setString(1, quiz_name);
                ps.setInt(2, staff_ID);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    quizid = rs.getInt("QuizID");
                }

                conn.close();
                return quizid;

            } catch (Exception e) {
                System.err.println(" there was an exception");
            } finally {
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
        } else {
            System.out.println("It was not possible to make a connection");
        }
        return quizid;
    }

    public int getQuestionID (int quizid , String question)
    {
         int question_id=0;
         Connection conn=  ConnectToDB();
         PreparedStatement ps;
          try{
              
              String query = "Select QuestionID From question WHERE QuestionText=? AND QuizID=?;";
              
              ps=conn.prepareStatement(query);


              ps.setString(1, question);
              ps.setInt(2, quizid);
               ResultSet rs= ps.executeQuery();
               
               while (rs.next())
               {
                   
                   question_id=rs.getInt("QuestionID");
               }
            
               
              conn.close();
          
              return question_id;
          }
           
            catch (Exception e) {
                System.err.println(" there was an exception");
            }
          
          
                return question_id;
    }
    
    
    public boolean NewQuestion(int quiz_id, int question_number,  String question) {

         Connection conn = ConnectToDB();
            
        try {
            //Quiz quizConnect = new Quiz();
           
            String query = "INSERT INTO question (QuizID, QuestionNo, QuestionText) VALUES (?, ?, ?);";

            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, quiz_id);
            ps.setInt(2, question_number);
            ps.setString(3, question);

            ps.execute();
            ps.close();

            /*
            //retrieve question ID and insert into answer table along with answer text and bool.
            String query2 = "INSERT INTO Answer (AnswerText, Correct, QuestionID)" + "VALUES (?, ?, ?)";

             ps = conn.prepareStatement(query2);
            //ps.setString(1, );
            ps.setInt(2, question_number);
            ps.setString(3, question);

            ps.execute();
            ps.close();
             */
            conn.close();

            return true;
        } catch (Exception e) {
            System.err.println(" there was an SQL exception");
        }
        return false;

    }

    public boolean newAnswer (int question_id, String answer_text, int correct )
    {
        try{
            Connection conn = ConnectToDB();
            String query ="INSERT INTO answer (QuestionID, AnswerText, Correct) VALUES (?,?,?);";
            PreparedStatement ps= conn.prepareStatement(query);
            ps.setInt(1, question_id);
            ps.setString(2, answer_text);  
            ps.setInt(3,correct);
            
            ps.execute();
            ps.close();
            conn.close();
        
            return true;
            }
        
        
        catch (Exception e) {
            System.err.println(" there was an SQL exception");
        }

        return false;
          
    }
//    
//    public boolean getQuestion(String QuestionNumber)
//    {
//       PreparedStatement ps;
//       Connection conn = ConnectToDB();
//       
//       if (conn != null) {
//            try {
//                String query = "SELECT AnswerID, QuestionID, AnswerText, Correct FROM Quiz WHERE QuestionNumber=?";
//                
//                
//                ps = conn.prepareStatement(query);
//                
//                ResultSet rs = ps.executeQuery();
//                
//                int i = 0;                
//                
//                for (Row row : rs){
//                    QuestionNumber.setAnswerID(row.getInt("AnswerID"));
//                    QuestionNumber.setQuestionID(row.getInt("QuestionID"));
//                    QuestionNumber.setAnswerText(row.getString("AnswerText"));
//                    QuestionNumber.setCorrectAnswer(row.getString("Correct"));
//                    
//                    
//                    
//                    
//                    
//                    
//                }
//                
//                ps.close();
//                conn.close();
//                
//                
//                quizList.add(quizIDs);
//                quizList.add(quizNames);
//                
//                return quizList;
//
//            } catch (Exception e) {
//
//            }
//
//        }
//        
//        return null;
//
//       
//       
//        
//       
//    }
    //Returns a list of string arraylists of all available quizes for a given module
    public List<List<String>> getQuizzes(String ModuleCode) {

        //List which stores a list of quiz names & a list of quizIDs 
        List<List<String>> quizList = new ArrayList<>();
        List<String> quizNames = new ArrayList<>();
        List<String> quizIDs = new ArrayList<>();
        
        PreparedStatement ps;
        Connection conn = ConnectToDB();

        if (conn != null) {
            try {
                String query = "SELECT QuizID, QuizName FROM Quiz WHERE ModuleCode=? AND Availability=1;";

                ps = conn.prepareStatement(query);
                ps.setString(1, ModuleCode);

                ResultSet rs = ps.executeQuery();
                
                if(!rs.isBeforeFirst()){
                    return null;
                }
                
                int i = 0;                
                while(rs.next()){
                    int QuizID = rs.getInt("QuizID");
                    String QuizName = rs.getString("QuizName");
                    
                    quizNames.add(QuizName);
                    quizIDs.add(String.valueOf(QuizID));                 
                                                            
                    i++;
                }
                
                ps.close();
                conn.close();
                
                
                quizList.add(quizIDs);
                quizList.add(quizNames);
                
                return quizList;

            } catch (Exception e) {

            }

        }
        
        return null;

    }

}
