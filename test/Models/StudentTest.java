/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Connection;
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
public class StudentTest {
    
    public StudentTest() {
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
     * Test of ConnectToDB method, of class Student.
     */
    @Test
    public void testConnectToDB() {
        System.out.println("ConnectToDB");
        Student instance = new Student();
        Connection expResult = null;
        Connection result = instance.ConnectToDB();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    

    /**
     * Test of RegisterStudent method, of class Student.
    
    @Test
    public void testRegisterStudent() {
        System.out.println("RegisterStudent");
        int matricNo = 0;
        String password = "";
        Student instance = new Student();
        boolean expResult = false;
        boolean result = instance.RegisterStudent(matricNo, password);
        assertEquals(expResult, result);
       
    }

    /**
     * Test of existingUserCheck method, of class Student.
     *
    @Test
    public void testExistingUserCheck() {
        System.out.println("existingUserCheck");
        int matricNo = 0;
        Student instance = new Student();
        boolean expResult = false;
        boolean result = instance.existingUserCheck(matricNo);
        assertEquals(expResult, result); 
    }
     */
}
