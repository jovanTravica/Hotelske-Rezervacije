<%-- 
    Document   : hoteli
    Created on : Aug 2, 2019, 12:37:13 AM
    Author     : jocas
--%>

<%@page import="binovi.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="binovi.Hotel" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/stil.css">
        <title>Hoteli</title>
    </head>
    <body style="background-image: url(Slike/pozadina.jpg)">
       <nav class="navbar navbar-expand-lg  p-3 mb-2 bg-info ">
          
                <ul class="navbar-nav  mt-2 " >
                    <li class="nav-item">
                        <a href="index.jsp">
                            <img src="Slike/logo.jpg" width="60" height="60" class="rounded-circle" alt="Ne moze da se ucita logo">
                        </a>
                    </li>
                    <%
                        Korisnik korisnik = (Korisnik)request.getSession().getAttribute("korisnik");
                        if(korisnik == null)
                        {
                    %>
                    <li class="nav-item  " >
                        <a href="listaHotela" class="btn btn-secondary btn-lg ml-4  ">Hoteli</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-secondary btn-lg ml-4 btn-warning float-lg-right" href="registracija.jsp">Registruj se</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-secondary btn-lg ml-4 btn-light float-lg-right" href="logovanje.jsp">Uloguj se</a>
                    </li>
                    <% }
                        else if(korisnik.getTipKorisnika().equals("Klijent"))
{ %>
              
                  <li class="nav-item">
                        <a href="listaHotela" class="btn btn-secondary btn-lg ml-3">Hoteli</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-secondary btn-lg ml-3" href="profil">Moj profil</a>
                    </li>
                    
                    <li class="nav-item">
                        <a href="odjava" class="btn btn-secondary btn-lg ml-3 btn-warning">Odjavi se</a>
                    </li>
                     <li class="nav-item">
                    <a href="podesavanjaProfila.jsp"  class="btn btn-secondary btn-lg ml-3 btn-info">Podesavanja profila</a>
                    </li>
                    <%
                        }
                        else if(korisnik.getTipKorisnika().equals("Menadzer"))
                        {
                    %>
                    <li class="nav-item">
                        <a href="listaHotelaMenadzera" class="btn btn-secondary btn-lg ml-4">Hoteli</a>
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
        <% 
            String msg = (String)request.getAttribute("msg");
            if(msg != null)
            {
        %>
        <%= msg %>
        <%
            }
        %>
        <%
            ArrayList<Hotel> hoteli = (ArrayList<Hotel>)request.getAttribute("hoteli");
        %>
        <div class="container">
            <div class="row">
                <%
                    for(Hotel h : hoteli)
                    {
                %>
                <div class="modal-body">
                    <div class="border-dark bg-warning shadow p-3 ml-5  " >
                        <img src="<%= h.getSlika() %>" class="card-img-top" height="200px" width="300px" alt="Nije moguce ucitati sliku">
                        <div >
                            <h5 ><%= h.getNaziv()%></h5>
                            <p ><%= h.getOpis()%></p>
                            <% 
                                if(korisnik == null)
                                {
                            %>
                            <form action="listaSoba" method="post">
                                <input type="hidden" name="hotelID" value="<%= h.getId() %>">
                                <input type="submit" class="btn btn-primary" value="Detaljnije">
                            </form>
                            <%  
                                }
                                else if(korisnik.getTipKorisnika().equals("Administrator"))
                                {
                            %>
                            <form action="izmenaIbrisanjeHotela" method="post" style="display: inline">
                                <input type="hidden" name="idHotela" value="<%= h.getId() %>">
                                <input type="submit" name="akcija" class="btn btn-light" value="Izmeni">
                                <input type="submit" name="akcija" class="btn btn-danger" value="Obrisi">  
                                
                            </form>
                                
                             <form action="listaSoba" method="post" style="display: inline">
                                <input type="hidden" name="hotelID" value="<%= h.getId() %>">
                                <input type="submit" class="btn btn-primary" value="Sobe">
                               
                            </form>
                                  <form action="inputSoba" method="post" style="display: inline">
                                <input type="hidden" name="idHotela" value="<%= h.getId() %>">
                                <input type="submit" value="Dodaj sobu" class="btn btn-primary">
                                  </form>
                                
                            <% } 
                                else if(korisnik.getTipKorisnika().equals("Menadzer"))
                                {
                            %>
                            <form action="listaSoba" method="post" style="display: inline">
                                <input type="hidden" name="hotelID" value="<%= h.getId() %>">
                                <input type="submit" class="btn btn-primary" value="Sobe">
                            </form>
                            <form action="inputSoba" method="post" style="display: inline">
                                <input type="hidden" name="idHotela" value="<%= h.getId() %>">
                                <input type="submit" value="Dodaj sobu" class="btn btn-primary">

                            </form>
                                <form action="izmenaIbrisanjeHotela" method="post" style="display: inline">
                                    <input type="hidden" name="idHotela" value="<%= h.getId() %>">
                                      <input type="submit" name="akcija" class="btn btn-light" value="Izmeni">
                                </form>
                                <% }
                                    else if(korisnik.getTipKorisnika().equals("Klijent"))
                                    {
                                %>
                                <form action="listaSoba" method="post">
                                <input type="hidden" name="hotelID" value="<%= h.getId() %>">
                                <input type="submit" class="btn btn-primary" value="Detaljnije">
                                </form>
                                <% } %>
                        </div>
                    </div>
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

