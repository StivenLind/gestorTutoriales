<%-- 
    Document   : index.jsp
    Created on : 12/04/2024, 8:02:44 a. m.
    Author     : Lenovo
--%>
<%@page import="com.mycompany.gestor_tutoriales.Categoria"%>
<%@page import="com.mycompany.gestor_tutoriales.GestorCategoria"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.gestor_tutoriales.Tutorial"%>
<%@page import="com.mycompany.gestor_tutoriales.GestionarTutoriales"%>
<%@page import="java.sql.Connection"%>
<%@include file="templates/header.jsp" %>     
<!DOCTYPE html>
<html lang="en">  
    <%GestorCategoria conexion = new GestorCategoria();
        List<Categoria> categorias = conexion.listarCategorias();
    %>
    <h1>.</h1>
    <h1></h1>
    <body id="page-top">           
        <!-- Header-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
                <div class="d-flex justify-content-center">
                    <div class="text-center">
                        <h1 class="mx-auto my-0 text-uppercase">AGREGAR UN TUTORIAL</h1>
                        
                        
                    </div>
                </div>
            </div>
        </header>
        <!-- Content section 1-->

    </section>
    <!-- Content section 2-->
    <section>
        <header>
            <center><h1 class="animate__animated directory-title"> AGREGAR UN TUTORIAL </h1></center> 
        </header>
        <form class="row g-3" method="POST" action="SvagregarTutorial">
            <div class="col-md-4">
                <label for="validationServer01" class="form-label">Titulo:</label>
                <input type="text" class="form-control is-valid" id="validationServer01" name="titulo" required>
                <div class="valid-feedback">
                    ¡Se ve bien!
                </div>
            </div>

            <div class="col-md-4">
                <label for="validationServer03" class="form-label">URL:</label>
                <input type="text" class="form-control is-valid" id="validationServer03" name="url" required>
                <div class="valid-feedback">
                    ¡Se ve bien!
                </div>
            </div>

            <div class="col-md-4">
                <label for="validationServer04" class="form-label">Prioridad (1-10):</label>
                <input type="number" class="form-control is-valid" id="validationServer04" name="prioridad" min="1" max="10" required>
                <div class="valid-feedback">
                    ¡Se ve bien!
                </div>
            </div>

            <div class="col-md-4">
                <label for="validationServer05" class="form-label">Estado:</label>
                <select class="form-select is-valid" id="validationServer05" name="estado" required>
                    <option value="por revisar">Por Revisar</option>
                    <option value="revisado">Revisado</option>
                </select>
                <div class="valid-feedback">
                    ¡Se ve bien!
                </div>
            </div>

            <div class="col-md-4">
                <label for="Categoria" class="form-label">Categoría:</label>
                <select class="form-select" id="Categoria" name="Categoria" required>
                    <option value="" hidden>Categoría</option>
                    <% for (Categoria categoria : categorias) {%>
                    <option value="<%= categoria.getIdCategoria()%>"><%= categoria.getNombreCategoria()%></option>
                    <% }%>
                </select>
                <div class="valid-feedback">
                    ¡Se ve bien!
                </div>
            </div>

            <div class="col-12">
                <button class="btn btn-primary" type="submit">Agregar Tutorial</button>
            </div>
        </form>  

    </section>
      
</html>
