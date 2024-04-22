/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mycompany.gestor_tutoriales.GestionarTutoriales;
import com.mycompany.gestor_tutoriales.Tutorial;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "SvagregarTutorial", urlPatterns = {"/SvagregarTutorial"})
public class SvagregarTutorial extends HttpServlet {

   GestionarTutoriales gestionar = new GestionarTutoriales();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
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
       
        gestionar.establecerConexion();
        
        String Nombre = request.getParameter("titulo");
        String URL = request.getParameter("url");
        String Estado = request.getParameter("estado");
               
        int Prioridad = Integer.parseInt(request.getParameter("prioridad"));
        System.out.println(Prioridad);
        
        int Idcategoria = Integer.parseInt(request.getParameter("Categoria"));
                
        Connection establecerConexion =gestionar.establecerConexion();
        
        gestionar.AgregarTutorial(Nombre, URL, Estado, Prioridad, Idcategoria, establecerConexion);
        response.sendRedirect("index.jsp");
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
