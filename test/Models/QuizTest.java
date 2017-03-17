/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Connection;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author rhyshovell
 */
public class QuizTest {
    
    public QuizTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of ConnectToDB method, of class Quiz.
     */
    @Test
    public void testConnectToDB() {
        System.out.println("ConnectToDB");
        Quiz instance = new Quiz();
        Connection expResult = null;
        Connection result = instance.ConnectToDB();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
 ;
    }

    /**
     * Test of NewQuiz method, of class Quiz.
     */
    @Test
    public void testNewQuiz() {
        System.out.println("NewQuiz");
        String quiz_name = "";
        String module = "";
        int staff_ID = 0;
        Quiz instance = new Quiz();
        boolean expResult = false;
        boolean result = instance.NewQuiz(quiz_name, module, staff_ID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of GetQuizID method, of class Quiz.
     */
    @Test
    public void testGetQuizID() {
        System.out.println("GetQuizID");
        String quiz_name = "";
        int staff_ID = 0;
        Quiz instance = new Quiz();
        int expResult = 0;
        int result = instance.GetQuizID(quiz_name, staff_ID);
        assertEquals(expResult, result);
       

    }

    /**
     * Test of getQuestionID method, of class Quiz.
     */
    @Test
    public void testGetQuestionID() {
        System.out.println("getQuestionID");
        int quizid = 0;
        String question = "";
        Quiz instance = new Quiz();
        int expResult = 0;
        int result = instance.getQuestionID(quizid, question);
        assertEquals(expResult, result);
       
  
    }

    /**
     * Test of NewQuestion method, of class Quiz.
     */
    @Test
    public void testNewQuestion() {
        System.out.println("NewQuestion");
        int quiz_id = 0;
        int question_number = 0;
        String question = "";
        Quiz instance = new Quiz();
        boolean expResult = false;
        boolean result = instance.NewQuestion(quiz_id, question_number, question);
        assertEquals(expResult, result);
    }

    /**
     * Test of newAnswer method, of class Quiz.
     */
    @Test
    public void testNewAnswer() {
        System.out.println("newAnswer");
        int question_id = 0;
        String answer_text = "";
        int correct = 0;
        Quiz instance = new Quiz();
        boolean expResult = false;
        boolean result = instance.newAnswer(question_id, answer_text, correct);
        assertEquals(expResult, result);
  
  
    }

    /**
     * Test of getQuizzes method, of class Quiz.
     */
    @Test
    public void testGetQuizzes() {
        System.out.println("getQuizzes");
        String ModuleCode = "";
        Quiz instance = new Quiz();
        List<List<String>> expResult = null;
        List<List<String>> result = instance.getQuizzes(ModuleCode);
        assertEquals(expResult, result);
        
    }
    
}
