CREATE SCHEMA proyecto;

CREATE TABLE proyecto.empleado (
    rut INT PRIMARY KEY,
    nombre VARCHAR NOT NULL,
    apellido VARCHAR NOT NULL,
    correo VARCHAR NOT NULL,
    cargo VARCHAR CHECK (cargo IN ('Docente', 'Personal directivo', 'Inspector'))
);

CREATE TABLE proyecto.apoderado (
    rut INT PRIMARY KEY,
    nombre VARCHAR NOT NULL,
    apellido VARCHAR NOT NULL,
    direccion VARCHAR NOT NULL,
    telefono VARCHAR NOT NULL
);

CREATE TABLE proyecto.curso (
    id SERIAL PRIMARY KEY,
    grado VARCHAR CHECK (grado IN ('PreKinder', 'Kinder', '1°', '2°', '3°', '4°', '5°', '6°', '7°', '8°')),
    seccion CHAR CHECK (seccion IN ('A', 'B', 'C')),
    tipo VARCHAR CHECK (tipo IN ('Pre Básica', 'Básica', 'Media')),
    rut_prof_jefe INT NOT NULL REFERENCES proyecto.empleado(rut),
    generacion DATE NOT NULL CHECK (generacion >= '1949-01-01' AND generacion <= CURRENT_DATE)
);

CREATE TABLE proyecto.asignatura (
    codigo SERIAL PRIMARY KEY,
    nombre VARCHAR NOT NULL,
    rut_prof_imparte INT NOT NULL REFERENCES proyecto.empleado(rut)
);

CREATE TABLE proyecto.estudiante (
    rut INT PRIMARY KEY,
    nombre VARCHAR NOT NULL,
    apellido VARCHAR NOT NULL,
    direccion VARCHAR NOT NULL,
    rut_apoderado INT NOT NULL REFERENCES proyecto.apoderado(rut),
    id_curso INT NOT NULL REFERENCES proyecto.curso(id)
);

CREATE TABLE proyecto.da_periodo_lectivo_en (
    rut_est INT NOT NULL REFERENCES proyecto.estudiante(rut),
    id_cur INT NOT NULL REFERENCES proyecto.curso(id),
    n_lista SMALLINT NOT NULL,
    estado VARCHAR NOT NULL CHECK (estado IN ('Cursando', 'Aprobado', 'Reprobado')),
    descripcion_estado VARCHAR,
    PRIMARY KEY (rut_est, id_cur)
);

CREATE TABLE proyecto.evaluacion (
    id SERIAL PRIMARY KEY,
    codigo_asig INT NOT NULL REFERENCES proyecto.asignatura(codigo),
    tipo VARCHAR NOT NULL CHECK (tipo IN ('Sumativa', 'Formativa')),
    descripcion TEXT NOT NULL,
    fecha DATE NOT NULL CHECK (fecha >= '1949-01-01' AND fecha <= CURRENT_DATE)
);

CREATE TABLE proyecto.presenta (
    id_ev INT NOT NULL REFERENCES proyecto.evaluacion(id),
    rut_est INT NOT NULL REFERENCES proyecto.estudiante(rut),
    nota DECIMAL CHECK (nota >= 1.0 AND nota <= 7.0),
    PRIMARY KEY (id_ev, rut_est)
);

CREATE TABLE proyecto.cursa (
    codigo_asig INT NOT NULL REFERENCES proyecto.asignatura(codigo),
    rut_est INT NOT NULL REFERENCES proyecto.estudiante(rut),
    PRIMARY KEY (codigo_asig, rut_est)
);

CREATE TABLE proyecto.asistencia (
    id SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    rut_est INT NOT NULL REFERENCES proyecto.estudiante(rut),
    estado VARCHAR CHECK (estado IN ('Presente', 'Ausente', 'Justificado'))
);

CREATE TABLE proyecto.anotacion_particular (
    id SERIAL PRIMARY KEY,
    descripcion TEXT NOT NULL,
    tipo VARCHAR CHECK (tipo IN ('Negativa', 'Positiva')),
    fecha DATE NOT NULL,
    rut_emp INT NOT NULL REFERENCES proyecto.empleado(rut),
    rut_est INT NOT NULL REFERENCES proyecto.estudiante(rut)
);

CREATE TABLE proyecto.anotacion_general (
    id SERIAL PRIMARY KEY,
    descripcion TEXT NOT NULL,
    tipo VARCHAR CHECK (tipo IN ('Negativa', 'Positiva')),
    fecha DATE NOT NULL,
    rut_emp INT NOT NULL REFERENCES proyecto.empleado(rut),
    id_cur INT NOT NULL REFERENCES proyecto.curso(id)
);

CREATE TABLE proyecto.horario (
    id SERIAL PRIMARY KEY,
    dia_semana VARCHAR CHECK (dia_semana IN ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes')),
    hora_inicio TIME CHECK (hora_inicio >= '08:15' AND hora_inicio <= '15:30'),
    hora_fin TIME CHECK (hora_fin >= '09:00' AND hora_fin <= '16:30')
);

CREATE TABLE proyecto.se_imparte_en (
    codigo_asig INT NOT NULL REFERENCES proyecto.asignatura(codigo),
    id_h INT NOT NULL REFERENCES proyecto.horario(id),
    PRIMARY KEY (codigo_asig, id_h)
);

CREATE TABLE proyecto.departamento (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR NOT NULL,
    rut_jefe_dep INT NOT NULL REFERENCES proyecto.empleado(rut)
);

CREATE TABLE proyecto.parte_de (
    id_dep INT NOT NULL REFERENCES proyecto.departamento(id),
    rut_emp INT NOT NULL REFERENCES proyecto.empleado(rut),
    PRIMARY KEY (id_dep, rut_emp)
);
