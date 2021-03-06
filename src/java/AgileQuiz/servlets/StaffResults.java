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
 * @author adammanion
 */
@WebServlet(name = "StaffResults", urlPatterns = {"/StaffResults"})
public class StaffResults extends HttpServlet {

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
            
            String userInput = request.getParameter("MatricNo");
            
            int matricNo = Integer.parseInt(userInput);

            if (lg.getLoggedIn()) {
                if (lg.getMatric() != 0) {

                    //Call method to retrieve student module codes****
                    //moduleCodes = "Geography";

                }
            }

            Quiz qm = new Quiz();
            List<List<Integer>> resultList = qm.staffResults(matricNo);
            
            if(resultList != null){
                session.setAttribute("resultList", resultList);
            }
            
             if (lg.getStaffID()!= 0 )
            { 
                RequestDispatcher rd = request.getRequestDispatcher("/staffResults.jsp");
                rd.forward(request, response);
            }
            else if (lg.getMatric() != 0) 
            {
               RequestDispatcher rd = request.getRequestDispatcher("/studentResults.jsp");
               rd.forward(request, response);
            }
            else
            {
                   RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");   
            }
            
            
            
        } catch (Exception e) {
            //output exception
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
