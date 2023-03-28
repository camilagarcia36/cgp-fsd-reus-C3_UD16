CREATE DATABASE  IF NOT EXISTS `informaticaTienda`;
USE `informaticaTienda`;


DROP TABLE IF EXISTS `fabricantes`;
CREATE TABLE `fabricantes` (
  `CODIGO` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `fabricantes` VALUES (1,'Sony'),(2,'Creative Labs'),(3,'Hewlett-Packard'),(4,'Iomega'),(5,'Fujitsu'),(6,'Winchester');

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `CODIGO` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `PRECIO` decimal(10,0) NOT NULL,
  `FABRICANTE` int NOT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `FABRICANTE` (`FABRICANTE`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`FABRICANTE`) REFERENCES `fabricantes` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `articulos` VALUES (1,'Hard drive',240,5),(2,'Memory',120,6),(3,'ZIP drive',150,4),(4,'Floppy disk',5,6),(5,'Monitor',240,1),(6,'DVD drive',180,2),(7,'CD drive',90,2),(8,'Printer',270,3),(9,'Toner cartridge',66,3),(10,'DVD burner',180,2);


/*1.1 */
SELECT Nombre, Precio FROM ARTICULOS;

/*1.2 */

SELECT Nombre FROM ARTICULOS WHERE Precio > 200;
/*1.3 */

SELECT * FROM ARTICULOS WHERE Precio BETWEEN 60 AND 120;
/*1.4 */

SELECT Nombre, Precio * 166.386 AS PrecioPtas FROM ARTICULOS; 
/*1.5 */

SELECT AVG(Precio) FROM ARTICULOS; 

/*1.6 */

SELECT AVG(Precio) FROM ARTICULOS WHERE Fabricante = 2;

/*1.7 */

SELECT COUNT(*) FROM ARTICULOS WHERE Precio >= 180;

/*1.8*/

SELECT Nombre, Precio
FROM ARTICULOS
WHERE Precio >= 180
ORDER BY Precio DESC, Nombre; 
/*1.9 */

SELECT *
FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo;
/*1.10 */


SELECT ARTICULOS.Nombre, Precio, FABRICANTES.Nombre
FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo
/*1.11 */

SELECT AVG(Precio), Fabricante
FROM ARTICULOS
GROUP BY Fabricante
/*1.12 */

SELECT AVG(Precio), FABRICANTES.Nombre
FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo
GROUP BY FABRICANTES.Nombre
/*1.13 */

SELECT AVG(Precio), FABRICANTES.Nombre
FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo
GROUP BY FABRICANTES.Nombre
HAVING AVG(Precio) >= 150
 /*1.14 */

SELECT Nombre, Precio
FROM ARTICULOS
WHERE Precio = (SELECT MIN(Precio) FROM ARTICULOS)
/*1.15 */

SELECT A.Nombre, A.Precio, F.Nombre
FROM ARTICULOS A, FABRICANTES F
WHERE A.Fabricante = F.Codigo
AND A.Precio = (
SELECT MAX(A2.Precio)
FROM ARTICULOS A2
WHERE A2.Fabricante = F.Codigo)
 /*1.16 */

INSERT INTO ARTICULOS (Nombre, Precio ,Fabricante)
VALUES ('Altavoces', 70, 2)
/*1.17 */

UPDATE ARTICULOS SET Nombre = 'Impresora Laser' WHERE Codigo = 8
/*1.18 */

UPDATE ARTICULOS SET Precio = Precio * 0.9
/*1.19 */

UPDATE ARTICULOS SET Precio = Precio - 10 WHERE Precio >= 120
