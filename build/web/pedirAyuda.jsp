<%-- 
    Document   : pedirAyuda
    Created on : 17 jun. 2022, 19:43:18
    Author     : viced
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="Imagenes/logo.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="JavaScript/Validacion.js"></script>
        <title>PEDIR AYUDA</title>
        <%
            if(session.getAttribute("tipo") == null || session.getAttribute("nombre") == null){
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }  
            
            int tipo = (Integer)session.getAttribute("tipo");
            if(tipo == 1){
                request.getRequestDispatcher("inicioVoluntario.jsp").forward(request, response);
            }
        %>
        <link rel="stylesheet" type="text/css" href="CSS/Registro.css">
    </head>
    <body background="Imagenes/Rojo.jpg">

        <div>
            <form autocomplete="off" novalidate="novalidate" action="SPedirAyuda" method="post">
                <center><font color="#DCDCDC" size="6">Formulario de ayuda</font></center>
                <hr style="color: #DCDCDC;" width="95%" /><br><br>
                <label>Añade una descripcion de tu problema o solicitud</label>
                <textarea name="descripcion" required rows="4" cols="50">
                </textarea>
                <input type="input" name="id" hidden value="<%=session.getAttribute("nombre")%>">
                <input type="submit" value="PEDIR AYUDA" >
            </form>
        </div>
        <hr style="color: #DCDCDC;" width="75%" />
        <p align="center"><input type="button" value="REGRESAR" OnClick="location.href = 'inicioPersona.jsp'"></p></center>
</body>
</html>
