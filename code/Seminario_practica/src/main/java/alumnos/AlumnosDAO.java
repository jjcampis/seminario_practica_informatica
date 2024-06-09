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
    public List<Alumno> getAlumnos_cursos(int idCurso) {
        return getAlumnos_cursos(idCurso, 1);
    }
    // Método con dos parámetros
   @Override
    public List<Alumno> getAlumnos_cursos(int idCurso, Integer idCiclo) {
        List<Alumno> alumnos = new ArrayList<>();
        //String query = "SELECT * FROM `alumnos_cursos`, personas where personas_idPersona = idPersona AND cursos_idcursos = ?";
        String query = "SELECT ac.idalumnos_cursos as idalumno, p.idPersona, p.nombre, p.apellido, p.dni, p.telefono, p.correo, p.domicilio " +
                       "FROM personas p " +
                       "JOIN per_roles pr ON p.idPersona = pr.idPersona " +
                       "JOIN alumnos_cursos ac ON pr.id_Per_Rol = ac.alumno " +
                       "JOIN ( " +
                       "    SELECT alumno, MAX(fecha_asociacion) as maxFecha " +
                       "    FROM alumnos_cursos " +
                       "    GROUP BY alumno " +
                       ") ac_max ON ac.alumno = ac_max.alumno AND ac.fecha_asociacion = ac_max.maxFecha " +
                       "WHERE ac.cursos_idcursos = ? AND ac.ciclos_lectivos_idCiclo = ?";
        try (Connection connection = Conexion.getConnection(); // Obtener la conexión desde tu clase Conexion
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, idCurso);
            preparedStatement.setInt(2, idCiclo);

            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                int alumnoId = resultSet.getInt("idalumno");//paso el idalumno relacionado al curso para poder marcar asistencias
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
    
    @Override
    public void registrarAsistencias(List<Integer> alumnosIds, int idPreceptor, String estado) {
        String sql = "INSERT INTO asistencias (idAsistencia, idPreceptor, fecha, fecha_hora, estado, alumno_curso) VALUES ";
        StringBuilder values = new StringBuilder();

        for (Integer id : alumnosIds) {
            values.append("(NULL, ?, current_timestamp(), current_timestamp(), ?, ?),");
        }

        sql += values.substring(0, values.length() - 1); // Elimina la última coma
        sql += " ON DUPLICATE KEY UPDATE estado = VALUES(estado)";

        try (Connection conn = Conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            int index = 1;
            for (Integer id : alumnosIds) {
                stmt.setInt(index++, idPreceptor);
                stmt.setString(index++, estado);
                stmt.setInt(index++, id);
            }

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}