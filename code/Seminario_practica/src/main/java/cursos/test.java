package cursos;

import java.util.List;

public class test {
    public static void main(String[] args) {
        CursoDAO cursoDAO = new CursoDAO();
        List<Curso> cursos = cursoDAO.getAllCursos();
        
        if (cursos.isEmpty()) {
            System.out.println("No se encontraron cursos.");
        } else {
            System.out.println("Cursos encontrados:");
            for (Curso curso : cursos) {
                System.out.println(curso.toString());
            }
        }
    }
}
