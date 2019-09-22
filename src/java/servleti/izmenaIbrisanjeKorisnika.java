/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import binovi.Korisnik;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jocas
 */
public class izmenaIbrisanjeKorisnika extends HttpServlet {

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
        
        String akcija = request.getParameter("akcija");
        String korisnik = request.getParameter("idKorisnika");
        int korisnikId = Integer.parseInt(korisnik);
        
        
        if("Izmeni".equals(akcija))
        {
            String dbUrl = "jdbc:mysql://localhost:3306/projekat";
            String user = "root";
            String pass = "";
            
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl,user,pass);
                Statement st = con.createStatement();
                ResultSet rs = null;
                
                
                String upit = "SELECT * FROM korisnik WHERE id = '" + korisnikId + "'";
                PreparedStatement ps = con.prepareStatement(upit);
                rs = st.executeQuery(upit);
                if(rs.next())
                {
                    Korisnik korisnikIzmena = new Korisnik(korisnikId, rs.getString("korisnickoIme"), rs.getString("email"),
                            rs.getString("lozinka"), rs.getString("telefon"), rs.getFloat("poeni"), rs.getString("tipKorisnika"));
                    
                    request.setAttribute("korisnikIzmena", korisnikIzmena);
                    request.getRequestDispatcher("izmeniKorisnika.jsp").forward(request, response);
                }
                
                rs.close();
                st.close();
                con.close();
            } 
            catch (IOException | ClassNotFoundException | SQLException | ServletException e) 
            {
                request.setAttribute("msg", e.getMessage());
                request.getRequestDispatcher("izmeniHotel.jsp").forward(request, response);
            }
        }
        else if ("Obrisi".equals(akcija))
        {
            String dbUrl = "jdbc:mysql://localhost:3306/projekat";
            String user = "root";
            String pass = "";
            
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl,user,pass);
                Statement st = con.createStatement();
                
                String upitRezervacija = "DELETE FROM korisnik WHERE id = ?";
            
                PreparedStatement ps = con.prepareStatement(upitRezervacija);
                ps.setInt(1, korisnikId);
                
                try {
                ps.executeUpdate();
                } 
                catch (SQLException e) {
                    request.setAttribute("msg", e.getMessage());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                request.setAttribute("msg", "Obrisali ste korisnika");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } 
            catch (IOException | ClassNotFoundException | SQLException | ServletException e) 
            {
                request.setAttribute("msg", e.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
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
