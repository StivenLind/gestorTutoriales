/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestor_tutoriales;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class GestionarTutoriales {

    ArrayList<Tutorial> tutoriales = new ArrayList<>();

    public Connection establecerConexion() {

        String url = "jdbc:mysql://localhost:3306/?serverTimeZone=utc";
        String user = "root";
        String password = "Neider2003";
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            if (conn != null) {
                System.out.println("Conexion exitosa" + conn);
            }
        } catch (Exception e) {
            System.out.println("Error de conexion " + e.getMessage());
        }
        return conn;
    }

    public void AgregarTutorial(String Nombre, String URL, String Estado, int Prioridad, int idcategoria, Connection establecerConexion) {
        if (establecerConexion != null) {
            try {
                establecerConexion.prepareStatement("USE gestor;").execute();

                CallableStatement stmt = establecerConexion.prepareCall("{call NuevoTutorial(?, ?, ?, ?, ?)}");

                stmt.setString(1, Nombre);
                stmt.setString(2, URL);
                stmt.setString(3, Estado);
                stmt.setInt(4, Prioridad);
                stmt.setInt(5, idcategoria);

                stmt.execute();

                establecerConexion.close();

                System.out.println("Conexion exitosa te amo rey ");

            } catch (SQLException e) {

                System.err.println("Error no se agrego" + e.getMessage());
            }
        } else {
            System.err.println("No se pudo establecer conecion con base de datos");
        }
    }

    /*public ArrayList<Tutorial> obtenerTutoriales() throws SQLException{
        
        
        Connection con = establecerConexion(); 
        String sql = "SELECT t.nombre, t.url, t.estado, t.prioridad, c.categoria " +
                         "FROM Tutorial t " +
                         "INNER JOIN Categorias c ON t.idcategoria = c.idcategoria";

            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String nombre = resultSet.getString("nombre");
                String url = resultSet.getString("url");
                String estado = resultSet.getString("estado");
                int prioridad = resultSet.getInt("prioridad");
                String categoria = resultSet.getString("categoria");

                Tutorial tuto = new Tutorial(prioridad, estado, prioridad, url, prioridad, estado);
                tutoriales.add(tuto);
            }

            con.close();
 
        return tutoriales;
     }*/
    public StringBuilder procesarArrayList(ArrayList<Tutorial> tutoriales) {
        // Aquí puedes trabajar con el ArrayList de tutoriales recibido como parámetro
        // Por ejemplo, imprimir los nombres de los tutoriales:
        StringBuilder html = new StringBuilder();
        for (Tutorial tutorial : tutoriales) {
            System.out.println(tutorial.getTitulo());
            html.append("<h1>").append(tutorial.getTitulo()).append("</h1>");
        }

        return html;
    }

    public List<Tutorial> listarTutoriales() {

        List<Tutorial> tutoriales = new ArrayList<>();

        try (Connection conexion = new GestionarTutoriales().establecerConexion()) {
            conexion.prepareStatement("USE gestor;").execute();
            String sql = "SELECT * FROM Tutorial";
            try (PreparedStatement statement = conexion.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Tutorial tutorial = new Tutorial();
                    tutorial.setIdTutorial(resultSet.getInt("idTutorial"));
                    tutorial.setTitulo(resultSet.getString("nombre"));
                    tutorial.setUrl(resultSet.getString("url"));
                    tutorial.setEstado(resultSet.getString("estado"));
                    tutorial.setPrioridad(resultSet.getInt("prioridad"));
                    tutorial.setIdCategoria(resultSet.getInt("idcategoria"));
                    tutoriales.add(tutorial);
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar los tutoriales: " + ex.getMessage());
        }
        return tutoriales;
    }

    public String obtenerNombreCategoriaPorId(int idCategoria) {
        String nombreCategoria = "";
        String sql = "SELECT categoria FROM categorias WHERE idcategoria = ?";

        try (Connection conexion = new GestionarTutoriales().establecerConexion(); PreparedStatement pstmt = conexion.prepareStatement(sql)) {
            conexion.prepareStatement("USE gestor;").execute();

            pstmt.setInt(1, idCategoria);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    nombreCategoria = rs.getString("categoria");
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error al obtener el nombre de la categoría: " + ex.getMessage());
        }

        return nombreCategoria;
    }

    public boolean actualizarTutorial(int idTutorial, String titulo, String url, String estado, int prioridad, int categoriaId) {
        try (Connection conexion = establecerConexion()) {
            conexion.prepareStatement("USE gestor;").execute();

            CallableStatement stmt = conexion.prepareCall("{call EditarTutorial(?, ?, ?, ?, ?, ?)}");
            stmt.setInt(1, idTutorial);
            stmt.setString(2, titulo);
            stmt.setString(3, url);
            stmt.setString(4, estado);
            stmt.setInt(5, prioridad);
            stmt.setInt(6, categoriaId);

            return stmt.executeUpdate() > 0; // Si se actualizó al menos una fila, retorna true
        } catch (SQLException e) {
            System.err.println("Error al actualizar el tutorial: " + e.getMessage());
            return false; // Indica que no se pudo actualizar el tutorial
        }
    }

    public boolean eliminarTutorial(int idTutorial) {
        try (Connection conexion = establecerConexion()) {
            conexion.prepareStatement("USE gestor;").execute(); // Asegura que la base de datos correcta está en uso

            CallableStatement stmt = conexion.prepareCall("{call EliminarTutorial(?)}");
            stmt.setInt(1, idTutorial);

            int resultado = stmt.executeUpdate(); // Ejecuta la llamada y obtiene el resultado
            if (resultado > 0) {
                System.out.println("Tutorial eliminado correctamente.");
                return true; // Si la eliminación fue exitosa
            } else {
                System.out.println("No se encontró un tutorial para eliminar con el ID proporcionado.");
                return false; // Si no se eliminó ningún registro
            }
        } catch (SQLException e) {
            System.err.println("Error al eliminar el tutorial: " + e.getMessage());
            return false; // Indica que no se pudo eliminar el tutorial
        }
    }

    public boolean eliminarCategoria(int idCategoria) {
        try (Connection conexion = establecerConexion()) {
            conexion.prepareStatement("USE gestor;").execute(); // Asegura que la base de datos correcta está en uso

            CallableStatement stmt = conexion.prepareCall("{call EliminarCategoria(?)}");
            stmt.setInt(1, idCategoria);

            int resultado = stmt.executeUpdate(); // Ejecuta el procedimiento almacenado y obtiene el resultado
            if (resultado > 0) {
                System.out.println("Categoría eliminada correctamente.");
                return true; // Si la eliminación fue exitosa
            } else {
                System.out.println("No se encontró una categoría para eliminar con el ID proporcionado.");
                return false; // Si no se eliminó ninguna categoría
            }
        } catch (SQLException e) {
            System.err.println("Error al eliminar la categoría: " + e.getMessage());
            return false; // Indica que no se pudo eliminar la categoría
        }
    }
public Tutorial obtenerTutorialPorId(int idTutorial) {
        Tutorial tutorial = null;
        String query = "SELECT idTutorial, nombre, url, estado, prioridad, idcategoria FROM Tutorial WHERE idTutorial = ?";
        
        try (Connection conexion = establecerConexion();
             PreparedStatement pstmt = conexion.prepareStatement(query)) {
            pstmt.setInt(1, idTutorial);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    tutorial = new Tutorial();
                    tutorial.setIdTutorial(rs.getInt("idTutorial"));
                    tutorial.setTitulo(rs.getString("titulo"));
                    tutorial.setUrl(rs.getString("url"));
                    tutorial.setEstado(rs.getString("estado"));
                    tutorial.setPrioridad(rs.getInt("prioridad"));
                    tutorial.setIdCategoria(rs.getInt("idcategoria"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return tutorial;
    }
}
