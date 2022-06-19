<%-- 
    Document   : Registro
    Created on : 27-abr-2017, 1:35:59
    Author     : MATA
--%>

<%@page import="java.sql.*"%>
<%@page import="Modelo.DataBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DataBase db = new DataBase();
%>
<html>
    <head>
        <link rel="shortcut icon" href="Imagenes/logo.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="JavaScript/Validacion.js"></script>
        <title>REGISTRO ADULTO</title>
        <link rel="stylesheet" type="text/css" href="CSS/Registro.css">
    </head>
    <body>

        <div>
            <form autocomplete="off" novalidate="novalidate" action="SRegistroPersna" method="post" class="bonito">
                <center><font color="#000" size="6">Datos generales</font></center>
                <hr style="color: #ff6550;" width="95%" /><br>
                <label>Nombres:</label>
                <input type="text" name="nombres" required >

                <label>Telefono: </label>
                <input type="text" name="telefono" required onkeypress="return solonumeros()(event)">

                <label>Direccion:</label>
                <input type="text" name="direccion" required >

                <input type="submit" value="SIGUIENTE" class="botooon" >
            </form>
        </div>
        <hr style="color: #DCDCDC;" width="75%" />
        <p align="center"><input type="button" value="REGRESAR" OnClick="location.href = 'indexPersona.jsp'" class="regres"></p>
</body>
</html>
