-- ============================================================
-- EduTrack — Auditoría de Base de Datos (Tablas Relacionadas)
-- ============================================================

-- ------------------------------------------------------------
-- Consultas — INNER JOIN
-- ------------------------------------------------------------

-- 1. Listar todas las inscripciones mostrando el nombre completo del estudiante, el título del curso y su porcentaje de completado
SELECT 
    s.name AS student_name, 
    c.title AS course_title, 
    e.completion_percentage
FROM enrollments e
INNER JOIN students s ON e.student_id = s.id
INNER JOIN courses c ON e.course_id = c.id;

-- 2. Mostrar el nombre y email de los estudiantes que han aprobado al menos un curso, junto con el título del curso que aprobaron
SELECT 
    s.name AS student_name, 
    s.email AS student_email, 
    c.title AS course_title
FROM enrollments e
INNER JOIN students s ON e.student_id = s.id
INNER JOIN courses c ON e.course_id = c.id
WHERE e.passed = TRUE;

-- 3. Calcular el porcentaje de completado medio por instructor, ordenado de mayor a menor
SELECT 
    c.instructor_name, 
    ROUND(AVG(e.completion_percentage), 2) AS avg_completion
FROM enrollments e
INNER JOIN courses c ON e.course_id = c.id
GROUP BY c.instructor_name
ORDER BY avg_completion DESC;


-- ------------------------------------------------------------
-- Consultas — LEFT JOIN (detección de datos faltantes)
-- ------------------------------------------------------------

-- 4. Encontrar todos los estudiantes que no tienen ninguna inscripción
SELECT 
    s.id, 
    s.name, 
    s.email, 
    s.signup_date
FROM students s
LEFT JOIN enrollments e ON s.id = e.student_id
WHERE e.id IS NULL;

-- 5. Encontrar todos los cursos que no tienen ninguna inscripción
SELECT 
    c.id, 
    c.title, 
    c.category, 
    c.instructor_name
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
WHERE e.id IS NULL;


-- ------------------------------------------------------------
-- Consultas — Agregación entre tablas
-- ------------------------------------------------------------

-- 6. Contar cuántos cursos tiene inscrito cada estudiante; mostrar solo los estudiantes inscritos en más de un curso
SELECT 
    s.id, 
    s.name, 
    COUNT(e.course_id) AS total_courses
FROM students s
INNER JOIN enrollments e ON s.id = e.student_id
GROUP BY s.id, s.name
HAVING COUNT(e.course_id) > 1
ORDER BY total_courses DESC;

-- 7. Calcular los ingresos totales por categoría usando el precio del curso de la tabla courses (monthly_fee)
SELECT 
    c.category, 
    SUM(c.monthly_fee) AS total_revenue
FROM enrollments e
INNER JOIN courses c ON e.course_id = c.id
GROUP BY c.category
ORDER BY total_revenue DESC;

-- 8. Mostrar cada instructor junto con el número de estudiantes inscritos actualmente en sus cursos
SELECT 
    c.instructor_name, 
    COUNT(DISTINCT e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.instructor_name
ORDER BY total_students DESC;


-- ------------------------------------------------------------
-- Consultas — Integridad de datos
-- ------------------------------------------------------------

-- 9. Comprobar si hay inscripciones cuyo student_id no corresponde a ningún estudiante existente (registros huérfanos)
SELECT 
    e.*
FROM enrollments e
LEFT JOIN students s ON e.student_id = s.id
WHERE s.id IS NULL;

-- 10. Comprobar si hay inscripciones cuyo course_id no corresponde a ningún curso existente (registros huérfanos)
SELECT 
    e.*
FROM enrollments e
LEFT JOIN courses c ON e.course_id = c.id
WHERE c.id IS NULL;