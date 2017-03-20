/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AgileQuiz.servlets;

import AgileQuiz.stores.LoggedIn;
import Models.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Brodie
 */
@WebServlet(name = "ViewQuiz", urlPatterns = {"/ViewQuiz"})
public class ViewQuiz extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
       String selected_quiz= request.getParameter("selected_quiz"); 
       int chosen_id= Integer.parseInt(request.getParameter("chosen_id"));
       
       
       HttpSession session = request.getSession();
       LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
      
       
       lg.setQuizName(selected_quiz);
      
    
     
       lg.setQuizID(chosen_id);
      session.setAttribute("Loggedin", lg);
  
       
       
    //   int quizid = qm.GetQuizID (selected_quiz, lg.getStaffID() );
      
         Quiz qm= new Quiz();
    
       List<List<String>>  Quiz= qm.loadQuiz(chosen_id);
       
       
       session.setAttribute("quiz",Quiz);
       
            RequestDispatcher rd = request.getRequestDispatcher("/editQuiz.jsp");
               rd.forward(request, response);
    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
