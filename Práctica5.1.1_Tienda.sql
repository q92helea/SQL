CREATE TABLE fabricante ( 
  codigo number(2)PRIMARY KEY, 
  nombre VARCHAR(100) NOT NULL 
)
;

CREATE TABLE producto ( 
  codigo number(2)PRIMARY KEY, 
  nombre VARCHAR2(100) NOT NULL, 
  precio number(7,2) not NULL, 
  codigo_fabricante number(2)NOT NULL, 
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo) 
)
;
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'PortÃ¡til Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'PortÃ¡til Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

CREATE TABLE fabricante ( 
  codigo number(2)PRIMARY KEY, 
  nombre VARCHAR(100) NOT NULL 
)
;

CREATE TABLE producto ( 
  codigo number(2)PRIMARY KEY, 
  nombre VARCHAR2(100) NOT NULL, 
  precio number(7,2) not NULL, 
  codigo_fabricante number(2)NOT NULL, 
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo) 
)
;
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

SELECT producto.nombre,precio,fabricante.nombre 
FROM producto,fabricante where producto.codigo_fabricante=fabricante.codigo;

SELECT producto.nombre,precio,fabricante.nombre FROM producto,fabricante where producto.codigo_fabricante=fabricante.codigo 
ORDER BY fabricante.nombre;

SELECT p.codigo,p.nombre,f.codigo,f.nombre FROM producto p, fabricante f where p.codigo_fabricante=f.codigo;

/*Consulta 04*/
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE f.codigo=p.codigo_fabricante and p.precio in (SELECT MIN(precio) FROM producto);
/*Consulta 05*/
SELECT p.nombre, p.precio, f.nombre FROM producto p, fabricante f WHERE f.codigo=p.codigo_fabricante and p.precio in (SELECT MAX(precio) FROM producto);
/*Consulta 06*/
SELECT * FROM fabricante,producto WHERE fabricante.codigo=producto.codigo_fabricante AND fabricante.nombre='Lenovo';
/*Consulta 07*/
SELECT * FROM producto p, fabricante f WHERE p.codigo_fabricante=f.codigo AND f.nombre='Crucial' AND p.precio>200;
/*Consulta 08*/
SELECT * FROM producto p, fabricante f WHERE p.codigo_fabricante=f.codigo AND (f.nombre IN ('Asus', 'Hewlett-Packard','Seagate'));
/*Consulta 10
Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.*/
SELECT producto.nombre,producto.precio FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo AND producto.nombre LIKE'%e'; 
/*Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.*/
SELECT producto.nombre,producto.precio FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo AND producto.nombre LIKE'%w%'; 
/*Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. 
Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)*/
SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo
AND producto.precio>=180 ORDER BY producto.nombre;

SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo
AND producto.precio>=180 ORDER BY producto.nombre asc, producto.precio desc;

/*Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.*/
SELECT fabricante.codigo, fabricante.nombre FROM producto, fabricante WHERE producto.codigo_fabricante=fabricante.codigo;