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

SELECT upper(nombre) AS "Producto", precio FROM producto
;

SELECT lower(nombre) AS "producto", precio FROM producto
;

/*1.1.3 Consultas sobre una tabla

/*1.Lista el nombre de todos los productos que hay en la tabla producto.*/

    SELECT nombre FROM producto;

/*2.Lista los nombres y los precios de todos los productos de la tabla producto.*/
    
 SELECT nombre, precio FROM producto;
 
/*3.Lista todas las columnas de la tabla producto.*/

SELECT * FROM producto;

/*4.Lista el nombre de los productos, el precio en euros y el precio en d�lares estadounidenses (USD).*/

SELECT nombre,precio,precio * 0.92 FROM producto;

/*5.Lista el nombre de los productos, el precio en euros y el precio en d�lares estadounidenses (USD). 
Utiliza los siguientes alias para las columnas: nombre de producto, euros, d�lares.*/

SELECT nombre AS 'name' ,precio AS '�',precio * 0.92 AS '$' FROM producto;

/*6.Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a may�scula.*/


/*7.Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a min�scula*/

/*8.Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en may�sculas los dos primeros 
caracteres del nombre del fabricante.*/

/*9.Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.*/

/*10.Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio 
para mostrarlo sin ninguna cifra decimal.*/



/*11.Lista el c�digo de los fabricantes que tienen productos en la tabla producto.*/

/*12.Lista el c�digo de los fabricantes que tienen productos en la tabla producto, eliminando los c�digos 
que aparecen repetidos.*/

/*13.Lista los nombres de los fabricantes ordenados de forma ascendente.*/
SELECT * FROM fabricantes ORDER BY asc

/*14.Lista los nombres de los fabricantes ordenados de forma descendente.*/

/*15.Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente 
y en segundo lugar por el precio de forma descendente.*/

/*16.Devuelve una lista con las 5 primeras filas de la tabla fabricante.*/

/*17.Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante.
La cuarta fila tambi�n se debe incluir en la respuesta.*/

/*18.Lista el nombre y el precio del producto m�s barato. (Utilice solamente las cl�usulas ORDER BY y LIMIT)*/

/*19.Lista el nombre y el precio del producto m�s caro. (Utilice solamente las cl�usulas ORDER BY y LIMIT)*/

SELECT nombre,precio FROM producto ORDER BY precio LIMIT 1;

/*20.Lista el nombre de todos los productos del fabricante cuyo c�digo de fabricante es igual a 2.*/

SELECT nombre FROM fabricante ORDER BY id>=2;

/*21.Lista el nombre de los productos que tienen un precio menor o igual a 120�.*/

SELECT nombre FROM producto ORDER BY precio <=120;

/*22.Lista el nombre de los productos que tienen un precio mayor o igual a 400�.*/

SELECT nombre FROM producto ORDER BY precio >=420;

/*23.Lista el nombre de los productos que no tienen un precio mayor o igual a 400�.*/

SELECT nombre FROM productos 

/*24.Lista todos los productos que tengan un precio entre 80� y 300�. Sin utilizar el operador BETWEEN.*/

/*25.Lista todos los productos que tengan un precio entre 60� y 200�. Utilizando el operador BETWEEN.*/

/*26.Lista todos los productos que tengan un precio mayor que 200� y que el c�digo de fabricante sea igual a 6.*/

/*27.Lista todos los productos donde el c�digo de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.*/

/*28.Lista todos los productos donde el c�digo de fabricante sea 1, 3 o 5. Utilizando el operador IN.*/

/*29.Lista el nombre y el precio de los productos en c�ntimos (Habr� que multiplicar por 100 el valor del precio).
Cree un alias para la columna que contiene el precio que se llame c�ntimos.*/

/*Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.*/

/*Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.*/

/*Lista los nombres de los fabricantes cuyo nombre contenga el car�cter w.*/

/*Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.*/

/*Devuelve una lista con el nombre de todos los productos que contienen la cadena Port�til en el nombre.*/

/*Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y 
tienen un precio inferior a 215 �.*/

/*Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180�. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
*/

/*consulta 1 multitabla*/
SELECT producto.nombre,precio,fabricante.nombre FROM producto,fabricante where producto.codigo_fabricante=fabricante.codigo;

/*Ordene el resultado por el nombre del fabricante por orden alfab�tico
*/
SELECT producto.nombre,precio,fabricante.nombre FROM producto,fabricante where producto.codigo_fabricante=fabricante.codigo 
ORDER BY fab.nombre;

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
/*Consulta 10*/
