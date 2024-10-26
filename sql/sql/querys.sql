SELECT Estudiante.Nombre_Est, Estudiante.Apellido_Est, Asignatura.Nombre_Asig
FROM Estudiante
JOIN Cursa ON Estudiante.Rut_Est = Cursa.Rut_Est
JOIN Asignatura ON Cursa.Cod_Asig = Asignatura.Cod_Asig;

SELECT Apoderado.Nombre_Ap, Apoderado.Direccion_Ap, Apoderado.Telefono_Ap, Estudiante.Nombre_Est, Estudiante.Apellido_Est, Presenta.Nota_Ev
FROM Apoderado
JOIN Estudiante ON Apoderado.Rut_Ap = Estudiante.Rut_Apoderado_Est
JOIN Presenta ON Estudiante.Rut_Est = Presenta.Rut_Est
WHERE Presenta.Nota_Ev > 6.0;

SELECT Empleado.Nombre_Emp AS Profesor, Departamento.Nombre_Dep, Jefe.Nombre_Emp AS Jefe_Departamento
FROM Empleado
JOIN ParteDe ON Empleado.Rut_Emp = ParteDe.Rut_Emp
JOIN Departamento ON ParteDe.ID_Dep = Departamento.ID_Dep
JOIN Empleado AS Jefe ON Departamento.Rut_Jefe_Dep = Jefe.Rut_Emp;
