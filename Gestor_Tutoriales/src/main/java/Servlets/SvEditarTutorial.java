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
        // Asumiendo que también tienes parámetros como 'titulo', 'url', etc.
        String titulo = request.getParameter("titulo");
        String url = request.getParameter("url");
        String estado = request.getParameter("estado");
        String prioridadStr = request.getParameter("prioridad");
        String categoriaIdStr = request.getParameter("Categoria");
        String tutorialIdStr = request.getParameter("tutorialId"); // Asumiendo que tienes un campo oculto para el ID en el formulario

        // Validar que los parámetros necesarios no son nulos o vacíos
        if (titulo == null || url == null || estado == null || prioridadStr == null || categoriaIdStr == null || tutorialIdStr == null ||
            titulo.isEmpty() || url.isEmpty() || estado.isEmpty() || prioridadStr.isEmpty() || categoriaIdStr.isEmpty() || tutorialIdStr.isEmpty()) {
            request.setAttribute("error", "Todos los campos son obligatorios.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        try {
            int prioridad = Integer.parseInt(prioridadStr);
            int categoriaId = Integer.parseInt(categoriaIdStr);
            int tutorialId = Integer.parseInt(tutorialIdStr);

            // Asumiendo que tienes una clase para gestionar los tutoriales
            GestionarTutoriales gestionarTutoriales = new GestionarTutoriales();
            boolean resultado = gestionarTutoriales.actualizarTutorial(tutorialId, titulo, url, estado, prioridad, categoriaId);

            if (resultado) {
                response.sendRedirect("tabla.jsp");
            } else {
                request.setAttribute("error", "No se pudo actualizar el tutorial.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "La prioridad, categoría y ID del tutorial deben ser números válidos.");
           
        } catch (Exception e) {
            request.setAttribute("error", "Error al actualizar el tutorial: " + e.getMessage());       
        }
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
