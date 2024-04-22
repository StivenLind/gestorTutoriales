<%-- 
    Document   : categoria
    Created on : 21 abr. 2024, 18:44:46
    Author     : cuati
--%>
<%@include file="templates/header.jsp" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
<head>
    <h1>.</h1>
    <h1>°</h1>
    <link rel="stylesheet" href="templates/styleC.css">
    <meta charset="UTF-8">
    <title>Agregar Categoría</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

<div class="container">
    <h2>Agregar Nueva Categoría</h2>
    <form action="AgregarCategoriaServlet" method="post">
        <div class="form-group">
            <label for="categoria">Nombre de la Categoría:</label>
            <input type="text" id="categoria" name="categoria" required>
        </div>
        <button type="submit" class="btn">Agregar Categoría</button>
    </form>
</div>

</body>
</html>
<%@include file="templates/footer.jsp" %> 

