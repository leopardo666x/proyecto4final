<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="Modelo.DataBase"%>
<%@page import="Modelo.Procesos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="Imagenes/logo.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INICIO ADULTO</title>
        <%
            Procesos obj = new Procesos();
            if (session.getAttribute("tipo") == null || session.getAttribute("nombre") == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            int tipo = (Integer) session.getAttribute("tipo");
            if (tipo == 1) {
                request.getRequestDispatcher("InicioVoluntario.jsp").forward(request, response);
            }

            int id_persona = obj.BuscarPersona(session.getAttribute("nombre").toString());
        %>  
    </head>
    <body background="Imagenes/Rojo.jpg">
    <br><center><font color="#DCDCDC" size="6">BIENVENIDO USUARIO: <%=session.getAttribute("nombre")%></font></center><br>

    <form action="SCerrarSesion" method="post">
        <p align="right"> 
            <input type="submit" value="Cerrar sesion"> 
        </p>
    </form>
    <center><p><input type="button" value="¡PEDIR AYUDA!" OnClick="location.href = 'pedirAyuda.jsp'"></p></center><br>
            <%
                String descripcion;
                int estado;
                DataBase db = new DataBase();
                PreparedStatement ps = null;
                Connection con = null;
                ResultSet rs = null;
                String query = "SELECT * FROM solicitudes WHERE id_persona = ?";
                con = db.getBDConexion();
            %>
    <br><br>
    <center><font color="#DCDCDC" size="6">Lista de solicitudes</font><br><br>           
        <table border="1" style="text-justify: ">
            <tr>
                <td>
            <center><font color="#90A4AE" size="4">Descripcion de solicitud</font></center>
            </td>
            <td>
            <center><font color="#90A4AE" size="4">Estatus</font></center>
            </td>
            </tr>
            <%
                try {
                    ps = con.prepareStatement(query);
                    ps.setInt(1, id_persona);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        descripcion = rs.getString("descripcion");
                        estado = rs.getInt("estado");
                        String prov = "";
                        if (estado == 0) {
                            prov = "Buscando voluntario";
                        } else if (estado == 1) {
                            prov = "Voluntario asignado";
                        }
            %>
            <tr>
                <td>
            <center><font color="#F5F5F5" size="4"><%=descripcion%></font></center>
            </td>
            <td>
            <center><font color="#F5F5F5" size="4"><%=prov%></font></center>
            </td>
            </tr>
            <%
                    }
                } catch (SQLException e) {
                    request.getRequestDispatcher("Error.jsp?id_error=3").forward(request, response);
                    e.printStackTrace();
                }
            %>
        </table>
        <br><br>
    </center>

</body>
</html>
