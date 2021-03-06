package AgileQuiz.servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import AgileQuiz.libraries.DBconnection;
import AgileQuiz.stores.LoggedIn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author petersallai
 */
@WebServlet(urlPatterns = {"/StudentLogin"})
public class StudentLogin extends HttpServlet {

    /**
 +     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
 +     * methods.
 +     *
 +     * @param request servlet request
 +     * @param response servlet response
 +     * @throws ServletException if a servlet-specific error occurs
 +     * @throws IOException if an I/O error occurs
 +     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("studentid");
            String password = request.getParameter("password");
            DBconnection db = new DBconnection();
            Connection con = db.getCon();
            PreparedStatement ps = con.prepareStatement("Select * FROM student WHERE MatricNo = ? AND Password = ?");
                        
            int studentid = Integer.parseInt(username);
            ps.setInt(1, studentid);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {                
                int matric = rs.getInt("MatricNo");                
                HttpSession session = request.getSession(true);
                
                LoggedIn lg = new LoggedIn();
                lg.setLoggedIn();
                lg.setMatric(matric);
                
                session.setAttribute("Welcome ", studentid);
                session.setAttribute("LoggedIn",lg);
                                
                RequestDispatcher rd = request.getRequestDispatcher("studentSelect.jsp");
                rd.include(request, response);
            }
            else{
                RequestDispatcher rd = request.getRequestDispatcher("/studentLoginError.jsp");
                rd.include(request, response);
                out.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentLogin.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQLException: " + ex.getMessage());
        }
        catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
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
