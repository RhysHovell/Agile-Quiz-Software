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
@WebServlet(urlPatterns = {"/StaffLogin"})
public class StaffLogin extends HttpServlet {

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
            String username = request.getParameter("staffid");
            String password = request.getParameter("password");
            DBconnection db = new DBconnection();
            Connection con = db.getCon();
            PreparedStatement ps = con.prepareStatement("Select * FROM staff WHERE StaffID = ? AND Password = ?");
            
            int staffid = Integer.parseInt(username);
            ps.setInt(1, staffid);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
              
                
                LoggedIn lg = new LoggedIn();
                lg.setStaffID(staffid);
                HttpSession session = request.getSession(true);
                session.setAttribute("Welcome ", staffid);
                session.setAttribute("LoggedIn",lg);
                RequestDispatcher rd = request.getRequestDispatcher("createQuiz.jsp");
                rd.include(request, response);
            }
            else{
                RequestDispatcher rd = request.getRequestDispatcher("staffLoginError.jsp");
                rd.include(request, response);
                out.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(StaffLogin.class.getName()).log(Level.SEVERE, null, ex);
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