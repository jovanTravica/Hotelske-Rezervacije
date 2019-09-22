<%-- 
    Document   : potvrdaRez
    Created on : Aug 2, 2019, 10:53:49 PM
    Author     : jocas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="binovi.Rezervacija"%>
<%@page import="binovi.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/stil.css">
        <title>Potvrda rezervacije</title>
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
                        <a class="btn btn-secondary btn-lg ml-4" href="registracija.jsp">Registruj se</a>
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
                    <%}%>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    
                </div>
                <div class="col-md-8">
                    <h2 align="center">
                        <%
                            String msg = (String)request.getAttribute("msg");
                            if(msg != null)
                            {
                        %>
                            <%= msg %>
                        <%
                            }
                        %>
                    </h2>
                    <%
                        Rezervacija rezervacija = (Rezervacija)request.getSession().getAttribute("rezervacija");
                        if(rezervacija != null)
                        {
                    %>
                    <div class="card text-center ">
                        <div class="card-header">
                            Potvrda rezervacije hotelske sobe
                        </div>
                        <div class="card-body">
                            <form action="potvrdaRezervacije" method="post">
                                <div class="text-center ">
                                    <p>Cena vase rezervacije iznosi: <%= rezervacija.getCenaRezervacije() %></p>
                                    <p>
                                        <h2>Da li zelite da potvrdite Vasu rezervaciju?</h2>
                                    </p>
                                    <p>
                                        <input type="submit" value="Rezervisi" class="btn btn-warning btn-lg">
                                    </p>
                                </div>
                            </form>
                        </div>
                    </div>
                    <% } %>
                <div class="col-md-2">
                    
                </div>
            </div>
        </div>
        <script type="text/javascript" src="js/bootstrap.bundle.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>

