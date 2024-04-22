<%-- 
    Document   : tabla
    Created on : 21 abr. 2024, 12:07:50
    Author     : cuati
--%>
<%@page import="com.mycompany.gestor_tutoriales.Categoria"%>
<%@page import="com.mycompany.gestor_tutoriales.GestorCategoria"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.gestor_tutoriales.Tutorial"%>
<%@page import="com.mycompany.gestor_tutoriales.GestionarTutoriales"%>
<%@include file="templates/header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
   <h1>.</h1>
   <h1>°</h1>
    <body>
      <% 
    GestionarTutoriales gestorTuto = new GestionarTutoriales();
    List<Tutorial> tutoriales = gestorTuto.listarTutoriales();
%>
<div class="container d-flex flex-column align-items-center">
    <h1>Tutoriales</h1>
    <h2>Página de tutoriales</h2>
    <table class="table">
        <thead>
            <th scope="col">Titulo</th>
            <th scope="col">URL</th>
            <th scope="col">Prioridad</th>
            <th scope="col">Estado</th>
            <th scope="col">Categoría</th>
            <th scope="col">Ver</th>
        </thead>
        <tbody>
            <% for (Tutorial tutorial : tutoriales) { %>
            <tr>
                <td><%= tutorial.getTitulo()%></td>
                <td><%= tutorial.getUrl()%></td>
                <td><%= tutorial.getPrioridad()%></td>
                <td><%= tutorial.getEstado()%></td>
                <%
                    String categoria = gestorTuto.obtenerNombreCategoriaPorId(tutorial.getIdCategoria());
                %>
                <td><%= categoria %></td>
                <td>
                    <a href="<%= tutorial.getUrl()%>" class="btn btn-primary" target="_blank">
                        <i class="fa-solid fa-eye"></i>
                    </a>                  
                    <a href="#" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editarModal" data-nombre="<%= tutorial.getIdTutorial()%>">
                        <i class="fa-solid fa-pencil"></i>
                    </a>
                    <a href="#" type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminarTareaModal" data-nombre="<%= tutorial.getIdTutorial()%>">
                        <i class="fa-solid fa-trash"></i>
                    </a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<% 
    GestorCategoria conexion = new GestorCategoria();
    List<Categoria> categorias = conexion.listarCategorias();
%>
<div class="modal fade" id="editarModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form class="row g-3" method="POST" action="SvEditarTutorial">
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
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
    $('.btn-outline-primary').on('click', function() {
        var tutorialId = $(this).data('id');
        // Aquí puedes hacer una llamada AJAX para obtener los datos del tutorial o usar datos ya disponibles en la página
        $.ajax({
            url: 'GetTutorialServlet', // Servlet que devuelve los datos del tutorial
            type: 'GET',
            data: {id: tutorialId},
            success: function(tutorial) {
                $('#validationServer01').val(tutorial.titulo);
                $('#validationServer03').val(tutorial.url);
                $('#validationServer04').val(tutorial.prioridad);
                $('#validationServer05').val(tutorial.estado);
                $('#Categoria').val(tutorial.categoriaId);
                // Configura la acción del formulario para actualizar
                $('form').attr('action', 'SvEditarTutorial?id=' + tutorialId);
            }
        });
    });
});
</script>

    <%@include file="templates/footer.jsp" %> 
</html>
