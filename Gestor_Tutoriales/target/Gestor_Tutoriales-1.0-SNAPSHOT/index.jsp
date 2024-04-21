<%-- 
    Document   : index.jsp
    Created on : 12/04/2024, 8:02:44 a. m.
    Author     : Lenovo
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.gestor_tutoriales.Tutorial"%>
<%@page import="com.mycompany.gestor_tutoriales.GestionarTutoriales"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>One Page Wonder - Start Bootstrap Template</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="templates/style.css">
        
        
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
            <div class="container px-5">
                <a class="navbar-brand" href="#page-top">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="#!">Sign Up</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Log In</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="masthead text-center text-white">
            <div class="masthead-content">
                <div class="container px-5">
                    <h1 class="masthead-heading mb-0">GESTOR DE TUTORIALES </h1>
                    <h2 class="masthead-subheading mb-0">Bienbenido al gestor de tutoriales </h2>
                    <a class="btn btn-primary btn-xl rounded-pill mt-5" href="#scroll">Learn More</a>
                </div>
            </div>
            <div class="bg-circle-1 bg-circle"></div>
            <div class="bg-circle-2 bg-circle"></div>
            <div class="bg-circle-3 bg-circle"></div>
            <div class="bg-circle-4 bg-circle"></div>
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
                        Looks good!
                    </div>
                </div>
                
                <div class="col-md-4">
                    <label for="validationServer03" class="form-label">URL:</label>
                    <input type="text" class="form-control is-valid" id="validationServer03" name="url" required>
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div>
                <div class="col-md-4">
                    <label for="validationServer04" class="form-label">Prioridad (1-10):</label>
                    <input type="num" class="form-control is-valid" id="validationServer04" name="prioridad" min="1" max="10" required>
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div>
                <div class="col-md-4">
                    <label for="validationServer05" class="form-label">Estado:</label>
                    <select class="form-select is-valid" id="validationServer05" name="estado" required>
                        <option value="por revisar">Por Revisar</option>
                        <option value="revisado">Revisado</option>
                    </select>
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div>
                <div class="col-12">
                    <button class="btn btn-primary" type="submit">Agregar Tutorial</button>
                </div>
            </form>
            
                        
            <center><h2>TUTORIALES DISPONIBLES </h2></center> 
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Titulo</th>
                        <th>Categoria</th>
                        <th>Url</th>
                        <th>Prioridad</th>
                        <th>Estado</th>
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Aquí puedes agregar filas con datos de tutoriales -->
                    <tr>
                        <% 
                         GestionarTutoriales tutorial = new GestionarTutoriales();
                         Connection con = tutorial.establecerConexion();
                         
                         ArrayList<Tutorial> tutoriales = new ArrayList<>();
                         
                         tutoriales = tutorial.obtenerTutoriales();
                         
                         StringBuilder html = tutorial.procesarArrayList(tutoriales);
                         
                         out.println(html);
                         
                        %>
                        <td colspan="5" align="center" valign="middle">No se han registrado tutoriales</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<script src="./static/js/scripts.js"></script>
</div>                  
</div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-black">
            <div class="container px-5"><p class="m-0 text-center text-white small">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
