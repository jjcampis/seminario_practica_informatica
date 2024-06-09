package alumnos;
import java.util.List;

public class test {
    public static void main(String[] args) {
        AlumnosDAO alumnosDAO = new AlumnosDAO();
        List<Alumno> alumnos = alumnosDAO.getAlumnos_cursos(2);//aqui le pasamos el id del curso que queremos traer los alumnos
        //System.out.println(alumnos);
        if (alumnos.isEmpty()) {
            System.out.println("No se encontraron alumnos.");
            
        } else {
            System.out.println("alumnos encontrados:");
            for (Alumno alumno : alumnos) {
                System.out.println(alumno);
            }
        }
    }
}
