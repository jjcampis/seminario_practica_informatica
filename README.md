# Sistema de Gestión Integral para el Aula Maker y Toma de Asistencia

## Introducción

Este proyecto fue desarrollado para el Colegio Santa María de la ciudad de Posadas, Misiones, con el objetivo de mejorar la gestión y control del Aula Maker y la toma de asistencia de los alumnos. La institución ofrece una orientación en robótica y requiere un sistema eficiente para gestionar el uso del Aula Maker y registrar la asistencia de los estudiantes.

## Objetivos del Proyecto

### Objetivo General
Desarrollar un sistema de gestión y control para el Aula Maker y la toma de asistencia de alumnos.

### Objetivos Específicos
- Tomar asistencia a los alumnos.
- Generar informes por curso y por ciclo lectivo.
- Facilitar la gestión de los datos de la institución y el personal (alumnos, tutores, directivos, etc.).
- Facilitar la gestión del Aula Maker.

## Funcionalidades Principales

1. **Gestión de Reservas del Aula Maker:**
	-** Registrar Reservas: **Permitir a los docentes registrar reservas del Aula Maker.

	-** Consultar Disponibilidad:** Proveer una funcionalidad para que los docentes consulten la disponibilidad del Aula Maker.

	- **Modificar y Cancelar Reservas:** Permitir a los docentes modificar o cancelar reservas existentes.


2. **Toma de Asistencia de Alumnos:**
	- **Registrar Asistencia:** Permitir a los preceptores registrar la asistencia de los alumnos.

	- **Modificar Asistencia:** Permitir modificar la asistencia de un alumno en el caso de que haya llegado tarde por ejemplo y cambiar el estado “ausente” a “tardanza”.

	- **Generar Informes de Asistencia:** Proveer informes sobre la asistencia de los alumnos (por curso, por período, por alumno).

3. **Gestión de Datos de la Institución:**

	-   **Gestionar Información de la institución:** Registrar y actualizar la información de la institución.

	- **Gestionar Información de Personal:** Registrar y actualizar la información del personal docente y administrativo.

	-  **Acceso a Información:** Proveer acceso a la información relevante para los diferentes actores del sistema.

## Tecnologías Utilizadas

- **Lenguaje de Programación:** Java
- **Base de Datos:** MySQL
- **Conexión a la Base de Datos:** JDBC (Java Database Connectivity)

## Estructura de la Base de Datos

### Tablas Principales

- `personas`: Almacena la información básica de todas las personas.
- `roles`: Almacena los diferentes roles en la institución.
- `per_roles`: Relaciona personas con roles.
- `ciclos_lectivos`: Almacena los ciclos académicos.
- `cursos`: Almacena la información de los cursos.
- `asistencias`: Registra la asistencia de los alumnos.
- `tutores`: Relaciona alumnos con sus tutores.
- `reservas_aula`: Registra las reservas del Aula Maker.
- `instituciones`: Almacena la información de las instituciones.

### Diagrama Entidad-Relación

![ER Diagram](https://github.com/jjcampis/seminario_practica_informatica/blob/main/bases%20de%20datos/fotos/base.png)
## Instrucciones de Configuración

### Requisitos
- Java JDK
- MySQL
- JDBC Driver para MySQL
