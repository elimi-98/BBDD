USE universidad;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL; 
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND RIGHT(nif, 1) = 'K';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT apellido1, apellido2, persona.nombre, id_departamento AS departamento FROM persona JOIN profesor ON persona.id = profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' ORDER BY apellido1 ASC, apellido2 ASC, persona.nombre;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM asignatura JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura JOIN curso_escolar ON curso_escolar.id = id_curso_escolar JOIN persona ON persona.id = id_alumno WHERE persona.nif = '26902806M';
SELECT DISTINCT departamento.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON profesor.id_profesor =  asignatura.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.id = 4;
SELECT DISTINCT persona.nombre, apellido1, apellido2 FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id WHERE curso_escolar.id = 5;

# LEFT JOING AND RIGHT JOIN  
SELECT departamento.nombre, persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC; 
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor WHERE persona.tipo = 'profesor' AND profesor.id_profesor = NULL; 
SELECT departamento.nombre FROM profesor RIGHT JOIN departamento ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento IS NULL;
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM profesor LEFT JOIN persona ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON profesor.id_profesor =asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT asignatura.nombre FROM profesor RIGHT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;


# CONSULTES
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno'; 
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT departamento.nombre, COUNT(profesor.id_profesor) AS 'professor' FROM departamento RIGHT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_profesor) DESC;
SELECT departamento.nombre, COUNT(profesor.id_profesor) AS 'professor' FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre;
SELECT grado.nombre, COUNT(asignatura.id_grado) AS 'asignatures' FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY COUNT(asignatura.id_grado) DESC;
SELECT grado.nombre, COUNT(asignatura.id_grado) AS 'asignatures' FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre HAVING COUNT(asignatura.id_grado) > 40;
SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) AS creditos FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre, asignatura.tipo; 
SELECT curso_escolar.anyo_inicio, COUNT(alumno_se_matricula_asignatura.id_alumno) AS alumnos FROM curso_escolar INNER JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;
SELECT profesor.id_profesor, persona.nombre, apellido1, apellido2, COUNT(asignatura.id) AS num_asignaturas FROM profesor INNER JOIN persona ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor GROUP BY profesor.id_profesor ORDER BY COUNT(asignatura.id) DESC;
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT persona.nombre, apellido1, apellido2 FROM profesor INNER JOIN persona ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;