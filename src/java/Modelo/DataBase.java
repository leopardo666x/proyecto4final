package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBase {

    private final String BD_DRIVER = "com.mysql.jdbc.Driver";
    private final String BD_CONEXION = "jdbc:mysql://unmpnzzilsxy6uf7:y2Ca4f2CrpZJlrSGyEN0@bgrbrf8kbzh6mbax9m85-mysql.services.clever-cloud.com:3306/bgrbrf8kbzh6mbax9m85";
    //jdbc:mysql://localhost/db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
    //jdbc:mysql://localhost:3306/ProyectoSeñals?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
    private final String USUARIO = "unmpnzzilsxy6uf7";
    private final String PASSWORD = "y2Ca4f2CrpZJlrSGyEN0";

    public Connection getBDConexion() {
        Connection bdCon = null;

        try {
            Class.forName(BD_DRIVER);
            bdCon = DriverManager.getConnection(BD_CONEXION, USUARIO, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("Error al cargar el driver");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error al conectarse a la BD");
            System.out.println(e.getMessage());
        }

        return bdCon;
    }

    public void cerrarConexion(Connection conn, PreparedStatement ps, Statement st) {

        try {

            if (conn != null) {
                conn.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (st != null) {
                st.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexion a la BD");
        }

    }

}