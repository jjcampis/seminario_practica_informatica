package cursos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.jjcampis.seminario_practica.Conexion;

public class CursoDAO implements CursoInterface {
    @Override
    public List<Curso> getAllCursos() {
        List<Curso> cursos = new ArrayList<>();
        String query = "SELECT * FROM cursos";
        try (Connection conn = Conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("idcursos");
                String curso = rs.getString("curso");
                String division = rs.getString("division");
                cursos.add(new Curso(id, curso, division));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cursos;
    }
}