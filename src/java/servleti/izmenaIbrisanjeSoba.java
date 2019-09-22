/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import binovi.Hotel;
import binovi.Korisnik;
import binovi.Soba;
import java.io.IOException;
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
public class izmenaIbrisanjeSoba extends HttpServlet {

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
        String soba = request.getParameter("idSobe");
        int sobaId = Integer.parseInt(soba);
        
       String hotel = request.getParameter("idHotela");
       
          
        if("Izmeni".equals(akcija))
        {
            String dbUrl = "jdbc:mysql://localhost:3306/projekat";
            String user = "root";
            String pass = "";
            HttpSession sesija = request.getSession();
        
           ;
           
            
            try 
            {
               
                ArrayList<Integer> listaTipovaSobe = new ArrayList<>();
                  ArrayList<Hotel> listaHotela = new ArrayList<>();
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl,user,pass);
                Statement st = con.createStatement();
                ResultSet rs = null;
                  
                String upitHotel = "SELECT * FROM hotel WHERE id='" + hotel + "'";
                
                rs = st.executeQuery(upitHotel);
                
                while(rs.next())
                {
                    listaHotela.add(new Hotel(rs.getInt("id"), rs.getString("naziv"), rs.getString("adresa"), rs.getString("telefon"), 
                            rs.getString("opis"), rs.getString("slika"), rs.getInt("menadzerID")));
                }
                
                String upitTipSobe = "SELECT * FROM tipsobe";
                
                rs = st.executeQuery(upitTipSobe);
                
                while(rs.next())
                {
                    listaTipovaSobe.add(rs.getInt("id"));
                }
                
                String upit = "SELECT * FROM soba WHERE id = '" + sobaId + "'";
                
                rs = st.executeQuery(upit);
                if(rs.next())
                {
                    Soba sobaIzmena = new Soba(sobaId, rs.getInt("idHotela"), rs.getInt("tipSobe"), rs.getString("opis"), 
                            rs.getInt("brojSoba"), rs.getInt("brojSlobodnihSoba"), rs.getFloat("cena"), rs.getString("slika"));
                    
                    request.setAttribute("listaHotela", listaHotela);
                    request.setAttribute("listaTipova", listaTipovaSobe);
                    request.setAttribute("sobaIzmena", sobaIzmena);
                    request.getRequestDispatcher("izmeniSobu.jsp").forward(request, response);
                }
                
                rs.close();
                st.close();
                con.close();
            } 
            catch (IOException | ClassNotFoundException | SQLException | ServletException e) 
            {
                request.setAttribute("msg", e.getMessage());
                request.getRequestDispatcher("izmeniSobu.jsp").forward(request, response);
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
                
                String upitRezervacija = "DELETE FROM soba WHERE id = ?";
            
                PreparedStatement ps = con.prepareStatement(upitRezervacija);
                ps.setInt(1, sobaId);
                
                try {
                ps.executeUpdate();
                } 
                catch (SQLException e) {
                    request.setAttribute("msg", e.getMessage());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                request.setAttribute("msg", "Obrisali ste sobu.");
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
