-- ============================================================
-- EduTrack — Auditoría de Base de Datos (Q3)
-- Consultas de Auditoría, Corrección y Agregación
-- ============================================================

-- ------------------------------------------------------------
-- Consultas — Lectura y filtrado
-- ------------------------------------------------------------

-- 1. Listar todas las inscripciones del curso 'Intro to Python'
SELECT student_name, student_email, completion_percentage
FROM enrollments
WHERE course_title = 'Intro to Python';

-- 2. Obtener inscripciones con completion_percentage < 10 (posibles abandonos)
SELECT *
FROM enrollments
WHERE completion_percentage < 10;

-- 3. Encontrar inscripciones donde el campo instructor sea NULL
SELECT *
FROM enrollments
WHERE instructor IS NULL;

-- 4. Top 5 estudiantes con mayor completion_percentage que todavía no han aprobado (passed = false)
SELECT *
FROM enrollments
WHERE passed = FALSE
ORDER BY completion_percentage DESC
LIMIT 5;

-- 5. Mostrar todas las inscripciones creadas en el último año, ordenadas por enrollment_date descendente
SELECT *
FROM enrollments
WHERE enrollment_date >= '2024-04-01'
ORDER BY enrollment_date DESC;


-- ------------------------------------------------------------
-- Consultas — Corrección de datos
-- ------------------------------------------------------------

-- 6. INSERT del registro de inscripción faltante
INSERT INTO enrollments (
    id, student_id, student_name, student_email, 
    course_id, course_title, category, 
    enrollment_date, completion_percentage, passed, 
    monthly_fee_paid, instructor
) 
VALUES (
    18, 3, 'Lucia Fernandes', 'lucia.fernandes@student.edutrack.com', 
    5, 'Advanced Python', 'Programming', 
    '2025-04-01', 0, FALSE, 
    69.99, 'Carlos Vega'
);

-- 7. UPDATE: Asignar 'Pending assignment' a inscripciones con instructor NULL
UPDATE enrollments
SET instructor = 'Pending assignment'
WHERE instructor IS NULL;

-- 8. DELETE: Eliminar inscripciones ligadas a las cuentas de prueba (@test.com)
DELETE FROM enrollments
WHERE student_email LIKE '%@test.com';


-- ------------------------------------------------------------
-- Consultas — Agregación e informe
-- ------------------------------------------------------------

-- 9. Contar el número de inscripciones agrupado por categoría
SELECT category, COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY category;

-- 10. Calcular el promedio de completion_percentage por curso, ordenado de menor a mayor
SELECT course_title, AVG(completion_percentage) AS avg_completion
FROM enrollments
GROUP BY course_title
ORDER BY avg_completion ASC;

-- 11. Mostrar únicamente los cursos con más de 3 inscripciones (usar HAVING)
SELECT course_title, COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY course_title
HAVING COUNT(*) > 3;

-- 12. Calcular los ingresos totales (SUM de monthly_fee_paid) agrupados por categoría, ordenados de mayor a menor
SELECT category, SUM(monthly_fee_paid) AS total_revenue
FROM enrollments
GROUP BY category
ORDER BY total_revenue DESC;