INSERT INTO proyecto.anotacion_general (descripcion, tipo, fecha, rut_emp, id_cur)
VALUES ('Cocinan completos en la parte trasera de la sala mientras el profesor da la clase.', 'Negativa', CURRENT_DATE, 6543219, 1);

UPDATE proyecto.da_periodo_lectivo_en
SET 
    estado = 'Aprobado'
WHERE 
    rut_est = 98765432
    AND id_cur = 1

DELETE FROM proyecto.se_imparte_en
WHERE 
    codigo_asig = 2
    AND id_h = 2;
