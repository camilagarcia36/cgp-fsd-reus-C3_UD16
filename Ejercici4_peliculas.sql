CREATE DATABASE  IF NOT EXISTS `ejercicio4`;
USE `ejercicio4`;


DROP TABLE IF EXISTS `peliculas`;
CREATE TABLE `peliculas` (
  `CODIGO` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `CALIFICACIONEDAD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `peliculas` VALUES (1,'Citizen Kane','PG'),(2,'Singin\' in the Rain','G'),(3,'The Wizard of Oz','G'),(4,'The Quiet Man',NULL),(5,'North by Northwest',NULL),(6,'The Last Tango in Paris','NC-17'),(7,'Some Like it Hot','PG-13'),(8,'A Night at the Opera',NULL),(9,'Citizen King','G');
DROP TABLE IF EXISTS `salas`;
 CREATE TABLE `salas` (
  `CODIGO` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `PELICULA` int DEFAULT NULL,
  PRIMARY KEY (`CODIGO`),
  KEY `PELICULA` (`PELICULA`),
  CONSTRAINT `salas_ibfk_1` FOREIGN KEY (`PELICULA`) REFERENCES `peliculas` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `salas` VALUES (1,'Odeon',5),(2,'Imperial',1),(3,'Majestic',NULL),(4,'Royale',6),(5,'Paraiso',3),(6,'Nickelodeon',NULL);

SELECT Nombre FROM PELICULAS;

SELECT DISTINCT CalificacionEdad FROM PELICULAS;

SELECT * FROM PELICULAS WHERE CalificacionEdad IS NULL;

SELECT * FROM SALAS WHERE Pelicula IS NULL;

SELECT * FROM SALAS LEFT JOIN PELICULAS ON SALAS.Pelicula = PELICULAS.Codigo;


SELECT *
FROM peliculas LEFT JOIN salas ON peliculas.CODIGO = salas.PELICULA;


SELECT peliculas.NOMBRE
FROM peliculas LEFT JOIN salas ON peliculas.CODIGO = salas.PELICULA
WHERE salas.CODIGO IS NULL;


INSERT INTO peliculas (CODIGO, NOMBRE, CALIFICACIONEDAD)
VALUES (10, 'Uno, Dos, Tres', '7');


UPDATE peliculas
SET CALIFICACIONEDAD = 'no recomendable para menores de 13 años'
WHERE CALIFICACIONEDAD IS NULL;


DELETE FROM salas
WHERE PELICULA IN (
    SELECT CODIGO
    FROM peliculas
    WHERE CALIFICACIONEDAD = 'G'
);
