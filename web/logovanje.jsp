<%-- 
    Document   : logovanje
    Created on : Aug 5, 2019, 5:32:31 PM
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
        <title>Ulogujte se</title>
    </head>
    <body style="background-image: url(Slike/pozadina.jpg)"  >
        <nav  class="navbar navbar-expand-lg  p-3 mb-2 bg-info float-right ">
          
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
                        <a class="btn btn-secondary btn-lg ml-4 btn-warning" href="registracija.jsp">Registruj se</a>
                    </li>
                </ul>
            
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
                    <form action="logovanje" method="post">
                        <div class="form-group">
                            <label style="font-weight: bold" >Korisnicko ime: </label>
                            <input required type="text" name="korisnicko" class="form-control" placeholder="Korisnicko ime">
                        </div>
                        <div class="form-group">
                          <label style="font-weight: bold">Lozinka: </label>
                          <input required type="password" name="lozinka" class="form-control" placeholder="Lozinka">
                        </div>
                        <input type="submit" class="btn btn-primary" value="Ulogujte se" >
                        <input type="reset" class="btn btn-primary" value="Resetuj" >
                    </form>
                </div>
                <div class="col-md-2">
                    
                </div>
        </div>
        <script type="text/javascript" src="js/bootstrap.bundle.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>

