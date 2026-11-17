# Informe de Análisis y Auditoría de Datos — EduTrack (Esquema Normalizado)

## Consultas — INNER JOIN

### 1. Listado de todas las inscripciones (Estudiante, Curso y Porcentaje de Completado)
Resultado: 16 inscripciones
- **Emily Watson** — Intro to Python (85%)
- **Emily Watson** — Web Design Basics (60%)
- **Klaus Weber** — Intro to Python (92%)
- **Klaus Weber** — Data Analysis with SQL (78%)
- **Lucia Fernandes** — Web Design Basics (5%)
- **Lucia Fernandes** — Digital Marketing 101 (3%)
- **Marco Rossi** — Advanced Python (95%)
- **Marco Rossi** — Intro to Python (88%)
- **Yuki Nakamura** — Data Analysis with SQL (45%)
- **Yuki Nakamura** — UI/UX Fundamentals (0%)
- **Pierre Dubois** — UI/UX Fundamentals (0%)
- **Priya Sharma** — Digital Marketing 101 (70%)
- **Priya Sharma** — Intro to Python (55%)
- **Pierre Dubois** — Data Analysis with SQL (20%)
- **Emily Watson** — Advanced Python (40%)
- **Lucia Fernandes** — Advanced Python (0%)

### 2. Estudiantes que han aprobado al menos un curso
Resultado: 4 estudiantes (6 registros de aprobación en total)
- **Emily Watson** (`emily.watson@student.edutrack.com`) — Intro to Python
- **Klaus Weber** (`klaus.weber@student.edutrack.com`) — Intro to Python
- **Klaus Weber** (`klaus.weber@student.edutrack.com`) — Data Analysis with SQL
- **Marco Rossi** (`marco.rossi@student.edutrack.com`) — Advanced Python
- **Marco Rossi** (`marco.rossi@student.edutrack.com`) — Intro to Python
- **Priya Sharma** (`priya.sharma@student.edutrack.com`) — Digital Marketing 101

### 3. Porcentaje de completado medio por instructor
Resultado:
- **Marta López**: 66.14%
- **Carlos Vega**: 40.00%
- **Lucia Prades**: 36.50%
- **Pending assignment**: 0.00%


## Consultas — LEFT JOIN (Detección de datos faltantes)

### 4. Estudiantes sin ninguna inscripción
Resultado: 1 estudiante
- **Giulia Romano** (`giulia.romano@student.edutrack.com`) — Fecha de registro: 2024-05-07

### 5. Cursos sin ninguna inscripción
Resultado: 1 curso
- **Email Campaigns** (Categoría: Marketing, Instructor: Lucia Prades)


## Consultas — Agregación entre tablas

### 6. Estudiantes inscritos en más de un curso
Resultado: 7 estudiantes
- **Lucia Fernandes**: 3 cursos
- **Emily Watson**: 3 cursos
- **Marco Rossi**: 2 cursos
- **Klaus Weber**: 2 cursos
- **Priya Sharma**: 2 cursos
- **Pierre Dubois**: 2 cursos
- **Yuki Nakamura**: 2 cursos

### 7. Ingresos totales por categoría (según precio actual en `courses`)
Resultado:
- **Programming**: $409.93
- **Data**: $179.97
- **Design**: $169.96
- **Marketing**: $59.98

### 8. Número de estudiantes inscritos actualmente por instructor
Resultado:
- **Marta López**: 6 estudiantes
- **Carlos Vega**: 3 estudiantes
- **Lucia Prades**: 2 estudiantes
- **Pending assignment**: 2 estudiantes


## Consultas — Integridad de datos

### 9. Comprobación de registros huérfanos en `student_id`
Resultado: 0 registros huérfanos (La integridad referencial es correcta)

### 10. Comprobación de registros huérfanos en `course_id`
Resultado: 0 registros huérfanos (La integridad referencial es correcta)