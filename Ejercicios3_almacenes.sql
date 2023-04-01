CREATE DATABASE  IF NOT EXISTS `ejerciciotres`;
USE `ejerciciotres`;


DROP TABLE IF EXISTS `almacenes`;
CREATE TABLE `almacenes` (
  `CODIGO` int NOT NULL AUTO_INCREMENT,
  `LUGAR` varchar(100) NOT NULL,
  `CAPACIDAD` int NOT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `almacenes` VALUES (NULL,'Valencia',3),(NULL,'Barcelona',4),(NULL,'Bilbao',7),(NULL,'Los Angeles',2),(NULL,'San Francisco',8);
INSERT INTO `almacenes` VALUES (NULL,'Madrid', 500),(NULL,'Barcelona', 400),(NULL,'Valencia', 300),(NULL,'Sevilla', 200),(NULL,'Bilbao', 100


DROP TABLE IF EXISTS `cajas`;
CREATE TABLE `cajas` (
  `NUMREFERENCIA` varchar(255) NOT NULL,
  `CONTENIDO` varchar(255) NOT NULL,
  `VALOR` double NOT NULL,
  `ALMACEN` int NOT NULL,
  PRIMARY KEY (`NUMREFERENCIA`),
  CONSTRAINT FK_ALMACENES FOREIGN KEY (ALMACEN) REFERENCES almacenes(CODIGO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `cajas` VALUES ('0MN7','Rocks',180,3),('4H8P','Rocks',250,1),('4RT3','Scissors',190,4),('7G3H','Rocks',200,1),('8JN6','Papers',75,1),('8Y6U','Papers',50,3),('9J6F','Papers',175,2),('LL08','Rocks',140,4),('P0H6','Scissors',125,1),('P2T6','Scissors',150,2),('TU55','Papers',90,5);

NSERT INTO 'cajas' VALUES ('REF001','Papeles',50.5,1),('REF002','Electrodomesticos',1000,2),('REF003','Ropa',30,3),('REF004','Comida',70,2),('REF005','Joyeria',500,1);


SELECT * FROM ALMACENES;

SELECT * FROM CAJAS WHERE Valor > 150;

SELECT DISTINCT Contenido FROM CAJAS;

SELECT AVG(Valor) FROM CAJAS;

SELECT Almacen, AVG(Valor) FROM CAJAS GROUP BY Almacen;

SELECT Almacen, AVG(Valor)
FROM CAJAS
GROUP BY Almacen
HAVING AVG(Valor) > 150;

SELECT NumReferencia, Lugar
FROM ALMACENES, CAJAS
WHERE ALMACENES.Codigo = CAJAS.Almacen;

SELECT Almacen, COUNT(*)
FROM CAJAS
GROUP BY Almacen;

SELECT Codigo, COUNT(NumReferencia)
FROM ALMACENES LEFT JOIN CAJAS
ON ALMACENES.Codigo = CAJAS.Almacen
GROUP BY Codigo;

SELECT Codigo
FROM ALMACENES
WHERE Capacidad < (
SELECT COUNT(*) FROM CAJAS WHERE Almacen = Codigo);

SELECT NumReferencia
FROM CAJAS WHERE Almacen IN (
SELECT Codigo FROM ALMACENES WHERE Lugar = 'Bilbao');

INSERT INTO ALMACENES(Lugar, Capacidad) VALUES('Barcelona', 3);

INSERT INTO CAJAS VALUES('H5RT', 'Papel', 200, 2);

UPDATE CAJAS SET Valor = Valor * 0.85;

UPDATE CAJAS SET Valor = Valor * 0.80
WHERE Valor > (SELECT AVG(Valor) FROM CAJAS);

DELETE FROM CAJAS WHERE Valor < 100;

DELETE FROM CAJAS WHERE Almacen IN (
SELECT Codigo FROM ALMACENES WHERE Capacidad < (
SELECT COUNT(*) FROM CAJAS WHERE Almacen = Codigo ) );
