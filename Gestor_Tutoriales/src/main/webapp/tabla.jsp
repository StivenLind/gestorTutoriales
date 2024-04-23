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
                <th scope="col">Prioridad</th>
                <th scope="col">Estado</th>
                <th scope="col">Categoría</th>
                <th scope="col">Ver</th>
                </thead>
                <tbody>
                    <% for (Tutorial tutorial : tutoriales) {%>
                    <tr>
                        <td><%= tutorial.getTitulo()%></td>
                        <td><%= tutorial.getPrioridad()%></td>
                        <td><%= tutorial.getEstado()%></td>
                        <%
                            String categoria = gestorTuto.obtenerNombreCategoriaPorId(tutorial.getIdCategoria());
                        %>
                        <td><%= categoria%></td>
                        <td>
                            <a href="<%= tutorial.getUrl()%>" class="btn btn-primary" target="_blank">
                                <i class="fa-solid fa-eye"></i>
                            </a>                  
                           <a href="editar.jsp?idTutorial=<%= tutorial.getIdTutorial() %>" type="button" class="btn btn-outline-primary">
                             <i class="fa-solid fa-pencil"></i>
                           </a>


                            <a href="#" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminarTareaModal" data-id="<%= tutorial.getIdTutorial()%>">
                                <i class="fa-solid fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div class="modal fade" id="eliminarTareaModal" tabindex="-1" aria-labelledby="eliminarTareaModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="eliminarTareaModalLabel">Confirmar eliminación</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ¿Estás seguro de que quieres eliminar este tutorial?
                        <form id="eliminarForm" action="SvEliminarTutorial" method="POST">
                            <input type="hidden" id="eliminar" name="nEliminar">
                             </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <!-- Botón para eliminar con JavaScript -->
                        <button type="button" class="btn btn-danger" onclick="eliminarTutorial()">Eliminar</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('#eliminarTareaModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Botón que desencadenó el evento
                var idTutorial = button.data('id'); // Obtén el nombre del contacto desde data-nombre

                // Establecer el valor del campo oculto con el nombre del contacto
                $('#eliminar').val(idTutorial);
            });
        </script>   

        <script>
            function eliminarTutorial() {
                $('#eliminarForm').submit(); // Enviar el formulario al servlet
            }
        </script>
            <%@include file="templates/footer.jsp" %> 
</html>
