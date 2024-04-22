/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestor_tutoriales;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author cuati
 */
public class GestorCategoria {
    public void agregarCategoria(String categoria) {
        try {
            // Establecer la conexión a la base de datos
            Connection conexion = new GestionarTutoriales().establecerConexion();
            if (conexion != null) {
                // Llamar al procedimiento almacenado para agregar la categoría
                String sql = "{CALL AgregarCategoria(?)}";
                try (CallableStatement statement = conexion.prepareCall(sql)) {
                    // Establecer el parámetro de entrada del procedimiento almacenado
                    statement.setString(1, categoria);
                    // Ejecutar el procedimiento almacenado
                    statement.executeUpdate();
                    System.out.println("Categoría agregada exitosamente");
                }
                conexion.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al agregar la categoría: " + e.getMessage());
        }
    }
    public List<Categoria> listarCategorias() {
    List<Categoria> categorias = new ArrayList<>();
    try (Connection conexion = new GestionarTutoriales().establecerConexion()) {
        conexion.prepareStatement("USE gestor;").execute();
        String sql = "SELECT * FROM categorias";
        try (PreparedStatement statement = conexion.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(resultSet.getInt("IdCategoria"));
                categoria.setNombreCategoria(resultSet.getString("Categoria"));
                categorias.add(categoria);
            }
        }
    } catch (SQLException ex) {
        System.out.println("Error al listar las categorías: " + ex.getMessage());
    }
        return categorias;   
}
     
}


