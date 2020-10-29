#RETO 1
----- Tipos de datos
# int
#varchar
#double
#timestamp
----------------
#RETO 2
------ nombre empleados puesto 4 
SELECT nombre
FROM empleado
WHERE id_puesto = 4;
--------- salario mayor a $1,000
SELECT*
FROM puesto 
WHERE salario > 10000;
------------ articulo
SELECT *
FROM articulo
WHERE precio > 1000 AND iva > 100;
---------------------
SELECT *
FROM venta
WHERE id_articulo IN (135, 963) AND id_empleado IN (835, 369);

#RETO 3
--- top 5 puestos por salario
SELECT *
FROM puesto
ORDER BY salario DESC
LIMIT 5;
