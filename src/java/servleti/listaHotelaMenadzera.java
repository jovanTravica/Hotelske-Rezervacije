/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import binovi.Hotel;
import binovi.Korisnik;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jocas
 */
public class listaHotelaMenadzera extends HttpServlet {

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
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        
        HttpSession sesija = request.getSession();
        Korisnik korisnik = (Korisnik)sesija.getAttribute("korisnik");
        int id = korisnik.getId();
        
        ArrayList<Hotel> listaHotela = new ArrayList<Hotel>();
        
        String upit = "SELECT * FROM hotel WHERE menadzerID = '" + id + "'";
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat","root","");
            stmt = con.createStatement();
            rs = stmt.executeQuery(upit);
            
            while(rs.next())
            {   
                listaHotela.add(new Hotel(rs.getInt("id"), rs.getString("naziv"), rs.getString("adresa"), 
                        rs.getString("telefon"), rs.getString("opis"), rs.getString("slika"), rs.getInt("menadzerID")));
            }
            
            request.setAttribute("hoteli", listaHotela);
            request.getRequestDispatcher("hoteli.jsp").forward(request, response);
            
            stmt.close();
            con.close();
        } 
        catch (Exception e) 
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("hoteli.jsp").forward(request, response);
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
