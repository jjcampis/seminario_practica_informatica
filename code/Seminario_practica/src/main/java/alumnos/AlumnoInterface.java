package alumnos;

import java.util.List;

public interface AlumnoInterface {
    List<Alumno> getAlumnos_cursos(int idCurso);
    List<Alumno> getAlumnos_cursos(int idCurso, Integer idCiclo);
    void registrarAsistencias(List<Integer> alumnosIds, int idPreceptor, String estado);
}