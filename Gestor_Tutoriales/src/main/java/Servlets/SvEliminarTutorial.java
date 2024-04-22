/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mycompany.gestor_tutoriales.GestionarTutoriales;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cuati
 */
@WebServlet(name = "SvEliminarTutorial", urlPatterns = {"/SvEliminarTutorial"})
public class SvEliminarTutorial extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Obtener el ID del tutorial de la solicitud
        int idTutorial = Integer.parseInt(request.getParameter("idTutorial"));
        
        // Llamar al método eliminarTutorial del controlador
        GestionarTutoriales gestionarTutoriales = new GestionarTutoriales();
        boolean eliminado = gestionarTutoriales.eliminarTutorial(idTutorial);
        
        if (eliminado) {
            response.getWriter().write("Tutorial eliminado correctamente.");
        } else {
            response.getWriter().write("No se pudo eliminar el tutorial.");
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
          // Obtener el ID del tutorial de la solicitud
    int idTutorial = Integer.parseInt(request.getParameter("nEliminar"));
    System.out.println("ID del tutorial a eliminar: " + idTutorial);
    
    // Llamar al método eliminarTutorial del controlador
    GestionarTutoriales gestionarTutoriales = new GestionarTutoriales();
    boolean eliminado = gestionarTutoriales.eliminarTutorial(idTutorial);
    
    if (eliminado) {
        response.getWriter().write("Tutorial eliminado correctamente.");
    } else {
        response.getWriter().write("No se pudo eliminar el tutorial.");
        
    }
    response.sendRedirect("tabla.jsp");
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
