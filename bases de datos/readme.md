## Consulta SQL

La siguiente consulta SQL calcula el total de faltas por alumno, considerando que cada tardanza cuenta como media falta:

```sql
SELECT
    p.idPersona AS idAlumno,
    CONCAT(p.nombre, ' ', p.apellido) AS nombreAlumno,
    SUM(CASE WHEN a.estado = 'Ausente' THEN 1 ELSE 0 END) +
    SUM(CASE WHEN a.estado = 'Tardanza' THEN 0.5 ELSE 0 END) AS faltasTotales
FROM
    ap2.asistencias a
JOIN
    ap2.personas p ON a.idAlumno = p.idPersona
GROUP BY
    p.idPersona, p.nombre, p.apellido;