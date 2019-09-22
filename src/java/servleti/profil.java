/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import binovi.Hotel;
import binovi.Korisnik;
import binovi.Rezervacija;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author jocas
 */
public class profil extends HttpServlet {

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
        HttpSession sesija = request.getSession();
        Korisnik korisnik = (Korisnik)sesija.getAttribute("korisnik");
        int idKorisnika = korisnik.getId();
        ArrayList<Rezervacija> listaRezervacija = new ArrayList<>();
        ArrayList<Integer> listaId = new ArrayList<>();
        
        switch (korisnik.getTipKorisnika()) {
            case "Klijent":
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(dbUrl,user,pass);
                    Statement st = con.createStatement();
                    ResultSet rs = null;
                    String upit = "SELECT * FROM rezervacija WHERE idKorisnika = '" + idKorisnika + "'";
                    rs = st.executeQuery(upit);
                    
                    while(rs.next())
                    {
                        listaId.add(rs.getInt("id"));
                        listaRezervacija.add(new Rezervacija(rs.getInt("idSobe"), rs.getFloat("cenaRezervacije"), rs.getFloat("poeni"),
                                rs.getString("datumDolaska"), rs.getString("datumOdlaska"), rs.getString("nazivHotela"), rs.getString("status")
                               , idKorisnika));
                    }
                    request.setAttribute("listaId", listaId);
                    request.setAttribute("listaRezervacija", listaRezervacija);
                    request.getRequestDispatcher("profil.jsp").forward(request, response);
                    
                    rs.close();
                    st.close();
                    con.close();
                }
                catch (IOException | ClassNotFoundException | SQLException | ServletException e)
                {
                    request.setAttribute("msg", e.getMessage());
                    request.getRequestDispatcher("profil.jsp").forward(request, response);
                }   break;
           
            case "Administrator":
                try 
                {
                    ArrayList<Korisnik> listaKorisnika = new ArrayList<>();
                    ArrayList<Hotel> listaHotela = new ArrayList<>();
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(dbUrl,user,pass);
                    Statement st = con.createStatement();
                    ResultSet rs = null;
                    String upit = "SELECT * FROM korisnik";
                    rs = st.executeQuery(upit);
                    
                    while(rs.next())
                    {
                        listaKorisnika.add(new Korisnik(rs.getInt("id"), rs.getString("korisnickoIme"), 
                                rs.getString("lozinka"), rs.getString("email"), rs.getString("telefon"), 
                                rs.getFloat("poeni"), rs.getString("tipKorisnika")));
                    }
                    
                    String upitHotel = "SELECT * FROM hotel";
                    rs = st.executeQuery(upitHotel);
                    
                    while(rs.next())
                    {
                        listaHotela.add(new Hotel(rs.getInt("id"), rs.getString("naziv"), rs.getString("adresa"), rs.getString("telefon"), 
                                rs.getString("opis"), rs.getString("slika"), rs.getInt("menadzerID")));
                    }
                    
                    request.setAttribute("listaHotela", listaHotela);
                    request.setAttribute("listaKorisnika", listaKorisnika);
                    request.getRequestDispatcher("profil.jsp").forward(request, response);
                    
                    rs.close();
                    st.close();
                    con.close();
                } 
                catch (IOException | ClassNotFoundException | SQLException | ServletException e) 
                {
                    request.setAttribute("msg", e.getMessage());
                    request.getRequestDispatcher("profil.jsp").forward(request, response);
                }
                break;
            default:
                break;
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
