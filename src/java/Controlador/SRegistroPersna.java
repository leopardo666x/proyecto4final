package Controlador;

import Modelo.Procesos;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.server.ObjID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SRegistroPersna extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Procesos obj = new Procesos();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String nombres = request.getParameter("nombres");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");

        if (nombres.equalsIgnoreCase("") && telefono.equalsIgnoreCase("") && direccion.equalsIgnoreCase("")) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Campos sin completar');");
            out.println("location='indexPersona.jsp';");
            out.println("</script>");
        } else {
            int retorno = obj.RegistrarPersona(nombres, telefono, direccion);
            if (retorno == 0) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Error al registrar a la persona');");
                out.println("location='indexPersona.jsp';");
                out.println("</script>");
            } else if (retorno == 1) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Persona registrada correctamente');");
                out.println("location='indexPersona.jsp';");
                out.println("</script>");
            }
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
