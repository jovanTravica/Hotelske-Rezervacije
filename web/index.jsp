<%-- 
    Document   : index
    Created on : Aug 3, 2019, 2:33:08 PM
    Author     : jocas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="binovi.Korisnik" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/stil.css">
        <title>Pocetna strana</title>
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
                    <%    }

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
                           <li class="nav-item">
                        <a href="inputHotel" class="btn btn-secondary btn-lg ml-4">Dodaj hotel</a>
                    </li>
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
                <div class="col-md-2">
                    
                </div>
                <div class="col-md-8">
                    <div class="card text-center border-secondary" style="top:5%;background-color: rgba(255,255,255,0);border-width: 0px ">
                        <%
                            String msg = (String)request.getAttribute("msg");
                            if(msg != null)
                            {
                        %>
                        <h2><%= msg %></h2>
                        <% } %>
                        <div class="card-header" style="background-color: rgba(255,255,255,0);border-width: 0px">
                            
                        </div>
                        <div class="card-body">
                         
                            <h2 class="text-warning">Royal Tulip</h2>
                                <p class="text-warning">
                           Royal Tulip je lanac lukszuznih hotela. Svi hotela su sa 5 zvezdica, 
                           i svi su imaju najprestiznije nagrade. Nas moto je "Kod nas se osecate kao kralj".
                                </p>
                                
                            
                        </div>
                        <br> <br>
                        <div>
                    <img src="Slike/nagrada.jpg" width="100" height="100"  "> 
                    <img src="Slike/nagrada1.jpg" width="100" height="100" class="ml-5 "> 
                    <img src="Slike/nagrada2.jpg" width="100" height="100" class="rounded-circle ml-5">
                     <img src="Slike/about_2.png"  height="100" class="rounded-circle ml-5">
                        </div>
                    </div>
                        <br><br><br>   <br><br><br>   <br><br><br>
                </div>
                <div class="col-md-2">
                    
                </div>
            </div>
        </div>
        <script type="text/javascript" src="js/bootstrap.bundle.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
