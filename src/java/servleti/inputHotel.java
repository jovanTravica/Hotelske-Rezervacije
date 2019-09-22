/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import binovi.Korisnik;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jocas
 */
public class inputHotel extends HttpServlet {

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
        
        String dbUrl = "jdbc:mysql://localhost:3306/projekat";
        String user = "root";
        String pass = "";
        
        try 
        {
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection(dbUrl,user,pass);    
            Statement st = con.createStatement();
            ResultSet rs = null;
            ArrayList<Korisnik> listaMenadzera = new ArrayList<>();
            
            String upitMenadzer = "SELECT * FROM korisnik WHERE tipKorisnika = 'Menadzer'";
           
            rs =st.executeQuery(upitMenadzer);
            while(rs.next())
            {
                listaMenadzera.add(new Korisnik(rs.getInt("id"), rs.getString("korisnickoIme"), rs.getString("lozinka"),
                        rs.getString("email"), rs.getString("telefon"), rs.getFloat("poeni"), rs.getString("tipKorisnika")));
            }
            
            request.setAttribute("listaMenadzera", listaMenadzera);
            request.getRequestDispatcher("dodajHotel.jsp").forward(request, response);
            
            rs.close();
            st.close();
            con.close();
        } 
        catch (IOException | ClassNotFoundException | SQLException | ServletException e) 
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
