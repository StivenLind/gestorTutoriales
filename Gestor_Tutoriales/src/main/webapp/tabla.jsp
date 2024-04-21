<%-- 
    Document   : tabla
    Created on : 21 abr. 2024, 12:07:50
    Author     : cuati
--%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.gestor_tutoriales.Tutorial"%>
<%@page import="com.mycompany.gestor_tutoriales.GestionarTutoriales"%>
<%@include file="templates/header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <body>
        <% GestionarTutoriales gestoTuto = new GestionarTutoriales();
           List<Tutorial> tutoriales = gestoTuto.listarTutoriales();
        %>
      <div class="container d-flex flex-column align-items-center">
         
                <h1>Tutoriales</h1>
                <h2>pagina de tutoriales</h2>
                <table class="table">
                    <thead>
                    <th scope="col">Titulo</th>
                    <th scope="col">url</th>
                    <th scope="col">prioridad</th>
                    <th scope="col">estado</th>
                    <th scope="col">ver</th>
                    </thead>
                    <tbody>


                        <tr>
                            <%                                       
                                for (Tutorial tutorial : tutoriales) {
                            %>
                        <tr>


                            <td><%= tutorial.getTitulo()%></td>
                            <td><%= tutorial.getUrl()%></td>
                            <td><%= tutorial.getPrioridad()%></td>
                            <td><%= tutorial.getEstado()%></td>
                            <td><a href="#" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-nombre="<%= tutorial.getIdTutorial()%>"><i class="fa-solid fa-eye"></i></a>
                                <a href="#" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editarModal" data-nombre="<%= tutorial.getIdTutorial()%>"><i class="fa-solid fa-pencil"></i></a>
                                <a href="#" type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminarTareaModal" data-nombre="<%= tutorial.getIdTutorial()%>"><i class="fa-solid fa-trash"></i></a></td>
                        </tr>
                        <% } %>
                        </tr>
                    </tbody>
                </table>
            </div>
    </body>

        
  
    <%@include file="templates/footer.jsp" %> 
</html>
