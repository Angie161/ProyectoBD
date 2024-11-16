-- Datos de prueba para la tabla empleado
INSERT INTO proyecto.empleado (rut, nombre, apellido, correo, cargo) VALUES
(1001, 'Juan', 'Perez', 'jperez@school.edu', 'Docente'),
(1002, 'Ana', 'Gomez', 'agomez@school.edu', 'Inspector'),
(1003, 'Luis', 'Martinez', 'lmartinez@school.edu', 'Personal directivo');

-- Datos de prueba para la tabla apoderado
INSERT INTO proyecto.apoderado (rut, nombre, apellido, direccion, telefono) VALUES
(2001, 'Maria', 'Lopez', 'Av. Siempreviva 742', '123456789'),
(2002, 'Carlos', 'Diaz', 'Calle Falsa 123', '987654321');

-- Datos de prueba para la tabla curso
INSERT INTO proyecto.curso (grado, seccion, tipo, rut_prof_jefe, generacion) VALUES
('1°', 'A', 'Básica', 1001, '2024-01-01'),
('2°', 'B', 'Básica', 1001, '2024-01-01');

-- Datos de prueba para la tabla asignatura
INSERT INTO proyecto.asignatura (nombre, rut_prof_imparte) VALUES
('Matemáticas', 1001),
('Ciencias', 1003);

-- Datos de prueba para la tabla estudiante
INSERT INTO proyecto.estudiante (rut, nombre, apellido, direccion, rut_apoderado, id_curso, n_lista) VALUES
(3001, 'Pedro', 'Gonzalez', 'Calle Luna 45', 2001, 1, 1),
(3002, 'Laura', 'Mendez', 'Calle Sol 99', 2002, 1, 2);

-- Datos de prueba para la tabla evaluacion
INSERT INTO proyecto.evaluacion (codigo_asig, tipo, descripcion) VALUES
(1, 'Sumativa', 'Prueba de fracciones'),
(2, 'Formativa', 'Ensayo sobre el ciclo del agua');

-- Datos de prueba para la tabla presenta
INSERT INTO proyecto.presenta (id_ev, rut_est, nota) VALUES
(1, 3001, 5.6),
(2, 3002, 6.3);

-- Datos de prueba para la tabla cursa
INSERT INTO proyecto.cursa (codigo_asig, rut_est) VALUES
(1, 3001),
(2, 3002);

-- Datos de prueba para la tabla asistencia
INSERT INTO proyecto.asistencia (fecha, rut_est, estado) VALUES
('2023-10-01', 3001, 'Presente'),
('2023-10-02', 3002, 'Ausente');

-- Datos de prueba para la tabla anotacion_particular
INSERT INTO proyecto.anotacion_particular (descripcion, tipo, fecha, rut_emp, rut_est) VALUES
('Excelente comportamiento', 'Positiva', '2023-10-01', 1002, 3001),
('Falta a clase', 'Negativa', '2023-10-02', 1001, 3002);

-- Datos de prueba para la tabla anotacion_general
INSERT INTO proyecto.anotacion_general (descripcion, tipo, fecha, rut_emp, id_cur) VALUES
('Actividad extracurricular', 'Positiva', '2023-10-05', 1003, 1);

-- Datos de prueba para la tabla horario
INSERT INTO proyecto.horario (dia_semana, hora_inicio, hora_fin) VALUES
('Lunes', '08:15', '09:00'),
('Martes', '09:15', '10:00');

-- Datos de prueba para la tabla se_imparte_en
INSERT INTO proyecto.se_imparte_en (codigo_asig, id_h) VALUES
(1, 1),
(2, 2);

-- Datos de prueba para la tabla departamento
INSERT INTO proyecto.departamento (nombre, rut_jefe_dep) VALUES
('Matemáticas', 1001),
('Ciencias', 1003);

-- Datos de prueba para la tabla parte_de
INSERT INTO proyecto.parte_de (id_dep, rut_emp) VALUES
(1, 1001),
(2, 1003);
