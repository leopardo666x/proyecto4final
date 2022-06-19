<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="Imagenes/logo.ico"/>
        <link rel="stylesheet" type="text/css" href="CSS/Index.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="JavaScript/Validacion.js"></script>
        <script type="text/javascript" src="JavaScript/Correo.js"></script>
        <title>INDEX voluntario</title>
    </head>
    <body>
        <div id="wrapper">
        <form name="login-form" id="login-form" class="login-form" action="SIniciarSesionVoluntario" method="post" autocomplete="off">

            <div class="header">
                <img style="width: 150px;" src="Imagenes/voluntariado.jpg"/>
    
                <h1>Inicio de sesion</h1>
                <span>Ingrese su numero y contraseña</span>
            </div>

            <div class="content">
                <input type="text" name="correo" required  class="input username" placeholder="Numero"/>
                <div class="user-icon"></div>
                <input type="password" name="contrasena" required  class="input password" placeholder="Contraseña" />
                <div class="pass-icon"></div>		
            </div>

            <div class="footer">
                <input type="submit" name="submit" value="Ingresar" class="button"/>
                <input type="button" name="submit" value="Registrar" class="register" OnClick="location.href = 'registroVoluntario.jsp'"/>
            </div>
        </form>
        <form action="index.jsp" name="login-form" id="login-form" class="login-forma2">
            <div class="abajo">
                <center>
                    <input type="submit" name="submit" value="Regresar al inicio" class="inicio" />
                </center>
            </div>
        </form>
    </div>
</body>
</html>