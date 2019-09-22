<%-- 
    Document   : izmeniSobu
    Created on : Aug 3, 2019, 11:40:26 AM
    Author     : jocas
--%>

<%@page import="binovi.Soba"%>
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
        <title>Izmena sobe</title>
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
                            ArrayList<Hotel> listaHotela = (ArrayList<Hotel>)request.getAttribute("listaHotela");
                            ArrayList<Integer> listaTipova = (ArrayList<Integer>)request.getAttribute("listaTipova");
                            Soba sobaIzmena = (Soba)request.getAttribute("sobaIzmena");
                        %>
                    </h2>
                    <form action="izmeniSobu" method="post">
                            <input name="idSobe" type="hidden" class="form-control" value="<%= sobaIzmena.getId() %>">
                        <div class="form-group">
                            <label style="font-weight: bold">Hotel </label>
                           
                                <%
                                    if(listaHotela != null)
                                    {
                                        for(Hotel h : listaHotela)
                                        {
                                %>
                                <input name="idHotela" type="hidden" class="form-control" value="<%= h.getId() %>">
                                <input type="text" readonly class="form-control" value="<%= h.getNaziv() %>"></option>
                                <%
                                        }
                                    }
                                    else
                                    {
                                %>
                                <input type="text" readonly class="form-control">Nema rezultata</option>
                                <% } %>
                           
                        </div>
                        <div class="form-group">
                            <label style="font-weight: bold">Tip sobe: </label>
                            <select name="tipSobe" class="form-control">
                            <%
                                    if(listaTipova != null)
                                    {
                                        for(Integer i : listaTipova)
                                        {
                                            if(i==1)
                                            {
                                %>
                                <option class="form-control" value="<%= i %>">Jednokrevetna</option>
                                <%          }
                                          else if (i==2)
                                             { %>
                                          <option class="form-control" value="<%= i %>">Dvokrevetna</option>
                                          <% }
                                           else if (i==3)
                                             {
                                           %>
                                            <option class="form-control" value="<%= i %>">Trokrevetna</option>
                                            <%
                                            }
                                        }
                                    }
                                    else
                                    {
                                %>
                                <option class="form-control">Nema rezultata</option>
                                <% } %>
                            </select>
                        </div>
                            
                        <div class="form-group">
                            <label >Opis: </label>
                            <textarea cols="40" maxlength="400" class="form-control" name="opis"><%= sobaIzmena.getOpis() %></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label >Broj soba: </label>
                            <input type="text" name="brojSoba" class="form-control" value="<%= sobaIzmena.getUkupnoSoba()%>">
                        </div>
                        
                        <div class="form-group">
                            <label >Broj slobodnih soba: </label>
                            <input type="text" name="brojSlobodnihSoba" class="form-control" value="<%= sobaIzmena.getSlobodneSobe() %>">
                        </div>
                        
                        <div class="form-group">
                            <label>Cena nocenja: </label>
                            <input type="text" name="cena" class="form-control" value="<%= sobaIzmena.getCena()%>">
                        </div>
                          <div>
                           <input type="text" readonly value="<%= sobaIzmena.getSlika()%>">
                            </div>
                        <div class="form-group">
                            <label >Slika: </label>
                            <input type="file" name="slika" class="form-control">
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
