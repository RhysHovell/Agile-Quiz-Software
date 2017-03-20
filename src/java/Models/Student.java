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
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gary-
 */
public class Student{
    
  
    public char grade;
    
    public Student() {
        
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
    
    boolean isEmpty(){
        
        return true;
        
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
            System.err.println("there was an SQL exception");
        }
        
        return false;
                
    }
    
    public int specifyGrade(int result){
        
        
        if(result <= 39){
            grade = 'F';
        }
        else if (result <= 49){
            grade = 'D';
        }
        else if (result <= 59 ){
            grade = 'C';
        }
        else if (result <= 69 ){
            grade = 'B';
        }
        else if (result <= 79 || result >=79){
            grade = 'A';
        }
        return grade;
    }
    
    public boolean addSubmission(int matric, int quizID, int score){
        
        java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        
        try {
            //Quiz quizConnect = new Quiz();
            Connection conn = ConnectToDB();
            String query = "INSERT INTO studentsubmission(SubDate, MatricNo, Score, QuizID) VALUES (?, ?, ?, ?);";

            PreparedStatement ps = conn.prepareStatement(query);
            
            ps.setDate(1, date);
            ps.setInt(2, matric);
            ps.setInt(3, score);
            ps.setInt(4, quizID);

            ps.execute();

            conn.close();

            return true;
        } catch (Exception e) {
            System.err.println(" there was an SQL exception: " + e.getMessage());
        }
        
        
        return false;
    }
    
    public int getSubmissionID(int score, int quizID, int matric) {
        java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        
        try{
            Connection conn = ConnectToDB();
            String query = "SELECT SubmissionID FROM studentsubmission WHERE QuizID =? AND Score=? AND MatricNo=?";

                PreparedStatement ps = conn.prepareStatement(query);
                
                ps.setInt(1, quizID);
                ps.setInt(2, score);
                ps.setInt(3, matric);

                ResultSet rs = ps.executeQuery();
                
                if (!rs.isBeforeFirst()) {
                    return -1;
                } else {
                    if(rs.next()) {
                        int submissionID = rs.getInt("SubmissionID");
                        return submissionID;
                    }
                    
                }
            
            
        } catch (Exception e) {
            System.err.println(" there was an SQL exception: " + e.getMessage());
        }
        
        return -1;
    }
    
    public boolean addStudentAnswer(int answerID, int submissionID){
        
        try {
            //Quiz quizConnect = new Quiz();
            Connection conn = ConnectToDB();
            String query = "INSERT INTO studentanswer(answerID, submissionID) VALUES (?, ?);";

            PreparedStatement ps = conn.prepareStatement(query);
            
            ps.setInt(1, answerID);
            ps.setInt(2, submissionID);

            ps.execute();

            conn.close();

            return true;
        } catch (Exception e) {
            System.err.println(" there was an SQL exception: " + e.getMessage());
        }
        
        return false;
    }
    
     
}
