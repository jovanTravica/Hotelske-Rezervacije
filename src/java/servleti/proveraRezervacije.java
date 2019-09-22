/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import binovi.Korisnik;
import binovi.Rezervacija;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.text.ParseException;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jocas
 */
public class proveraRezervacije extends HttpServlet {

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
        SimpleDateFormat datumFormat = new SimpleDateFormat("dd.mm.yyyy");
        
        String id = request.getParameter("idSobe");
        String SSobe = request.getParameter("slobodneSobe");
        String cenaNocenja = request.getParameter("cena");
       
        String datumDolaskaStr = request.getParameter("datumDolaska");
        String datumOdlaskaStr = request.getParameter("datumOdlaska");
        String idHotelaStr = request.getParameter("idHotela");
        
        HttpSession sesija = request.getSession();
        Korisnik korisnik = (Korisnik)sesija.getAttribute("korisnik");
        Connection con;
        Statement st;
        ResultSet rs = null;
        
        if(korisnik != null)
        {
            
            if(datumDolaskaStr != null && datumDolaskaStr.length() > 0 && datumOdlaskaStr != null && datumOdlaskaStr.length() > 0 )
                   
            {
                try 
                {
                    int idKorisnika = korisnik.getId();
                    int idHotela = Integer.parseInt(idHotelaStr);
                    int idSobe = Integer.parseInt(id);
                    int slobodneSobe = Integer.parseInt(SSobe);
                    float cena = Float.parseFloat(cenaNocenja);

                    Date datumDolaska = datumFormat.parse(datumDolaskaStr);
                    Date datumOdlaska = datumFormat.parse(datumOdlaskaStr);
                    long razlika = datumOdlaska.getTime() - datumDolaska.getTime();
                    long razlikaDani = TimeUnit.MILLISECONDS.toDays(razlika);

                    float ukupnaCena = cena * razlikaDani;

                    float poeni = ukupnaCena / 50;
                  if("Rezervisi".equals(akcija))
                  {
                       String poeniKorisnikaStr = "SELECT poeni FROM korisnik WHERE id = '" + idKorisnika + "'";
                         try 
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat","root","");
                            st = con.createStatement();
                            rs = st.executeQuery(poeniKorisnikaStr);
                        } 
                      catch (Exception e)
                      {
                           request.setAttribute("msg", "Greska u radu sa bazom, pri preuzimanju poena");
                            request.getRequestDispatcher("potvrdaRez.jsp").forward(request, response);
                      }
                      if(rs.next()){
                     float poeniKorisnika= rs.getFloat("poeni");
                     float ukupnoPoena= poeniKorisnika + poeni;
                    if(slobodneSobe > 0 && ukupnaCena > 0)
                    {
                        String upit = "SELECT naziv FROM hotel WHERE id = '" + idHotela + "'";

                        try 
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat","root","");
                            st = con.createStatement();
                            rs = st.executeQuery(upit);

                            if(rs.next())
                            {
                                String status = "Rezervisano";
                                Rezervacija rezervacija = new Rezervacija(idSobe, ukupnaCena, ukupnoPoena, datumDolaskaStr, datumOdlaskaStr, rs.getString("naziv"),status, idKorisnika);

                                sesija.setAttribute("rezervacija", rezervacija);
                                request.getRequestDispatcher("potvrdaRez.jsp").forward(request, response);
                                
                                st.close();
                                con.close();
                            }
                        } 
                        catch (Exception e) 
                        {
                            request.setAttribute("msg", "Greska u radu sa bazom.");
                            request.getRequestDispatcher("potvrdaRez.jsp").forward(request, response);
                        }
                    }
                    else
                    {
                        request.setAttribute("msg", "Greska trenutno nema slobodnih soba ili niste dobro uneli datume dolaska i odlaska.");
                        request.getRequestDispatcher("odjava.jsp").forward(request, response);
                    }
                      }
                  }
                  else if ("Rezervisi poenima".equals(akcija))
                  {
                     String poeniKorisnikaStr = "SELECT poeni FROM korisnik WHERE id = '" + idKorisnika + "'";
                     
                      try 
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat","root","");
                            st = con.createStatement();
                            rs = st.executeQuery(poeniKorisnikaStr);
                        } 
                      catch (Exception e)
                      {
                           request.setAttribute("msg", "Greska u radu sa bazom, pri preuzimanju poena");
                            request.getRequestDispatcher("potvrdaRez.jsp").forward(request, response);
                      }
                      if(rs.next()){
                     float poeniKorisnika= rs.getFloat("poeni");
                      float ukupnoPoena = ukupnaCena * 100;
                      
                      float razlikaPoena= poeniKorisnika - ukupnoPoena;
                      
                      
                   if(slobodneSobe > 0 && razlikaPoena > 0)
                    {
                        String upit = "SELECT naziv FROM hotel WHERE id = '" + idHotela + "'";

                        try 
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekat","root","");
                            st = con.createStatement();
                            rs = st.executeQuery(upit);

                            if(rs.next())
                            {
                                String status = "Rezervisano";
                                Rezervacija rezervacija = new Rezervacija(idSobe, ukupnaCena, razlikaPoena, datumDolaskaStr, datumOdlaskaStr, rs.getString("naziv"),status, idKorisnika);

                                sesija.setAttribute("rezervacija", rezervacija);
                                request.getRequestDispatcher("potvrdaRez.jsp").forward(request, response);
                                
                                st.close();
                                con.close();
                            }
                        } 
                        catch (Exception e) 
                        {
                            request.setAttribute("msg", "Greska u radu sa bazom.");
                            request.getRequestDispatcher("potvrdaRez.jsp").forward(request, response);
                        }
                    }
                    else
                    {
                        request.setAttribute("msg", "Greska trenutno nema slobodnih soba, NEMATE POENA ili niste dobro uneli datume dolaska i odlaska.");
                        request.getRequestDispatcher("odjava.jsp").forward(request, response);
                    }
                      }
                  }
                } 
                
                
                
                
                
                catch (Exception e) 
                {
                    request.setAttribute("msg", e.getMessage());
                    request.getRequestDispatcher("potvrdaRez.jsp").forward(request, response);
                }
            }
            else
            {
                request.setAttribute("msg", "Morate uneti datum dolaska i odlaska.");
                request.getRequestDispatcher("potvrdaRez.jsp").forward(request, response);
            }
        }
        else 
        {
            request.setAttribute("msg", "Morate da se ulogujete da biste izvrsili rezervaciju!");
            request.getRequestDispatcher("potvrdaRez.jsp").forward(request, response);
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
