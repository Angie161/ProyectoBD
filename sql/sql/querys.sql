-- PRIMERA CONSULTA
SELECT 
    e.nombre, 
    e.apellido, 
    a.nombre
FROM 
    proyecto.estudiante AS e
JOIN 
    proyecto.cursa AS c ON e.rut = c.rut_est
JOIN 
    proyecto.asignatura AS a ON c.codigo_asig = a.codigo;

-- SEGUNDA CONSULTA
SELECT 
    a.nombre, 
    a.direccion, 
    a.telefono, 
    e.nombre, 
    e.apellido, 
    p.nota
FROM 
    proyecto.apoderado AS a
JOIN 
    proyecto.estudiante AS e ON a.rut = e.rut_apoderado
JOIN 
    proyecto.presenta AS p ON e.rut = p.rut_est
WHERE 
    p.nota > 6.0;

-- TERCERA CONSULTA
SELECT 
    e.nombre AS profesor, 
    d.nombre, 
    j.nombre AS jefe_departamento
FROM 
    proyecto.empleado AS e
JOIN 
    proyecto.parte_de AS pd ON e.rut = pd.rut_emp
JOIN 
    proyecto.departamento AS d ON pd.id_dep = d.id
JOIN 
    proyecto.empleado AS j ON d.rut_jefe_dep = j.rut;
