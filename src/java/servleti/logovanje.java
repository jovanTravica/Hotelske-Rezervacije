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
import binovi.Korisnik;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jocas
 */
public class logovanje extends HttpServlet {

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
        
        String korisnickoIme = request.getParameter("korisnicko");
        String lozinka = request.getParameter("lozinka");
        String msg = "";
        
        HttpSession sesija = request.getSession();
        Korisnik korisnik = new Korisnik();
        
        String dbUrl = "jdbc:mysql://localhost:3306/projekat";
        String user = "root";
        String pass = "";
        
        if(korisnickoIme.isEmpty() || lozinka.isEmpty())
        {
            msg = "Morate uneti oba polja.";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("logovanje.jsp").forward(request, response);
        }
        else
        {
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(dbUrl,user,pass);
                st = con.createStatement();
                String upit = "SELECT * FROM korisnik WHERE korisnickoIme = '" + korisnickoIme + "' AND lozinka = '" + lozinka + "'";
                rs = st.executeQuery(upit);
                
                if(rs.next())
                {
                    korisnik.setKorisnickoIme(korisnickoIme);
                    korisnik.setLozinka(lozinka);
                    korisnik.setId(rs.getInt("id"));
                    korisnik.setEmail(rs.getString("email"));
                    korisnik.setTelefon(rs.getString("telefon"));
                    korisnik.setTipKorisnika(rs.getString("tipKorisnika"));
                    korisnik.setPoeni(rs.getInt("poeni"));
                    
                    st.close();
                    con.close();
                    
                    sesija.setAttribute("korisnik", korisnik);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                else
                {
                    msg = "Neispravno korisnicko ime i lozinka";
                    request.setAttribute("msg", msg);
                    st.close();
                    con.close();
                    request.getRequestDispatcher("logovanje.jsp").forward(request, response);
                }
                //request.setAttribute("korisnik", korisnik);//treba da pamti korisnika koji se ulogovao i na osnovu toga da generise stranu,
                //odnosno da prikaze da je korinik ulogovan
            }
            catch (ClassNotFoundException e) 
            {
                
            }
            catch (SQLException se)
            {
                sesija.invalidate();
                msg = se.getMessage();
                if(con != null)
                {
                    try 
                    {
                        con.close();
                    } 
                    catch (Exception e) 
                    {
                        msg+= e.getMessage();
                    }
                    request.setAttribute("msg", msg);
                    request.getRequestDispatcher("logovanje.jsp").forward(request, response);
                }
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
