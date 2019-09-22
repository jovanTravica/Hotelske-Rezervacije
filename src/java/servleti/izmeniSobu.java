/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jocas
 */
public class izmeniSobu extends HttpServlet {

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
        
        String soba = request.getParameter("idSobe");
        String hotel = request.getParameter("idHotela");
        String tipSobe = request.getParameter("tipSobe");
        String opis = request.getParameter("opis");
        String brojSoba = request.getParameter("brojSoba");
        String brojSlobodnihSoba = request.getParameter("brojSlobodnihSoba");
        String cena = request.getParameter("cena");
        String slika = request.getParameter("slika");
        
        if (soba != null && soba.length() > 0 && hotel != null && hotel.length() > 0
                && tipSobe != null && tipSobe.length() > 0 && opis != null && opis.length() > 0 
                && brojSoba != null && brojSoba.length() > 0 && brojSlobodnihSoba != null && brojSlobodnihSoba.length() > 0
                && cena != null && cena.length() > 0 && slika != null && slika.length() > 0)
        {
            String dbUrl = "jdbc:mysql://localhost:3306/projekat";
            String user = "root";
            String pass = "";
            try 
            {
                int sobaID = Integer.parseInt(soba);
                int hotelID = Integer.parseInt(hotel);
                int tipSobeID = Integer.parseInt(tipSobe);
                int ukupanBrojSoba = Integer.parseInt(brojSoba);
                int ukupanBrojSlobodnihSoba = Integer.parseInt(brojSlobodnihSoba);
                float cenaF = Float.parseFloat(cena);
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl,user,pass);
                Statement st = con.createStatement();
                
                String upit = "UPDATE soba SET idHotela = ?, tipSobe = ?, opis = ?, brojSoba = ?, brojSlobodnihSoba = ?, "
                        + "cena = ?, slika = ? WHERE id = ?";
            
                PreparedStatement ps = con.prepareStatement(upit);
                ps.setInt(1, hotelID);
                ps.setInt(2, tipSobeID);
                ps.setString(3, opis);
                ps.setInt(4, ukupanBrojSoba);
                ps.setInt(5, ukupanBrojSlobodnihSoba);
                ps.setFloat(6, cenaF);
                ps.setString(7, slika);
                ps.setInt(8, sobaID);
                
                try {
                    ps.executeUpdate();
                } 
                catch (SQLException e) {
                    request.setAttribute("msg", e.getMessage());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                
                request.setAttribute("msg", "Uspesno ste izmenili sobu");
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
