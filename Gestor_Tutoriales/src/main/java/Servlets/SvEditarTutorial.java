/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mycompany.gestor_tutoriales.GestionarTutoriales;
import com.mycompany.gestor_tutoriales.GestorCategoria;
import com.mycompany.gestor_tutoriales.Tutorial;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cuati
 */
@WebServlet(name = "SvEditarTutorial", urlPatterns = {"/SvEditarTutorial"})
public class SvEditarTutorial extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvEditarTutorial</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvEditarTutorial at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");

        // Obtener los parámetros del formulario de edición
        int idTutorial = Integer.parseInt(request.getParameter("nombre"));
        String titulo = request.getParameter("titulo");
        String url = request.getParameter("url");
        String estado = request.getParameter("estado");
        int prioridad = Integer.parseInt(request.getParameter("prioridad"));
        int categoriaId = Integer.parseInt(request.getParameter("Categoria"));

        // Llamar al método actualizarTutorial del controlador
        GestionarTutoriales gestionarTutoriales = new GestionarTutoriales();
        boolean actualizado = gestionarTutoriales.actualizarTutorial(idTutorial, titulo, url, estado, prioridad, categoriaId);

        if (actualizado) {
            response.getWriter().write("Tutorial actualizado correctamente.");
        } else {
            response.getWriter().write("No se pudo actualizar el tutorial.");
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
