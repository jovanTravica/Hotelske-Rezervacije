/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;


import binovi.Rezervacija;
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
public class potvrdaRezervacije extends HttpServlet {

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
        Rezervacija rezervacija = (Rezervacija)sesija.getAttribute("rezervacija");
        int idSobe = rezervacija.getIdSobe();
        
        try 
        {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection(dbUrl,user,pass);
           Statement st = con.createStatement();
           ResultSet rs = null;
           String upit = "SELECT * FROM soba WHERE id = '" + idSobe + "'";
           rs = st.executeQuery(upit);
           
           if(rs.next())
           {
               int brojSlobodnihSoba = rs.getInt("brojSlobodnihSoba");
               brojSlobodnihSoba -= 1;
               String slobodneSobe = "UPDATE soba SET brojSlobodnihSoba = ? WHERE id = ?";
                   
               PreparedStatement ps = con.prepareStatement(slobodneSobe);
               ps.setInt(1, brojSlobodnihSoba);
               ps.setInt(2, idSobe);
               try 
               {
                   ps.executeUpdate();
               }
               catch (SQLException e)
               {
                   request.setAttribute("msg", e.getMessage());
                   request.getRequestDispatcher("odjava.jsp").forward(request, response);
               }
               String upitRezervacija = "INSERT INTO rezervacija (idSobe, cenaRezervacije, poeni, datumDolaska, datumOdlaska, nazivHotela, status,  idKorisnika)"
                        + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
             
               ps = con.prepareStatement(upitRezervacija);
              
               ps.setInt(1, idSobe);
               ps.setFloat(2, rezervacija.getCenaRezervacije());
               ps.setFloat(3, rezervacija.getPoeni());
               ps.setString(4, rezervacija.getDatumDolaska());
               ps.setString(5, rezervacija.getDatumOdlaska());
               ps.setString(6, rezervacija.getNazivHotela());
               ps.setString(7, rezervacija.getStatus());
               ps.setInt(8, rezervacija.getIdKorisnika());
               
               try 
               {
                   ps.executeUpdate();
               }
               catch (SQLException e)
               {
                   request.setAttribute("msg", e.getMessage());
                   request.getRequestDispatcher("odjava.jsp").forward(request, response);
               }
                 String upitPoeni = "UPDATE korisnik SET poeni =? WHERE id=?";
                       ps= con.prepareStatement(upitPoeni);
                        ps.setFloat(1, rezervacija.getPoeni());
                        ps.setInt(2, rezervacija.getIdKorisnika());
                    try 
               {
                   ps.executeUpdate();
               }
               catch (SQLException e)
               {
                   request.setAttribute("msg", e.getMessage());
                   request.getRequestDispatcher("odjava.jsp").forward(request, response);
               }
               ps.close();
               request.setAttribute("msg", "Uspesno ste rezervisali sobu.");
               request.getRequestDispatcher("odjava.jsp").forward(request, response);
           }
           else
           {
               request.setAttribute("msg", "Nema rezultata za sobu");
               request.getRequestDispatcher("odjava.jsp").forward(request, response);
           }
           rs.close();
           st.close();
           con.close();
        } 
        catch (ClassNotFoundException e) 
        {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("odjava.jsp").forward(request, response);
        }
        catch (SQLException se)
        {
            String poruka = se.getMessage();
            request.setAttribute("msg", poruka);
            request.getRequestDispatcher("odjava.jsp").forward(request, response);
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
