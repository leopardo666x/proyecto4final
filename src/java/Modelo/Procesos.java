package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Procesos {
    DataBase db = new DataBase();
    
    public int InicioSesionPersona(String nombres, String telefono) {
        int privilegio = 0;

        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;
        String query = "SELECT id_persona FROM persona WHERE nombre = ? AND telefono = ?";
        con = db.getBDConexion();
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, nombres);
            ps.setString(2, telefono);
            rs = ps.executeQuery();
            while (rs.next()) {
                privilegio = rs.getInt("id_persona");
            }
        } catch (SQLException e) {
            System.out.println("Error al preparar la sentencia");
            e.printStackTrace();
        }
        return privilegio;
    }
    
    public int InicioSesionVoluntario(String numero, String password) {
        int privilegio = 0;

        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;
        String query = "SELECT id_voluntario FROM voluntario WHERE telefono = ? AND password = ?";
        con = db.getBDConexion();
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, numero);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                privilegio = rs.getInt("id_voluntario");
            }
        } catch (SQLException e) {
            System.out.println("Error al preparar la sentencia");
            e.printStackTrace();
        }
        return privilegio;
    }
    
    public int RegistrarPersona(String nombre, String telefono, String direccion) {
        int bandera = 1;

        String nombres = nombre.toUpperCase();
        String direccionM = direccion.toUpperCase();

        PreparedStatement ps = null;
        Connection con = null;
        StringBuilder query = new StringBuilder("INSERT INTO persona (nombre, telefono, direccion) VALUES (");
        query.append(" '" + nombres + "' " + " ,");
        query.append(" '" + telefono + "' " + " ,");
        query.append(" '" + direccionM + "' " + " )");

        try {
            con = db.getBDConexion();
            ps = con.prepareStatement(query.toString());
            ps.executeUpdate();
        } catch (SQLException e) {
            bandera = 0;
            System.out.println("Error al insertar usuario " + e.getMessage());
        }

        return bandera;
    }
    
    public int RegistrarVoluntario(String nombre, String telefono, String contrasena) {
        int bandera = 1;

        String nombres = nombre.toUpperCase();

        PreparedStatement ps = null;
        Connection con = null;
        StringBuilder query = new StringBuilder("INSERT INTO voluntario (nombre, telefono, password) VALUES (");
        query.append(" '" + nombres + "' " + " ,");
        query.append(" '" + telefono + "' " + " ,");
        query.append(" '" + contrasena + "' " + " )");

        try {
            con = db.getBDConexion();
            ps = con.prepareStatement(query.toString());
            ps.executeUpdate();
        } catch (SQLException e) {
            bandera = 0;
            System.out.println("Error al insertar usuario " + e.getMessage());
        }

        return bandera;
    }
    
    public int BuscarPersona(String nombre) {
        int id = 0;

        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;
        String query = "SELECT id_persona FROM persona WHERE nombre = ?";
        con = db.getBDConexion();
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, nombre);
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id_persona");
            }
        } catch (SQLException e) {
            System.out.println("Error al preparar la sentencia");
            e.printStackTrace();
        }
        return id;
    }
    
    public int RegistrarSolicitud(int id, String descripcion) {
        int bandera = 1;
        
        String descripciondespues = descripcion.toUpperCase();
        PreparedStatement ps = null;
        Connection con = null;
        StringBuilder query = new StringBuilder("INSERT INTO solicitudes (id_persona, descripcion, estado) VALUES (");
        query.append(" '" + id + "' " + " ,");
        query.append(" '" + descripciondespues + "' " + " ,");
        query.append(" '0' " + " )");

        try {
            con = db.getBDConexion();
            ps = con.prepareStatement(query.toString());
            ps.executeUpdate();
        } catch (SQLException e) {
            bandera = 0;
            System.out.println("Error al insertar usuario " + e.getMessage());
        }

        return bandera;
    }
    
    public int BuscarVoluntario(String numero) {
        int id = 0;

        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;
        String query = "SELECT id_voluntario FROM voluntario WHERE telefono = ?";
        con = db.getBDConexion();
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, numero);
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id_voluntario");
            }
        } catch (SQLException e) {
            System.out.println("Error al preparar la sentencia");
            e.printStackTrace();
        }
        return id;
    }
    
    public int AsignarSolicitudVoluntario(int id_solicitud, int id_voluntario) {
        int bandera = 1;
        
        PreparedStatement ps = null;
        Connection con = null;
        StringBuilder query = new StringBuilder("UPDATE solicitudes ");
        query.append("SET id_voluntario = '" + id_voluntario + "' ");
        query.append("WHERE id_solicitudes  = " + id_solicitud + " ");
        try {
            con = db.getBDConexion();
            ps = con.prepareStatement(query.toString());
            ps.executeUpdate();
        } catch (SQLException e) {
            bandera = 0;
            System.out.println("Error al insertar usuario " + e.getMessage());
        }

        return bandera;
    }
    
    public int AsignarSolicitudEstado(int id_solicitud) {
        int bandera = 1;
        
        PreparedStatement ps = null;
        Connection con = null;
        StringBuilder query = new StringBuilder("UPDATE solicitudes ");
        query.append("SET estado = '1' ");
        query.append("WHERE id_solicitudes  = " + id_solicitud + " ");
        try {
            con = db.getBDConexion();
            ps = con.prepareStatement(query.toString());
            ps.executeUpdate();
        } catch (SQLException e) {
            bandera = 0;
            System.out.println("Error al insertar usuario " + e.getMessage());
        }

        return bandera;
    }
}
