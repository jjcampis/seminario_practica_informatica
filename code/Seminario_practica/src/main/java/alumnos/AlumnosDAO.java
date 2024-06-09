package alumnos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.jjcampis.seminario_practica.Conexion;

public class AlumnosDAO implements AlumnoInterface {
    @Override
    public List<Alumno> getAlumnos_cursos(int id) {
        List<Alumno> alumnos = new ArrayList<>();
        String query = "SELECT * FROM `alumnos_cursos`, personas where personas_idPersona = idPersona AND cursos_idcursos = ?";
        try (Connection connection = Conexion.getConnection(); // Obtener la conexión desde tu clase Conexion
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                int alumnoId = resultSet.getInt("idPersona");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                Alumno alumno = new Alumno(alumnoId, nombre, apellido);
                alumnos.add(alumno);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return alumnos;
    }
}