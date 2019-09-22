<%-- 
    Document   : sobe
    Created on : Aug 5, 2019, 1:55:15 PM
    Author     : jocas
--%>

<%@page import="binovi.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="binovi.Soba" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
         <link rel="stylesheet" href="css/stil.css">
        <title>Sobe</title>
    </head>
    <body style= "background-image: url(Slike/pozadina.jpg)">
        
       <nav class="navbar navbar-expand-lg  p-3 mb-2 bg-info ">
          
                <ul class="navbar-nav  mt-2 " >
                    <li class="nav-item">
                        <a href="index.jsp">
                            <img src="Slike/logo.jpg" width="60" height="60" class="rounded-circle float-left" alt="Ne moze da se ucita logo">
                        </a>
                    </li>
                    <%
                        Korisnik korisnik = (Korisnik)request.getSession().getAttribute("korisnik");
                        if(korisnik == null)
                        {
                    %>
                    <li class="nav-item">
                        <form action="listaHotela" method="post" <%--class="nav-link text-white h4"--%>>
                            <input type="submit" value="Hoteli" class="btn btn-secondary btn-lg ml-3">
                        </form>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-secondary btn-lg ml-4 btn-warning" href="registracija.jsp">Registruj se</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-secondary btn-lg ml-4 btn-light" href="logovanje.jsp">Uloguj se</a>
                    </li>
                    <% }
                    
                        else if(korisnik.getTipKorisnika().equals("Klijent"))
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
                    <%}
                        

                        else if(korisnik.getTipKorisnika().equals("Menadzer"))
                        {
                    %>
                    <li class="nav-item">
                        <form action="listaHotelaMenadzera" method="post">
                           
                            <input type="submit" value="Hoteli" class="btn btn-secondary btn-lg ml-3">
                        </form>
                    </li>
                  
                    <li class="nav-item">
                        <form action="odjava" method="post">
                            <input type="submit" value="Odjavi se" class="btn btn-secondary btn-lg ml-4 btn-warning">
                        </form>
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
                   
                     <%
                         }
%>
                </ul>
            </div>
        </nav>
        <% 
            ArrayList<Soba> sobe = (ArrayList<Soba>)request.getAttribute("sobe");
        %>
        <div class="container">
            <div class="row">
                <%
                    if(korisnik == null || korisnik.getTipKorisnika().equals("Klijent"))
                    {
                        for(Soba s : sobe)
                        {
                %>
                <div class="col-4">
                    <div class="card-deck bg-info "style="width: 250px;" >
                        <img src="<%= s.getSlika() %>"  height="150px" width="300px" alt="Nije moguce ucitati sliku">
                        <div class="card-body">
                            <p class="card-text">
                                <%= s.getOpis()%><br>
                                Broj slobodnih soba: <%= s.getSlobodneSobe() %><br>
                                Cena nocenja: <%= s.getCena() %>
                            </p>
                            <form action="RezSobe" method="post">
                                <input type="hidden" name="idSobe" value="<%= s.getId() %>">
                                <input type="submit" class="btn btn-warning" value="Rezervisi">
                            </form>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                    else if(korisnik.getTipKorisnika().equals("Menadzer") || korisnik.getTipKorisnika().equals("Administrator") )
                    {
                        for(Soba s : sobe)
                        {
                %>
                <div class="col-4">
                    <div class="card-deck bg-info rounded  " style="width: 250px;">
                        <img src="<%= s.getSlika() %>"  height="150px" width="300px" alt="Nije moguce ucitati sliku">
                        <div class="card-body">
                            <p class="card-text">
                                <%= s.getOpis()%><br>
                                Broj slobodnih soba: <%= s.getSlobodneSobe() %><br>
                                Cena nocenja: <%= s.getCena() %>
                            </p>
                            <form action="izmenaIbrisanjeSoba" method="post" >
                                <input type="hidden" name="idSobe" value="<%= s.getId() %>">
                                 <input type="hidden" name="idHotela" value="<%= s.getIdHotela()%>">
                                <input type="submit" class="btn btn-light" name="akcija" value="Izmeni">
                                <input type="submit" class="btn btn-danger" name="akcija" value="Obrisi">
                            </form>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>                    
        <script type="text/javascript" src="js/bootstrap.bundle.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
