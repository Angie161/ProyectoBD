//TERCERA CONSULTA
SELECT 
    E.Nombre_Est, 
    E.Apellido_Est, 
    A.Nombre_Asig
FROM 
    Proyecto.Estudiante AS E
JOIN 
    Proyecto.Cursa AS C ON E.Rut_Est = C.Rut_Est
JOIN 
    Proyecto.Asignatura AS A ON C.Cod_Asig = A.Cod_Asig;

//SEGUNDA CONSULTA
SELECT 
    A.Nombre_Ap, 
    A.Direccion_Ap, 
    A.Telefono_Ap, 
    E.Nombre_Est, 
    E.Apellido_Est, 
    P.Nota_Ev
FROM 
    Proyecto.Apoderado AS A
JOIN 
    Proyecto.Estudiante AS E ON A.Rut_Ap = E.Rut_Apoderado_Est
JOIN 
    Proyecto.Presenta AS P ON E.Rut_Est = P.Rut_Est
WHERE 
    P.Nota_Ev > 6.0;

//TERCERA CONSULTA
SELECT 
    E.Nombre_Emp AS Profesor, 
    D.Nombre_Dep, 
    J.Nombre_Emp AS Jefe_Departamento
FROM 
    Proyecto.Empleado AS E
JOIN 
    Proyecto.ParteDe AS PD ON E.Rut_Emp = PD.Rut_Emp
JOIN 
    Proyecto.Departamento AS D ON PD.ID_Dep = D.ID_Dep
JOIN 
    Proyecto.Empleado AS J ON D.Rut_Jefe_Dep = J.Rut_Emp;
