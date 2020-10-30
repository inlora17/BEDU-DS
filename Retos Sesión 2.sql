#Reto 1
-- artículos incluyen la palabra Pasta en su nombre
SELECT * 
FROM articulo 
WHERE nombre 
LIKE '%Pasta%';
-- artículos incluyen la palabra Cannelloni en su nombre
SELECT * 
FROM articulo 
WHERE nombre 
LIKE '%Cannelloni%';
-- nombres están separados por un guión (-) por ejemplo Puree - Kiwi
SELECT * 
FROM articulo 
WHERE nombre 
LIKE '%-%';
-- puestos incluyen la palabra Designer
SELECT * 
FROM puesto 
WHERE nombre 
LIKE '%Designer%';
-- puestos incluyen la palabra Developer
SELECT * 
FROM puesto 
WHERE nombre 
LIKE '%Developer%';

# Reto 2
-- ¿Cuál es el promedio de salario de los puestos?
SELECT round(avg(salario),3) AS "Promedio Salario" 
FROM puesto;
-- ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(nombre) 
FROM articulo 
WHERE nombre 
LIKE '%Pasta%';
-- ¿Cuál es el salario mínimo y máximo?
SELECT min(salario) 
AS 'salario máximo' , max(salario) 
AS 'salario minimo'
FROM puesto;
-- ¿Cuál es la suma del salario de los últimos cinco puestos agregados
SELECT max(id_puesto) - 5  
AS 'Suma ultimos 5 puestos agregados' 
FROM puesto;
SELECT sum(salario)
AS 'Suma de 5 Salarios' FROM puesto 
WHERE id_puesto > ((SELECT max(id_puesto) FROM puesto) -5);
# Opcion2
SELECT sum(salario) AS 'Suma ultimos 5 puestos agregados'
FROM (SELECT salario FROM puesto ORDER BY id_puesto DESC LIMIT 5) AS Ultimos_5_PUESTOS;

#RETO 3
-- ¿Cuántos registros hay por cada uno de los puestos? 
SELECT nombre, count(*) AS 'total' 
FROM puesto GROUP BY nombre ORDER BY nombre;
-- ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) 'Pago' 
FROM puesto GROUP BY nombre ORDER BY nombre;
-- ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(clave) AS 'ventas'
FROM venta GROUP BY id_empleado;
-- ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(clave) AS 'ventas'
FROM venta GROUP BY id_articulo;
