<%-- 
    Document   : rezSobe
    Created on : Aug 5, 2019, 4:54:54 PM
    Author     : jocas
--%>

<%@page import="binovi.Soba"%>
<%@page import="binovi.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/stil.css">
        <title>Rezrvacija sobe</title>
    </head>
    <body style="background-image: url(Slike/pozadina.jpg)">
        
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
                        <a href="listaHotela" class="btn btn-secondary btn-lg ml-4">Hoteli</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-secondary btn-lg ml-4 btn-warning" href="registracija.jsp">Registruj se</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-secondary btn-lg ml-4 btn-light" href="logovanje.jsp">Uloguj se</a>
                    </li>
                    <%
                        }
                   
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
                    <%}%>
                </ul>
            </div>
        </nav>
        <% 
            Soba izabranaSoba = (binovi.Soba)request.getAttribute("opisSobe");
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    
                </div>
                <div class="media col-md-8 card-header bg-info shadow p-3 mb-5 mt-5 rounded text-white">
                    <img src="<%= izabranaSoba.getSlika() %>" height="400" width="500" class="align-self-center mr-3" alt="Nije moguce ucitati sliku">
                    <div class="media-body">
                        <h5 class="mt-0"><%= izabranaSoba.getTipSobe() %></h5>
                        <p><%= izabranaSoba.getOpis() %></p>
                        <form action="proveraRezervacije" method="post">
                            <p>Broj slobodnih soba: <%= izabranaSoba.getSlobodneSobe() %></p>
                            <p>Cena nocenja: <%= izabranaSoba.getCena() %></p>
                            <p>Izaberite datum polaska: <br><input type="date" name="datumDolaska"></p>
                            <p>Izaberite datum odlaska: <br><input type="date" name="datumOdlaska"></p>
                           
                            <p><input type="hidden" name="slobodneSobe" value="<%= izabranaSoba.getSlobodneSobe()%>"></p>
                            <p><input type="hidden" name="cena" value="<%= izabranaSoba.getCena()%>"></p>
                            <p><input type="hidden" name="idHotela" value="<%= izabranaSoba.getIdHotela()%>"></p>
                            <p><input type="hidden" name="idSobe" value="<%= izabranaSoba.getId() %>"></p>
                            <p><input type="submit" name="akcija" value="Rezervisi" class="btn btn-warning btn-lg"></p>
                              <p><input type="submit" name="akcija" value="Rezervisi poenima" class="btn btn-warning btn-lg"></p>
                        </form>
                    </div>
                </div>
                <div class="col-md-2">
                    
                </div>
                <%
                    String msg = (String)request.getAttribute("msg");
                    if(msg != null)
                    {
                %>
                <%= msg %>
                <%
                    }
                %>
            </div>
        </div>
        <script type="text/javascript" src="js/bootstrap.bundle.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>

