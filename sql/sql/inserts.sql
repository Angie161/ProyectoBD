
-- Datos de prueba para la tabla Empleado
INSERT INTO Proyecto.Empleado (Rut_Emp, Nombre_Emp, Apellido_Emp, Correo_Emp, Cargo_Emp) VALUES
(1001, 'Juan', 'Perez', 'jperez@school.edu', 'Docente'),
(1002, 'Ana', 'Gomez', 'agomez@school.edu', 'Inspector'),
(1003, 'Luis', 'Martinez', 'lmartinez@school.edu', 'Personal directivo');

-- Datos de prueba para la tabla Apoderado
INSERT INTO Proyecto.Apoderado (Rut_Ap, Nombre_Ap, Apellido_Ap, Direccion_Ap, Telefono_Ap) VALUES
(2001, 'Maria', 'Lopez', 'Av. Siempreviva 742', '123456789'),
(2002, 'Carlos', 'Diaz', 'Calle Falsa 123', '987654321');

-- Datos de prueba para la tabla Curso
INSERT INTO Proyecto.Curso (Grado_Cur, Seccion_Cur, Tipo_Cur, Rut_Prof_Jefe, Generacion_cur) VALUES
('1°', 'A', 'Básica', 1001, '2024-01-01'),
('2°', 'B', 'Básica', 1001, '2024-01-01');

-- Datos de prueba para la tabla Asignatura
INSERT INTO Proyecto.Asignatura (Nombre_Asig, Rut_Prof_Imparte) VALUES
('Matemáticas', 1001),
('Ciencias', 1003);

-- Datos de prueba para la tabla Estudiante
INSERT INTO Proyecto.Estudiante (Rut_Est, Nombre_Est, Apellido_Est, Direccion_Est, Rut_Apoderado_Est, Curso_Est, N_Lista) VALUES
(3001, 'Pedro', 'Gonzalez', 'Calle Luna 45', 2001, 1, 1),
(3002, 'Laura', 'Mendez', 'Calle Sol 99', 2002, 1, 2);

-- Datos de prueba para la tabla Evaluacion
INSERT INTO Proyecto.Evaluacion (Cod_Asign_Ev, Tipo_Ev, Descripcion_Ev) VALUES
(1, 'Sumativa', 'Prueba de fracciones'),
(2, 'Formativa', 'Ensayo sobre el ciclo del agua');

-- Datos de prueba para la tabla Presenta
INSERT INTO Proyecto.Presenta (ID_Ev, Rut_Est, Nota_Ev) VALUES
(1, 3001, 5.6),
(2, 3002, 6.3);

-- Datos de prueba para la tabla Cursa
INSERT INTO Proyecto.Cursa (Cod_Asig, Rut_Est) VALUES
(1, 3001),
(2, 3002);

-- Datos de prueba para la tabla Asistencia
INSERT INTO Proyecto.Asistencia (Fecha_As, Rut_Est, Estado_As) VALUES
('2023-10-01', 3001, 'Presente'),
('2023-10-02', 3002, 'Ausente');

-- Datos de prueba para la tabla Anotacion_Particular
INSERT INTO Proyecto.Anotacion_Particular (Descripcion_An_P, Tipo_An_P, Fecha_An_P, Rut_Emp, Rut_Est) VALUES
('Excelente comportamiento', 'Positiva', '2023-10-01', 1002, 3001),
('Falta a clase', 'Negativa', '2023-10-02', 1001, 3002);

-- Datos de prueba para la tabla Anotacion_General
INSERT INTO Proyecto.Anotacion_General (Descripcion_An_G, Tipo_An_G, Fecha_An_G, Rut_Emp, ID_Cur) VALUES
('Actividad extracurricular', 'Positiva', '2023-10-05', 1003, 1);

-- Datos de prueba para la tabla Horario
INSERT INTO Proyecto.Horario (DiaSemana_H, HoraInicio_H, HoraFin_H) VALUES
('lunes', '08:15', '09:00'),
('martes', '09:15', '10:00');

-- Datos de prueba para la tabla SeImparteEn
INSERT INTO Proyecto.SeImparteEn (Cod_Asig, ID_H) VALUES
(1, 1),
(2, 2);

-- Datos de prueba para la tabla Departamento
INSERT INTO Proyecto.Departamento (Nombre_Dep, Rut_Jefe_Dep) VALUES
('Matemáticas', 1001),
('Ciencias', 1003);

-- Datos de prueba para la tabla ParteDe
INSERT INTO Proyecto.ParteDe (ID_Dep, Rut_Emp) VALUES
(1, 1001),
(2, 1003);
