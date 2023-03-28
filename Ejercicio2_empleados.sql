CREATE DATABASE  IF NOT EXISTS `ejerciciodos`;
USE `ejerciciodos`;


DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `CODIGO` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `PRESUPUESTO` decimal(10,0) NOT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `departamentos` VALUES (14,'IT',65000),(37,'Accounting',15000),(59,'Human Resources',240000),(77,'Research',55000);
INSERT INTO 'departamentos' VALUES (23,'Sales',120000),(42,'Marketing',95000),(88,'Customer Service',180000),(99,'Legal',35000),
(104,'Production',280000),(137,'Quality Control',90000),(156,'Research and Development',75000),(170,'Public Relations',120000),
(187,'Purchasing',125000),(199,'Finance',210000);


DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `DNI` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `APELLIDOS` varchar(255) NOT NULL,
  `DEPARTAMENTO` int NOT NULL,
  PRIMARY KEY (`DNI`),
  KEY `DEPARTAMENTO` (`DEPARTAMENTO`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`DEPARTAMENTO`) REFERENCES `departamentos` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `empleados` VALUES (123234877,'Michael','Rogers',14),(152934485,
'Anand','Manikutty',14),(222364883,'Carol','Smith',37),(326587417,
'Joe','Stevens',37),(332154719,'Mary-Anne','Foster',14),
(332569843,'George','O\'Donnell',77),(546523478,'John','Doe',59),
(631231482,'David','Smith',77),(654873219,'Zacary','Efron',59),
(745685214,'Eric','Goldsmith',59),(845657233,'Luis','López',14),
(845657245,'Elizabeth','Doe',14),(845657246,'Kumar','Swamy',14),(845657266,'Jose','Pérez',77);

SELECT Apellidos FROM EMPLEADOS;

SELECT DISTINCT Apellidos FROM EMPLEADOS;

SELECT * FROM EMPLEADOS WHERE Apellidos = 'López';

SELECT *
FROM EMPLEADOS
WHERE Apellidos = 'López' OR Apellidos = 'Pérez';


SELECT * FROM EMPLEADOS WHERE Departamento = 14;


SELECT *
FROM EMPLEADOS
WHERE Departamento = 37 OR Departamento = 77;


SELECT * FROM EMPLEADOS WHERE Apellidos LIKE 'P%';

SELECT SUM(Presupuesto) FROM DEPARTAMENTOS;

SELECT Departamento, COUNT(*)
FROM EMPLEADOS
GROUP BY Departamento;

SELECT *
FROM EMPLEADOS, DEPARTAMENTOS
WHERE EMPLEADOS.Departamento = DEPARTAMENTOS.Codigo;

SELECT E.Nombre, Apellidos, D.Nombre, Presupuesto
FROM EMPLEADOS E, DEPARTAMENTOS D
WHERE E.Departamento = D.Codigo;

SELECT EMPLEADOS.Nombre, Apellidos
FROM EMPLEADOS, DEPARTAMENTOS
WHERE EMPLEADOS.Departamento = DEPARTAMENTOS.Codigo
AND DEPARTAMENTOS.Presupuesto > 60000;

SELECT Nombre, Apellidos
FROM EMPLEADOS
WHERE Departamento IN (
SELECT Codigo FROM DEPARTAMENTOS WHERE Presupuesto > 60000);

SELECT *
FROM DEPARTAMENTOS
WHERE Presupuesto > (
SELECT AVG(Presupuesto) FROM DEPARTAMENTOS );

SELECT Nombre
FROM DEPARTAMENTOS
WHERE Codigo IN (
SELECT Departamento
FROM EMPLEADOS
GROUP BY Departamento
HAVING COUNT(*) > 2 );

INSERT INTO DEPARTAMENTOS
VALUES ( 11 , 'Calidad' , 40000);

INSERT INTO EMPLEADOS
VALUES ('89267109', 'Esther', 'Vázquez', 11);

UPDATE DEPARTAMENTOS SET Presupuesto = Presupuesto * 0.9;

UPDATE EMPLEADOS SET Departamento = 14 WHERE Departamento = 77;

DELETE FROM EMPLEADOS WHERE Departamento = 14;

DELETE FROM EMPLEADOS WHERE Departamento IN (
SELECT Codigo FROM DEPARTAMENTOS WHERE Presupuesto >= 60000);

DELETE FROM EMPLEADOS;


