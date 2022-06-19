<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="Imagenes/logo.ico"/>
        <link rel="stylesheet" type="text/css" href="CSS/Index.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="JavaScript/Validacion.js"></script>
        <script type="text/javascript" src="JavaScript/Correo.js"></script>
        <title>INICIO</title>
    </head>
    <body>
      <div class="wrapperindex">
        <form name="login-form" id="login-form" class="login-form" autocomplete="off">

            <div class="header"><img src="https://i.imgur.com/CjfUIUe.jpg"/>
            </div>

            <div class="content">
                <center><font color="#000000" size="3">Selecciona el tipo de usuario con el que deseas ingresar</font></center>
            </div>

            <div class="footer">
                <input type="button" name="submit" value="Adulto" class="register" OnClick="location.href = 'indexPersona.jsp'"/>
                <input type="button" name="submit" value="Voluntario" class="register" OnClick="location.href = 'indexVoluntario.jsp'"/>
            </div>

        </form>

    </div>
</body>
</html>