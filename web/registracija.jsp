<%-- 
    Document   : registracija
    Created on : Aug 5, 2019, 8:54:32 PM
    Author     : jocas
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
              <link rel="stylesheet" href="css/stil.css">
        <title>Registracija</title>
    </head>
    <body style="background-image: url(Slike/pozadina.jpg)">
        <nav class="navbar navbar-expand-lg  p-3 mb-2 bg-info ">
          
                <ul class="navbar-nav  mt-2 " >
                    <li class="nav-item">
                        <a href="index.jsp">
                            <img src="Slike/logo.jpg" width="60" height="60" class="rounded-circle float-left" alt="Ne moze da se ucita logo">
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="listaHotela" class="btn btn-secondary btn-lg ml-4">Hoteli</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-secondary btn-warning btn-lg ml-4 btn-light" href="logovanje.jsp">Uloguj se</a>
                    </li>
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
                    
                    <form action="registracija" method="post">
                        
                        <div class="form-group">
                            <label style="font-weight: bold">Email</label>
                            <input name="email" type="email" class="form-control" >
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold">Korisničko ime: </label>
                            <input name="korisnickoIme" type="text" class="form-control" placeholder="Korisničko ime">
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold">Lozinka: </label>
                            <input name="sifra" type="password" class="form-control" placeholder="Lozinka">
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold">Potvrdi lozinku: </label>
                            <input name="potvrda" type="password" class="form-control" placeholder="Potvrda lozinke">
                        </div>
                        
                        <div class="form-group">
                            <label style="font-weight: bold">Telefon: </label>
                            <input name="telefon" type="text" class="form-control" placeholder="Broj telefona">
                        </div>
                        
                        <input type="submit" class="btn btn-primary" value="Registrujte se">
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

