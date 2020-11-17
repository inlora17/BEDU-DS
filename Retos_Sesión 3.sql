#SESIÓN 3

# RETO 1
-- ¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $10,000?
SELECT nombre, apellido_paterno
FROM empleado
WHERE id_puesto in
 (SELECT id_puesto
      FROM puesto
      WHERE salario > 10000);

-- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?

select id_empleado, min(tot_ventas) as 'Venta min' , max(tot_ventas) as 'venta máx'
FROM (SELECT clave, id_empleado, count(*) as 'tot_ventas'
FROM venta
group by clave, id_empleado) as SQ
GROUP BY id_empleado;

-- ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT clave
FROM venta
WHERE id_articulo in 
(SELECT id_articulo as 'i.articulo'
FROM articulo
WHERE precio > 5000);

#RETO 2
-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
SHOW KEYS FROM empleado;
SELECT clave, nombre, apellido_paterno, apellido_materno
FROM empleado as e
JOIN venta as v 
ON e.id_empleado = v.id_empleado
ORDER BY clave;

-- ¿Cuál es el nombre de los artículos que se han vendido?
SHOW KEYS FROM venta;
SELECT clave, nombre
FROM articulo as a
JOIN venta as v
USING (id_articulo)
ORDER BY clave;

-- ¿Cuál es el total de cada venta?
SHOW KEYS FROM venta;
SELECT clave , round(sum(precio),3) AS total
FROM venta
JOIN articulo
USING (id_articulo)
GROUP BY clave
ORDER BY clave;

#RETO 3
-- Obtener el puesto de un empleado.
CREATE VIEW pues71 AS
SELECT concat(e.nombre,' ', e.apellido_paterno) as Empleado, p.nombre as puesto
FROM empleado e
JOIN puesto p
  ON e.id_puesto = p.id_puesto;
SELECT * 
FROM pues71;
  
-- Saber qué artículos ha vendido cada empleado.
CREATE VIEW empleado_articulo71 AS
SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno) nombre, a.nombre articulo
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo
ORDER BY v.clave;

SELECT*
FROM empleado_articulo71;

-- Saber qué puesto ha tenido más ventas.
CREATE VIEW puesto_ventas AS
SELECT p.nombre, count(v.clave) as total
FROM venta as v
JOIN empleado as e
	USING (id_empleado)
JOIN puesto as p
	USING (id_puesto)
GROUP BY p.nombre;

SELECT*
FROM puesto_ventas
ORDER BY total DESC
LIMIT 1;

