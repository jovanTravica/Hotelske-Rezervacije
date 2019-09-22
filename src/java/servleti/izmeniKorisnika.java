/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author jocas
 */
public class izmeniKorisnika extends HttpServlet {

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
        
        String korisnik = request.getParameter("idKorisnika");
        String korisnickoIme = request.getParameter("korisnickoIme");
        String lozinka = request.getParameter("lozinka");
        String email = request.getParameter("email");
        String telefon = request.getParameter("telefon");
        String poeni = request.getParameter("poeni");
        String tipKorisnika = request.getParameter("tipKorisnika");
        
        if(korisnik != null && korisnik.length() > 0 && korisnickoIme != null && korisnickoIme.length() > 0
                && lozinka != null && lozinka.length() > 0 && telefon != null && telefon.length() > 0 
                && email != null && email.length() > 0 && poeni != null && poeni.length() > 0
                && tipKorisnika != null && tipKorisnika.length() > 0)
        {
            String dbUrl = "jdbc:mysql://localhost:3306/projekat";
            String user = "root";
            String pass = "";
            try 
            {
                int korisnikID = Integer.parseInt(korisnik);
                float poeniF = Float.parseFloat(poeni);
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl,user,pass);
                Statement st = con.createStatement();
                
                String upit = "UPDATE korisnik SET korisnickoIme = ?, lozinka = ?, email = ?, telefon = ?, poeni = ?, tipKorisnika = ? WHERE id = ?";
            
                PreparedStatement ps = con.prepareStatement(upit);
               ps.setString(1, korisnickoIme);
                ps.setString(2, lozinka);
                ps.setString(3, email);
                ps.setString(4, telefon);
                ps.setFloat(5, poeniF);
                ps.setString(6, tipKorisnika);
                ps.setInt(7, korisnikID);
                
                try {
                    ps.executeUpdate();
                } 
                catch (SQLException e) {
                    request.setAttribute("msg", e.getMessage());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                
                request.setAttribute("msg", "Uspesno ste izmenili korisnika");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                
                ps.close();
                st.close();
                con.close();
            } 
            catch (IOException | ClassNotFoundException | NumberFormatException | SQLException | ServletException e) 
            {
                request.setAttribute("msg", e.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
        else
        {
            request.setAttribute("msg", "Niste uneli promenu");
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
