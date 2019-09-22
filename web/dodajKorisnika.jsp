<%-- 
    Document   : dodajKorisnika
    Created on : Aug 1, 2019, 6:29:20 PM
    Author     : jocas
--%>

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
        <title>Dodaj korisnika</title>
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
                        
                    
                       if(korisnik.getTipKorisnika().equals("Administrator"))
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
                         } %>
             
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
                        %>
                    </h2>
                    <form action="dodajKorisnika" method="post">
                        
                        <div class="form-group">
                            <label style="font-weight: bold;">Korisnicko ime: </label>
                            <input name="korisnickoIme" type="text" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold;">Lozinka: </label>
                            <input name="lozinka" type="text" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold;">Email: </label>
                            <input name="email" type="email" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold;">Telefon </label>
                            <input name="telefon" type="text" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold;">Poeni </label>
                            <input type="text" name="poeni" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold;">Tip korisnika </label>
                            <select name="tipKorisnika" class="form-control">
                                <option value="Menadzer">Menadzer</option>
                                <option value="Administrator">Administrator</option>
                                <option value="Klijent">Klijent</option>
                            </select>
                        </div>
                        
                        <input type="submit" class="btn btn-primary" value="Dodaj korisnika">
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