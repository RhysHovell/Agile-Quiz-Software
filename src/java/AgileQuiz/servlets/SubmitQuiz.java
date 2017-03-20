/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AgileQuiz.servlets;

import AgileQuiz.stores.LoggedIn;
import Models.Quiz;
import Models.Student;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
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
 * @author garygillespie
 */
@WebServlet(name = "SubmitQuiz", urlPatterns = {"/SubmitQuiz"})
public class SubmitQuiz extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            Quiz qm = new Quiz();
            Student sm = new Student();

            String quizSubmission = request.getParameter("ansArray");

            String s = quizSubmission;
            s = s.replace("[\"", "");
            s = s.replace("\"", "");
            s = s.replace("\"]", "");
            s = s.replace("]", "");

            String[] elements = s.split(",");
            List<String> list = Arrays.asList(elements);

            //load quiz and convert given answer to correct answerID
            int quizID = lg.getQuizID();
            int score = Integer.valueOf(list.get(list.size() - 1));
            int matric = lg.getMatric();

            List<List<String>> quiz = qm.loadQuiz(quizID);

            //New list to store updated, correct answerIDs
            List<String> correctAnswerIDs = new ArrayList();

            for (int i = 0; i < quiz.size(); i++) {
                for (int u = 2; u < quiz.get(0).size(); u++) {
                    if (quiz.get(i).get(u).equals(list.get(i))) {
                        correctAnswerIDs.add(String.valueOf(u - 1));
                    }
                }
            }

            //Add Quiz submission instance
            sm.addSubmission(matric, quizID, score);

            int submissionID = sm.getSubmissionID(score, quizID, matric);

            if (submissionID != -1) {
                //Submit Student Answers
                for (int i = 0; i < correctAnswerIDs.size(); i++) {
                    sm.addStudentAnswer(Integer.valueOf(correctAnswerIDs.get(i)), submissionID);
                }

            }
            
            RequestDispatcher rd = request.getRequestDispatcher("/studentSelect.jsp");
            rd.forward(request, response);

        }
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
        processRequest(request, response);
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
