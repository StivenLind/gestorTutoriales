<%-- 
    Document   : editar
    Created on : 22 abr. 2024, 18:06:10
    Author     : cuati
--%>
<%@page import="com.mycompany.gestor_tutoriales.GestionarTutoriales"%>
<%@page import="com.mycompany.gestor_tutoriales.Tutorial"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.gestor_tutoriales.GestorCategoria"%>
<%@page import="com.mycompany.gestor_tutoriales.Categoria"%>
<%@include file="templates/header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <h1>.</h1>
    <h1>°</h1>
         <%
    int idTutorial = Integer.parseInt(request.getParameter("idTutorial"));
    GestionarTutoriales gestor = new GestionarTutoriales();
    Tutorial tutorial = gestor.obtenerTutorialPorId(idTutorial);

    // Asegúrate de que GestorCategoria y Tutorial están correctamente importados
    GestorCategoria conexion = new GestorCategoria();
    List<Categoria> categorias = conexion.listarCategorias();
%>

    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
    </head>
    <body>
        <form class="row g-3" method="POST" action="SvEditarTutorial">
    <!-- Campo oculto para enviar el idTutorial al servlet -->
   

    <div class="col-md-4">
        <label for="validationServer01" class="form-label">Titulo:</label>
        <input type="text" class="form-control is-valid" id="validationServer01" name="titulo" value="<%= tutorial.getTitulo() %>" required>
        <div class="valid-feedback">
            ¡Se ve bien!
        </div>
    </div>

    <div class="col-md-4">
        <label for="validationServer03" class="form-label">URL:</label>
        <input type="text" class="form-control is-valid" id="validationServer03" name="url" value="<%= tutorial.getUrl() %>" required>
        <div class="valid-feedback">
            ¡Se ve bien!
        </div>
    </div>

    <div class="col-md-4">
        <label for="validationServer04" class="form-label">Prioridad (1-10):</label>
        <input type="number" class="form-control is-valid" id="validationServer04" name="prioridad" value="<%= tutorial.getPrioridad() %>" min="1" max="10" required>
        <div class="valid-feedback">
            ¡Se ve bien!
        </div>
    </div>

    <div class="col-md-4">
        <label for="validationServer05" class="form-label">Estado:</label>
        <select class="form-select is-valid" id="validationServer05" name="estado" required>
            <option value="por revisar" <%= "por revisar".equals(tutorial.getEstado()) ? "selected" : "" %>>Por Revisar</option>
            <option value="revisado" <%= "revisado".equals(tutorial.getEstado()) ? "selected" : "" %>>Revisado</option>
        </select>
        <div class="valid-feedback">
            ¡Se ve bien!
        </div>
    </div>

    <div class="col-md-4">
        <label for="Categoria" class="form-label">Categoría:</label>
        <select class="form-select" id="Categoria" name="Categoria" required>
            <option value="" hidden>Categoría</option>
            <% for (Categoria categoria : categorias) { %>
                <option value="<%= categoria.getIdCategoria() %>" <%= categoria.getIdCategoria() == tutorial.getIdCategoria()? "selected" : "" %>><%= categoria.getNombreCategoria() %></option>
            <% } %>
        </select>
        <div class="valid-feedback">
            ¡Se ve bien!
        </div>
    </div>

    <div class="col-12">
        <button class="btn btn-primary" type="submit">Editar Tutorial</button>
    </div>
</form> 
    </body>
</html>
<%@include file="templates/footer.jsp" %> 
