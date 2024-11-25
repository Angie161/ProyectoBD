-- Informe de notas de un alumno

SELECT 
    a.nombre AS asignatura,
    e.descripcion AS descripcion,
    e.fecha AS fecha_evaluacion,
    p.nota AS nota
FROM 
    proyecto.presenta p
JOIN 
    proyecto.evaluacion e ON p.id_ev = e.id
JOIN 
    proyecto.asignatura a ON e.codigo_asig = a.codigo
WHERE 
    p.rut_est = 65432198
    AND e.tipo = 'Sumativa'
    AND e.fecha BETWEEN '2024-03-01' AND '2024-07-01';


-- Hoja de vida de un alumno (anotaciones particulares y generales asociadas)

SELECT 
    'Particular' AS tipo,
    ap.tipo AS valoracion,
    ap.descripcion AS descripcion,
    ap.fecha AS fecha,
    CONCAT(emp.nombre, ' ', emp.apellido, ', ', emp.cargo) AS autor

FROM 
    proyecto.anotacion_particular ap
JOIN 
    proyecto.estudiante est ON ap.rut_est = est.rut
JOIN 
    proyecto.empleado emp ON ap.rut_emp = emp.rut
WHERE 
    est.rut = 881

UNION ALL

SELECT 
    'General' AS tipo,
    ag.tipo AS valoracion,
    ag.descripcion AS descripcion,
    ag.fecha AS fecha,
    CONCAT(emp.nombre, ' ', emp.apellido, ', ', emp.cargo) AS autor
FROM 
    proyecto.anotacion_general ag
JOIN 
    proyecto.curso c ON ag.id_cur = c.id
JOIN 
    proyecto.empleado emp ON ag.rut_emp = emp.rut
JOIN 
    proyecto.estudiante e ON e.id_curso = c.id
WHERE 
    e.rut = 881
ORDER BY 
    fecha ASC; 

-- Porcentaje de asistencia de un alumno por año
SELECT 
    EXTRACT(YEAR FROM fecha) AS año,
    COUNT(CASE WHEN estado = 'Presente' THEN 1 END) AS dias_asistidos,
    COUNT(CASE WHEN estado = 'Ausente' THEN 1 END) AS dias_ausentes,
    COUNT(CASE WHEN estado = 'Justificado' THEN 1 END) AS dias_justificados,
    ROUND(
        (COUNT(CASE WHEN estado = 'Presente' THEN 1 END) * 100.0) / 
        COUNT(*), 
        2
    ) AS porcentaje_asistencia
FROM 
    proyecto.asistencia
WHERE 
    rut_est = 881
GROUP BY 
    EXTRACT(YEAR FROM fecha)
ORDER BY 
    año;

-- Desempeño de los profesores del departamento del profe de Ed. Fisica 
-- (Nombre de los profesores y el promedio que los alumnos obtienen en su asignatura)

SELECT 
    emp.rut AS rut,
    CONCAT(emp.nombre, ' ', emp.apellido) AS nombre,
    ROUND(AVG(p.nota), 1) AS promedio_notas
FROM 
    proyecto.presenta p
JOIN 
    proyecto.evaluacion e ON p.id_ev = e.id
JOIN 
    proyecto.asignatura a ON e.codigo_asig = a.codigo
JOIN 
    proyecto.empleado emp ON a.rut_prof_imparte = emp.rut
JOIN 
    proyecto.parte_de pd ON emp.rut = pd.rut_emp
JOIN 
    proyecto.departamento d ON pd.id_dep = d.id
WHERE 
    d.nombre = 'Educación Física'
GROUP BY 
    emp.rut, emp.nombre
ORDER BY 
    emp.nombre;
