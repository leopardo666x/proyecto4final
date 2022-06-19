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
        <title>REGISTRO VOLUNTARIO</title>
        <link rel="stylesheet" type="text/css" href="CSS/Registro.css">
    </head>
    <body>

        <div>
            <form autocomplete="off" novalidate="novalidate" action="SRegistroVoluntario" method="post" class="bonito">
                <center><font color="#000" size="6">Datos generales</font></center>
                <hr style="color: #ff6550;" width="95%" /><br><br>
                <label>Nombres:</label>
                <input type="text" name="nombres" required >

                <label>Telefono: </label>
                <input type="text" name="telefono" required onkeypress="return solonumeros()(event)">

                <label>Contraseña:</label>
                <input type="password" name="contrasena1" required >
                
                <label>Confirmar contraseña:</label>
                <input type="password" name="contrasena2" required >

                <input type="submit" value="SIGUIENTE" class="botooon">
            </form>
        </div>
        <hr style="color: #DCDCDC;" width="75%" />
        <div style="    display:flex; align-items: center; ">
            <input style =" width: 300px;"type="button" value="REGRESAR" OnClick="location.href = 'indexVoluntario.jsp'" class="regres">
        </div>
        <p  align="center"></p></center>
</body>
</html>
