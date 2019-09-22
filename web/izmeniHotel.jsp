<%-- 
    Document   : izmeniHotel
    Created on : Aug 2, 2019, 4:39:04 PM
    Author     : jocas
--%>

<%@page import="binovi.Hotel"%>
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
        <title>Izmena hotela</title>
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
                        
                        if(korisnik.getTipKorisnika().equals("Menadzer"))
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
                            <%=msg%>
                        <%
                            }
                            ArrayList<Korisnik> listaMenadzera = (ArrayList<Korisnik>)request.getAttribute("listaMenadzera");
                            Hotel hotel = (Hotel)request.getAttribute("hotel");
                        %>
                    </h2>
                    <form action="izmeniHotel" method="post">
                        
                            <input name="idHotela" type="hidden" class="form-control" value="<%= hotel.getId() %>">
                        
                        
                        <div class="form-group">
                            <label style="font-weight: bold;">Naziv hotela: </label>
                            <input name="nazivHotela" type="text" class="form-control" value="<%= hotel.getNaziv()%>">
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold;">Adresa: </label>
                            <input name="adresa" type="text" class="form-control" value="<%= hotel.getAdresa()%>">
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold;">Telefon: </label>
                            <input name="telefon" type="text" class="form-control" value="<%= hotel.getTelefon()%>">
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold;">Opis: </label>
                            
                            <textarea name="opis" class="form-control" cols="40" maxlength="400"><%= hotel.getOpis()%></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold;">Menadzer ID </label>
                            <select name="menadzerId" class="form-control">
                                <%
                                    if(listaMenadzera != null)
                                    {
                                        for(Korisnik k : listaMenadzera)
                                        {
                                %>
                                <option value="<%= k.getId() %>" class="form-control"><%= k.getKorisnickoIme() %></option>
                                <% 
                                        }
                                    }
                                    else
                                    {
                                %>
                                <option value="Nema rezultata">Nema rezultata</option>
                                <% } %>
                            </select>
                        </div>
                            <div>
                           <input type="text" readonly value="<%= hotel.getSlika()%>">
                            </div>
                        <div class="form-group">
                            <label style="font-weight: bold;">Slika: </label>
                            <input type="file" name="slika" class="form-control-file" >
                        </div>
                        
                        <input type="submit" class="btn btn-primary" value="Sacuvaj promene">
                        <input type="reset" class="btn btn-danger" value="Resetuj">
                  </form>
                </div>
                <div class="col-md-2">
                    
                </div>
            </div>
        </div>
        <script type="text/javascript" src="js/bootstrap.bundle.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
