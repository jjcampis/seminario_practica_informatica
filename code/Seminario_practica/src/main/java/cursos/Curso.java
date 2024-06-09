package cursos;

public class Curso {
    private int id;
    private String curso;
    private String division;

    public Curso(int id, String curso, String division) {
        this.id = id;
        this.curso = curso;
        this.division = division;
    }

    public int getId() {
        return id;
    }

    public String getCurso() {
        return curso;
    }

    public String getDivision() {
        return division;
    }

    @Override
    public String toString() {
        return curso + " - " + division;
    }
}
