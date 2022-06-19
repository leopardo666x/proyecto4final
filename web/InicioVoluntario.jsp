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
            if (session.getAttribute("tipo") == null || session.getAttribute("numero") == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            int tipo = (Integer) session.getAttribute("tipo");
            if (tipo == 0) {
                request.getRequestDispatcher("inicioPersona.jsp").forward(request, response);
            }

            int id_voluntario = obj.BuscarVoluntario(session.getAttribute("numero").toString());
        %>  
    </head>
    <body background="Imagenes/Rojo.jpg">
    <br><center><font color="#DCDCDC" size="6">BIENVENIDO USUARIO: <%=session.getAttribute("numero")%></font></center><br>

    <form action="SCerrarSesion" method="post">
        <p align="right"> 
            <input type="submit" value="Cerrar sesion"> 
        </p>
    </form>
    <center><p><input type="button" value="¡PEDIR AYUDA!" OnClick="location.href = 'pedirAyuda.jsp'"></p></center><br>
            <%
                String descripcion, nombre, telefono, direccion;
                int estado, id_solicitud;
                DataBase db = new DataBase();
                Statement st = null;
                Connection con = null;
                ResultSet rs = null;
                String query = "SELECT s.id_solicitudes, s.descripcion, p.nombre, p.telefono, p.direccion, s.estado FROM solicitudes INNER JOIN solicitudes S, persona P WHERE s.id_persona = p.id_persona";
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
            <center><font color="#90A4AE" size="4">Nombre</font></center>
            </td>
            <td>
            <center><font color="#90A4AE" size="4">Telefono</font></center>
            </td>
            <td>
            <center><font color="#90A4AE" size="4">Direccion</font></center>
            </td>
            <td>
            <center><font color="#90A4AE" size="4">Estatus</font></center>
            </td>
            <td>
            <center><font color="#90A4AE" size="4">Accion</font></center>
            </td>
            </tr>
            <%
                try {
                    st = con.createStatement();
                    rs = st.executeQuery(query);
                    while (rs.next()) {
                        id_solicitud = rs.getInt("s.id_solicitudes");
                        descripcion = rs.getString("descripcion");
                        nombre = rs.getString("p.nombre");
                        telefono = rs.getString("telefono");
                        direccion = rs.getString("direccion");
                        estado = rs.getInt("estado");
                        String prov = "";
                        if (estado == 0) {
                            prov = "Sin asignar";
                        } else if (estado == 1) {
                            prov = "Asignada";
                        }
            %>
            <tr>
                <td>
            <center><font color="#F5F5F5" size="4"><%=descripcion%></font></center>
            </td>
            <td>
            <center><font color="#F5F5F5" size="4"><%=nombre%></font></center>
            </td>
            <td>
            <center><font color="#F5F5F5" size="4"><%=telefono%></font></center>
            </td>
            <td>
            <center><font color="#F5F5F5" size="4"><%=direccion%></font></center>
            </td>
            <td>
            <center><font color="#F5F5F5" size="4"><%=prov%></font></center>
            </td>
            <%
                if (estado == 0) {
            %>
            <td>
                <form action="SAsignarUsuario" method="post">
                    <div class="footer">
                        <center>
                            <input type="text" name="id_solicitud" value="<%=id_solicitud%>" hidden />
                            <input type="text" name="id_voluntario" value="<%=id_voluntario%>" hidden />
                            <input type="submit" name="submit" value="Asignarme la solicitud" class="button" />
                        </center>
                    </div>
                </form>
            </td>
            <%
            } else if (estado == 1) {
            %>
            <td>
                <form action="SAsignarUsuario" method="post">
                    <div class="footer">
                        <center>
                            <input type="text" name="id_solicitud" value="<%=id_solicitud%>" hidden />
                            <input type="text" name="id_voluntario" value="<%=id_voluntario%>" hidden />
                            <input type="submit" name="submit" value="Asignarme la solicitud" class="button" disabled />
                        </center>
                    </div>
                </form>
            </td>
            <%
                }
            %>

            </tr>
            <%
                    }
                } catch (SQLException e) {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    e.printStackTrace();
                }
            %>
        </table>
        <br><br>
    </center>

</body>
</html>
