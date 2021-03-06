/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import binovi.Soba;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jocas
 */
public class RezSobe extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        String idStr = request.getParameter("idSobe");
        
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        
        if(idStr != null && idStr.length() > 0)
        {
            try 
            {
                int id = Integer.parseInt(idStr);

                String upit = "SELECT * FROM soba WHERE id = '" + id + "'";

                
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat","root","");
                    st = con.createStatement();
                    rs = st.executeQuery(upit);

                    if(rs.next())
                    {
                        Soba soba = new Soba(id, rs.getInt("idHotela"), 
                                rs.getInt("tipSobe"), rs.getString("opis"), rs.getInt("brojSoba"), 
                                rs.getInt("brojSlobodnihSoba"), rs.getFloat("cena"), rs.getString("slika"));
                        request.setAttribute("opisSobe", soba);
                        request.getRequestDispatcher("rezSobe.jsp").forward(request, response);
                        
                        st.close();
                        con.close();
                    }
                } 
                }
                catch (Exception e) 
                {
                    request.setAttribute("msg", "Greska u radu sa bazom.");
                    request.getRequestDispatcher("rezSobe.jsp").forward(request, response);
                }
            

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
