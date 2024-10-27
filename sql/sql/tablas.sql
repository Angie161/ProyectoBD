CREATE SCHEMA Proyecto
CREATE TABLE Proyecto.Empleado (
    Rut_Emp INT PRIMARY KEY,
    Nombre_Emp VARCHAR NOT NULL,
    Apellido_Emp VARCHAR NOT NULL,
    Correo_Emp VARCHAR NOT NULL,
    Cargo_Emp VARCHAR CHECK (Cargo_Emp IN ('Docente', 'Personal directivo', 'Inspector'))
);

CREATE TABLE Proyecto.Apoderado (
    Rut_Ap INT PRIMARY KEY,
    Nombre_Ap VARCHAR NOT NULL,
    Apellido_Ap VARCHAR NOT NULL,
    Direccion_Ap VARCHAR NOT NULL,
    Telefono_Ap VARCHAR NOT NULL
);

CREATE TABLE Proyecto.Curso (
    ID_Cur SERIAL PRIMARY KEY,
    Grado_Cur VARCHAR CHECK (Grado_Cur IN ('Prekinder', 'Kinder', '1°', '2°', '3°', '4°', '5°', '6°', '7°', '8°')),
    Seccion_Cur CHAR CHECK (Seccion_Cur IN ('A', 'B', 'C')),
    Tipo_Cur VARCHAR CHECK (Tipo_Cur IN ('Pre Básica', 'Básica', 'Media')),
    Rut_Prof_Jefe INT NOT NULL REFERENCES Proyecto.Empleado(Rut_Emp),
    Generacion_cur DATE NOT NULL CHECK (Generacion_cur >= '1949-01-01' AND Generacion_cur <= CURRENT_DATE)
);

CREATE TABLE Proyecto.Asignatura (
    Cod_Asig SERIAL PRIMARY KEY,
    Nombre_Asig VARCHAR NOT NULL,
    Rut_Prof_Imparte INT NOT NULL REFERENCES Proyecto.Empleado(Rut_Emp)
);

CREATE TABLE Proyecto.Estudiante (
    Rut_Est INT PRIMARY KEY,
    Nombre_Est VARCHAR NOT NULL,
    Apellido_Est VARCHAR NOT NULL,
    Direccion_Est VARCHAR NOT NULL,
    Rut_Apoderado_Est INT NOT NULL REFERENCES Proyecto.Apoderado(Rut_Ap),
    Curso_Est INT NOT NULL REFERENCES Proyecto.Curso(ID_Cur),
    N_Lista SMALLINT NOT NULL
);

CREATE TABLE Proyecto.Evaluacion (
    ID_Ev SERIAL PRIMARY KEY,
    Cod_Asign_Ev INT NOT NULL REFERENCES Proyecto.Asignatura(Cod_Asig),
    Tipo_Ev VARCHAR NOT NULL CHECK (Tipo_Ev IN ('Sumativa', 'Formativa')),
    Descripcion_Ev TEXT NOT NULL
);

CREATE TABLE Proyecto.Presenta (
    ID_Ev INT NOT NULL REFERENCES Proyecto.Evaluacion(ID_Ev),
    Rut_Est INT NOT NULL REFERENCES Proyecto.Estudiante(Rut_Est),
    Nota_Ev DECIMAL CHECK (Nota_Ev >= 1.0 AND Nota_Ev <= 7.0),
    PRIMARY KEY (ID_Ev, Rut_Est)
);

CREATE TABLE Proyecto.Cursa (
    Cod_Asig INT NOT NULL REFERENCES Proyecto.Asignatura(Cod_Asig),
    Rut_Est INT NOT NULL REFERENCES Proyecto.Estudiante(Rut_Est),
    PRIMARY KEY (Cod_Asig, Rut_Est)
);

CREATE TABLE Proyecto.Asistencia (
    ID_As SERIAL PRIMARY KEY,
    Fecha_As DATE NOT NULL,
    Rut_Est INT NOT NULL REFERENCES Proyecto.Estudiante(Rut_Est),
    Estado_As VARCHAR CHECK (Estado_As IN ('Presente', 'Ausente', 'Justificado'))
);

CREATE TABLE Proyecto.Anotacion_Particular (
    ID_An_P SERIAL PRIMARY KEY,
    Descripcion_An_P TEXT NOT NULL,
    Tipo_An_P VARCHAR CHECK (Tipo_An_P IN ('Negativa', 'Positiva')),
    Fecha_An_P DATE NOT NULL,
    Rut_Emp INT NOT NULL REFERENCES Proyecto.Empleado(Rut_Emp),
    Rut_Est INT NOT NULL REFERENCES Proyecto.Estudiante(Rut_Est)
);

CREATE TABLE Proyecto.Anotacion_General (
    ID_An_G SERIAL PRIMARY KEY,
    Descripcion_An_G TEXT NOT NULL,
    Tipo_An_G VARCHAR CHECK (Tipo_An_G IN ('Negativa', 'Positiva')),
    Fecha_An_G DATE NOT NULL,
    Rut_Emp INT NOT NULL REFERENCES Proyecto.Empleado(Rut_Emp),
    ID_Cur INT NOT NULL REFERENCES Proyecto.Curso(ID_Cur)
);

CREATE TABLE Proyecto.Horario (
    ID_H SERIAL PRIMARY KEY,
    DiaSemana_H VARCHAR CHECK (DiaSemana_H IN ('lunes', 'martes', 'miércoles', 'jueves', 'viernes')),
    HoraInicio_H TIME CHECK (HoraInicio_H >= '08:15' AND HoraInicio_H <= '15:30'),
    HoraFin_H TIME CHECK (HoraFin_H >= '09:00' AND HoraFin_H <= '16:30')
);

CREATE TABLE Proyecto.SeImparteEn (
    Cod_Asig INT NOT NULL REFERENCES Proyecto.Asignatura(Cod_Asig),
    ID_H INT NOT NULL REFERENCES Proyecto.Horario(ID_H),
    PRIMARY KEY (Cod_Asig, ID_H)
);

CREATE TABLE Proyecto.Departamento (
    ID_Dep SERIAL PRIMARY KEY,
    Nombre_Dep VARCHAR NOT NULL,
    Rut_Jefe_Dep INT NOT NULL REFERENCES Proyecto.Empleado(Rut_Emp)
);

CREATE TABLE Proyecto.ParteDe (
    ID_Dep INT NOT NULL REFERENCES Proyecto.Departamento(ID_Dep),
    Rut_Emp INT NOT NULL REFERENCES Proyecto.Empleado(Rut_Emp),
    PRIMARY KEY (ID_Dep, Rut_Emp)
);
