CREATE TABLE Empleado (
    Rut_Emp INT PRIMARY KEY,
    Nombre_Emp VARCHAR NOT NULL,
    Apellido_Emp VARCHAR NOT NULL,
    Correo_Emp VARCHAR NOT NULL,
    Cargo_Emp VARCHAR CHECK (Cargo_Emp IN ('Docente', 'Personal directivo', 'Inspector'))
);

CREATE TABLE Apoderado (
    Rut_Ap INT PRIMARY KEY,
    Nombre_Ap VARCHAR NOT NULL,
    Apellido_Ap VARCHAR NOT NULL,
    Direccion_Ap VARCHAR,
    Telefono_Ap VARCHAR NOT NULL
);

CREATE TABLE Curso (
    ID_Cur SERIAL PRIMARY KEY,
    Grado_Cur VARCHAR CHECK (Grado_Cur IN ('Prekinder', 'Kinder', '1°', '2°', '3°', '4°', '5°', '6°', '7°', '8°')),
    Seccion_Cur CHAR CHECK (Seccion_Cur IN ('A', 'B', 'C')),
    Tipo_Cur VARCHAR CHECK (Tipo_Cur IN ('Pre Básica', 'Básica', 'Media')),
    Rut_Prof_Jefe INT UNIQUE REFERENCES Empleado(Rut_Emp)
);

CREATE TABLE Asignatura (
    Cod_Asig SERIAL PRIMARY KEY,
    Nombre_Asig VARCHAR NOT NULL,
    Rut_Prof_Imparte INT REFERENCES Empleado(Rut_Emp)
);

CREATE TABLE Estudiante (
    Rut_Est INT PRIMARY KEY,
    Nombre_Est VARCHAR NOT NULL,
    Apellido_Est VARCHAR NOT NULL,
    Direccion_Est VARCHAR,
    Rut_Apoderado_Est INT REFERENCES Apoderado(Rut_Ap),
    Curso_Est INT REFERENCES Curso(ID_Cur),
    N_Lista SMALLINT
);

CREATE TABLE Evaluacion (
    ID_Ev SERIAL PRIMARY KEY,
    Cod_Asign_Ev INT REFERENCES Asignatura(Cod_Asig),
    Tipo_Ev VARCHAR NOT NULL CHECK (Tipo_Ev IN ('Sumativa', 'Formativa')),
    Descripcion_Ev TEXT
);

CREATE TABLE Presenta (
    ID_Ev INT REFERENCES Evaluacion(ID_Ev),
    Rut_Est INT REFERENCES Estudiante(Rut_Est),
    Nota_Ev DECIMAL CHECK (Nota_Ev >= 1.0 AND Nota_Ev <= 7.0),
    PRIMARY KEY (ID_Ev, Rut_Est)
);

CREATE TABLE Cursa (
    Cod_Asig INT REFERENCES Asignatura(Cod_Asig),
    Rut_Est INT REFERENCES Estudiante(Rut_Est),
    PRIMARY KEY (Cod_Asig, Rut_Est)
);

CREATE TABLE Asistencia (
    ID_As SERIAL PRIMARY KEY,
    Fecha_As DATE NOT NULL,
    Rut_Est INT REFERENCES Estudiante(Rut_Est),
    Estado_As VARCHAR CHECK (Estado_As IN ('Presente', 'Ausente', 'Justificado'))
);

CREATE TABLE Anotacion_Particular (
    ID_An_P SERIAL PRIMARY KEY,
    Descripcion_An_P TEXT NOT NULL,
    Tipo_An_P VARCHAR CHECK (Tipo_An IN ('Negativa', 'Positiva')),
    Fecha_An_P DATE NOT NULL,
    Rut_Emp INT REFERENCES Empleado(Rut_Emp),
    Rut_Est INT REFERENCES Estudiante(Rut_Est)
);

CREATE TABLE Anotacion_General (
    ID_An_G SERIAL PRIMARY KEY,
    Descripcion_An_G TEXT NOT NULL,
    Tipo_An_G VARCHAR CHECK (Tipo_An IN ('Negativa', 'Positiva')),
    Fecha_An_G DATE NOT NULL,
    Rut_Emp INT REFERENCES Empleado(Rut_Emp),
    ID_Cur INT REFERENCES Curso(ID_Cur)
);

CREATE TABLE Horario (
    ID_H SERIAL PRIMARY KEY,
    DiaSemana_H VARCHAR CHECK (DiaSemana_H IN ('lunes', 'martes', 'miércoles', 'jueves', 'viernes')),
    HoraInicio_H TIME CHECK (HoraInicio_H >= '08:15' AND HoraInicio_H <= '15:30'),
    HoraFin_H TIME CHECK (HoraFin_H >= '09:00' AND HoraFin_H <= '16:30')
);

CREATE TABLE SeImparteEn (
    Cod_Asig INT REFERENCES Asignatura(Cod_Asig),
    ID_H INT REFERENCES Horario(ID_H),
    PRIMARY KEY (Cod_Asig, ID_H)
);

CREATE TABLE Departamento (
    ID_Dep SERIAL PRIMARY KEY,
    Nombre_Dep VARCHAR NOT NULL,
    Rut_Jefe_Dep INT REFERENCES Empleado(Rut_Emp)
);

CREATE TABLE ParteDe (
    ID_Dep INT REFERENCES Departamento(ID_Dep),
    Rut_Emp INT REFERENCES Empleado(Rut_Emp),
    PRIMARY KEY (ID_Dep, Rut_Emp)
);
