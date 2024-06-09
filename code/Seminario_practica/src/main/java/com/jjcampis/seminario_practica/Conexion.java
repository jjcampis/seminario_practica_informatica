package com.jjcampis.seminario_practica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL = "jdbc:mysql://localhost:3306/ap2"; // Cambia 'ap2' por el nombre de tu base de datos
    private static final String USER = "root"; // Cambia 'root' por tu usuario de MySQL
    private static final String PASSWORD = ""; // Cambia '' por tu contraseña de MySQL

    public static Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión exitosa!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void main(String[] args) {
        Connection connection = getConnection();
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Conexión cerrada!");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
