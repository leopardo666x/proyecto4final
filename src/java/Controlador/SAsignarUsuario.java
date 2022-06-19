package Controlador;

import Modelo.Procesos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SAsignarUsuario extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Procesos obj = new Procesos();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int id_solicitud = Integer.parseInt(request.getParameter("id_solicitud"));
        int id_voluntario = Integer.parseInt(request.getParameter("id_voluntario"));
        int bandera1 = obj.AsignarSolicitudVoluntario(id_solicitud, id_voluntario);
        int bandera2 = obj.AsignarSolicitudEstado(id_solicitud);
        if(bandera1 == 1 && bandera2 == 1){
            out.println("<script type='text/javascript'>");
            out.println("alert('Se asigno correctamente');");
            out.println("location='InicioVoluntario.jsp';");
            out.println("</script>");
        }else if(bandera1 == 0 && bandera2 == 0){
            out.println("<script type='text/javascript'>");
            out.println("alert('Error al asignar');");
            out.println("location='InicioVoluntario.jsp';");
            out.println("</script>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
