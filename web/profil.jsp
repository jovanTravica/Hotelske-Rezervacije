<%-- 
    Document   : profil
    Created on : Aug 4, 2019, 9:54:12 PM
    Author     : jocas
--%>

<%@page import="binovi.Hotel"%>
<%@page import="binovi.Rezervacija"%>
<%@page import="java.util.ArrayList"%>
<%@page import="binovi.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/stil.css">
        <title>Profil</title>
    </head>
    <body class="bg-dark">
        
       <nav class="navbar navbar-expand-lg  p-3 mb-2 bg-info ">
          
                <ul class="navbar-nav  mt-2 " >
                    <li class="nav-item">
                        <a href="index.jsp">
                            <img src="Slike/logo.jpg" width="60" height="60" class="rounded-circle float-left" alt="Ne moze da se ucita logo">
                        </a>
                    </li>
                    <%
                        Korisnik korisnik = (Korisnik)request.getSession().getAttribute("korisnik");
                          if(korisnik.getTipKorisnika().equals("Klijent"))
{ %>
              
                  <li class="nav-item">
                        <a href="listaHotela" class="btn btn-secondary btn-lg ml-4">Hoteli</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-secondary btn-lg ml-4" href="profil">Moj profil</a>
                    </li>
                    <li class="nav-item">
                        <a href="odjava" class="btn btn-secondary btn-lg ml-4 btn-warning">Odjavi se</a>
                    </li>
                     <li class="nav-item">
                    <a href="podesavanjaProfila.jsp"  class="btn btn-secondary btn-lg ml-3 btn-info">Podesavanja profila</a>
                    </li>
                    
                 
                     <%
                        }
                        else if(korisnik.getTipKorisnika().equals("Administrator"))
                        {
                    %>
                    <li class="nav-item">
                        <a href="listaHotela" class="btn btn-secondary btn-lg ml-4">Hoteli</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-secondary btn-lg ml-4" href="profil">Korisnici</a>
                    </li>
                       <li class="nav-item">
                        <a href="inputHotel" class="btn btn-secondary btn-lg ml-4">Dodaj hotel</a>
                    <li class="nav-item">
                        <a href="odjava" class="btn btn-secondary btn-lg ml-4 btn-warning">Odjavi se</a>
                    </li>
                     <li class="nav-item">
                    <a href="podesavanjaProfila.jsp"  class="btn btn-secondary btn-lg ml-3 btn-info">Podesavanja profila</a>
                    </li>
                   
                     <%
                         }
                %>
                </ul>
            </div>
        </nav>
                
        <div class="container">
            <div class="row">
                <div class="col-md-12" id="bojapozadine" >
                   
                    <h2 align="center" >
                        <%
                            String msg = (String)request.getAttribute("msg");
                            if(msg != null)
                            {
                        %>
                            <%= msg %>
                        <%
                            }
                        %>
                    </h2 >
                    
                    <%
                        if(korisnik.getTipKorisnika().equals("Klijent") )
                        {
                            ArrayList<Rezervacija> listaRezervacija = (ArrayList<Rezervacija>)request.getAttribute("listaRezervacija");
                    %>
                    <table class="table table-borderless text-warning" >
                        <thead>
                          <tr>
                            <th>ID Sobe</th>
                            <th>Datum dolaska</th>
                            <th>Datum odlaska</th>
                            <th>Cena rezervacije</th>
                            <th>Naziv hotela</th>
                            <th>Poeni</th>
                            <th>Status</th>
                          </tr>
                        </thead>
                        <tbody>
                    <% 
                       if(listaRezervacija != null){
                            
                                for(Rezervacija r : listaRezervacija)
                                {
                    %>
                        <form action="otkaziRezervaciju" method="post">
                          <tr>
                              <input type="hidden" name="idKorisnika" value="<%= korisnik.getId() %>">
                          <input type="hidden" name="idSobe" value="<%= r.getIdSobe() %>">
                          <input type="hidden" name="cena" value="<%= r.getCenaRezervacije()%>">
                            <td><%= r.getIdSobe() %></td>
                            <td><%= r.getDatumDolaska() %></td>
                            <td><%= r.getDatumOdlaska()%></td>
                            <td><%= r.getCenaRezervacije()%></td>
                            <td><%= r.getNazivHotela() %></td>
                            <td><%= r.getPoeni()%></td>
                            <td><%= r.getStatus()%></td>
                            
                           
                            <td>
                                <input type="submit" value="Otkazi" action="otkaziRezervaciju" method="post" class="btn btn-danger btn-lg">
                            </td>
                       
                            <% } %>
                          </tr>
                         
                        </form>
                         
                          
                    <%
                        }
                        else 
                        {
                    %>
                    
                          <tr>
                              <td colspan="8" class=" text-white"align="center"><b>Trenutno nema rezervacija</b></td>
                          </tr>
                 <% } %>
                    <tr>
                        
                    </tr>
                        </tbody>
                    </table>
                    <%
                        }
                        else if(korisnik.getTipKorisnika().equals("Administrator"))
                        {
                            ArrayList<Korisnik> listaKorisnika = (ArrayList<Korisnik>)request.getAttribute("listaKorisnika");
                    %>
                   
                       
                    <table class="table table-striped table-info table-borderless ">
                        <thead>
                          <tr>
                            <th>ID korisnika</th>
                            <th>Korinicko ime</th>
                            <th>Lozinka</th>
                            <th>Email</th>
                            <th>Telefon</th>
                            <th>Tip korisnika</th>
                          </tr>
                        </thead>
                        <tbody>
                    <%
                            if(listaKorisnika != null)
                            {
                                for(Korisnik k : listaKorisnika)
                                {
                    %>
                        <form action="izmenaIbrisanjeKorisnika" method="post">
                        <tr>
                            <input type="hidden" name="idKorisnika" value="<%= k.getId() %>">
                            <td><%= k.getId() %></td>
                            <td><%= k.getKorisnickoIme() %></td>
                            <td><%= k.getLozinka() %></td>
                            <td><%= k.getEmail() %></td>
                            <td><%= k.getTelefon() %></td>
                            <td><%= k.getTipKorisnika() %></td>
                            <td>
                                <input type="submit" value="Izmeni" name="akcija" class="btn btn-light btn-lg">
                                <input type="submit" value="Obrisi" name="akcija" class="btn btn-danger btn-lg">
                            </td>
                        </tr>
                        </form>
                    <%
                                }
                                }
                                else
                                {
                    %>
                        <tr>
                            <td colspan="6" align="center"><b>Trenutno nema korisnika</b></td>
                        </tr>
                    <%  
                                }
                    %>
                    
                       
                        </tbody>
                    </table>
                     <div colspan="8" align="center">
                            <a href="dodajKorisnika.jsp" class="btn btn-secondary btn-lg ml-3 btn-warning">Dodaj korisnika</a>
                        </div>
                    
                    <%
                        }
                    %>
            </div>
        </div>
        <script type="text/javascript" src="js/bootstrap.bundle.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>        
    </body>
</html>

