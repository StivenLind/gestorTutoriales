<%-- 
    Document   : categoria
    Created on : 21 abr. 2024, 18:44:46
    Author     : cuati
--%>
<%@page import="com.mycompany.gestor_tutoriales.GestionarTutoriales"%>
<%@page import="com.mycompany.gestor_tutoriales.Tutorial"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.gestor_tutoriales.Categoria"%>
<%@page import="com.mycompany.gestor_tutoriales.GestorCategoria"%>
<%@include file="templates/header.jsp" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
    <h1>.</h1>

    <meta charset="UTF-8">
    <title>Agregar Categoría</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="templates/styleI.css">
</head>
<body>


<body>
    <%
        GestorCategoria conexion = new GestorCategoria();
        List<Categoria> categorias = conexion.listarCategorias();
    %>
    <div class="container d-flex flex-column align-items-center">
        <h1>Categorias</h1>
        <h2>Categorias Disponibles</h2>
        <table class="table">
            <thead>
            <th scope="col">Id</th>         
            <th scope="col">Nombre</th>
            <th scope="col">Accion</th>
            </thead>
            <tbody>
                <% for (Categoria categoria : categorias) {%>             

                <tr>
                    <td><%= categoria.getIdCategoria()%></td>
                    <td><%= categoria.getNombreCategoria()%></td>                                        
                    <td>                  
                        <a href="#" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminarTareaModal" data-id="<%= categoria.getIdCategoria()%>">
                            <i class="fa-solid fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </div>
</body>
<div class="modal fade" id="eliminarTareaModal" tabindex="-1" aria-labelledby="eliminarTareaModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="eliminarTareaModalLabel">Confirmar eliminación</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ¿Estás seguro de que quieres eliminar este tutorial?
                <form id="eliminarForm" action="SvEliminarCategoria" method="POST">
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
<center><div class="container">
        <h2>Agregar Nueva Categoría</h2>
        <form action="AgregarCategoriaServlet" method="post">
            <div class="col-md-4">
                <label for="categoria" class="form-label">Nombre de la Categoría:</label>
                <input type="text" class="form-control" id="categoria" name="categoria" required>
                <div class="valid-feedback">
                    ¡Se ve bien!
                </div>
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">Agregar Categoría</button>
            </div>
        </form>
    </div></center>
<script>
            $('#eliminarTareaModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Botón que desencadenó el evento
                var idCategoria = button.data('id'); // Obtén el nombre del contacto desde data-nombre

                // Establecer el valor del campo oculto con el nombre del contacto
                $('#eliminar').val(idCategoria);
            });
</script>   

<script>
    function eliminarTutorial() {
        $('#eliminarForm').submit(); // Enviar el formulario al servlet
    }
       </script>
</html>
 <%@include file="templates/footer.jsp" %> 

