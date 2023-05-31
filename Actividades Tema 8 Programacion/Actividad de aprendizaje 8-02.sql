use datosorigen;

/* 1.- Ahora vas a crear o editar un procedimiento desde Workbench, dentro de la base
de datos datororigen, que:
● Crea, si es que no existe ya, una tabla de personas con las columnas num,
nombre, apellido1, apellido 2, dni, fecha_nac, calle, localidad, sexo (H o M).
● Añade n filas a la tabla personas con un nombre obtenido aleatoriamente de la
tabla de nombres de hombre o de la tabla de nombres de mujer.
● Devuelve el último número de persona que se ha generado al insertar las
nuevas filas.
Para realizar los tres requerimientos anteriores deberás seguir los pasos que se indican
a continuación:
*/

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `generar_nombres`(IN n INT,OUT ultimo INT)
BEGIN

DECLARE i INT;
DECLARE nmaxhombre FLOAT;
DECLARE nmaxmujer FLOAT;
DECLARE aleat1 FLOAT;
DECLARE aleat2 INT;
DECLARE nomaleat VARCHAR(25);

CREATE TABLE IF NOT EXISTS personas (
    num INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25),
    apellido1 VARCHAR(25),
    apellido2 VARCHAR(25),
    dni CHAR(9),
    fecha_nac DATE,
    direccion VARCHAR(50),
    localidad VARCHAR(70),
    sexo CHAR(1)
);

SELECT MAX(hasta)INTO nmaxhombre FROM nombreshombre;
SELECT MAX(hasta) INTO nmaxmujer FROM nombresmujer;

SET i=0;

WHILE i<n DO
SET aleat1=rand();
	IF aleat1<0.5 THEN SET aleat2=floor(rand()*nmaxmujer);
		SELECT nombre INTO nomaleat FROM nombresmujer WHERE aleat2 >= desde AND aleat2 < hasta;
		INSERT INTO personas(nombre, sexo) VALUES (nomaleat,'M');
	ELSE SET aleat2=floor(rand()*nmaxhombre);
		SELECT nombre INTO nomaleat FROM nombreshombre WHERE aleat2 >= desde AND aleat2 < hasta;
		INSERT INTO personas(nombre, sexo) VALUES (nomaleat,'H');
	END IF;
	SET i=i+1;
END WHILE;

SET ultimo=(SELECT max(num) FROM personas);

END
*/

/*3.- Ejecuta el procedimiento desde línea de comandos para que inserte 100 nombres
de personas y devuelva el último número de persona introducida en una variable
@numper:*/

CALL generar_nombres(100,@numper);

-- Obtén el último número de persona introducida
SELECT @numper;


-- 4.- Repite lo anterior para insertar 300 nuevos nombres de personas.

CALL generar_nombres(300,@numper);

/* 5.- Al comprobar el contenido de la tabla personas observarás que se ha producido un
error en los datos cargados. A todas las personas les hemos asignado el sexo `M`. */

/* MODIDFICADO
	ELSE SET aleat2=floor(rand()*nmaxhombre);
		SELECT nombre INTO nomaleat FROM nombreshombre WHERE aleat2 >= desde AND aleat2 < hasta;
		INSERT INTO personas(nombre, sexo) VALUES (nomaleat,'H');
*/

/* 6.- Ahora vamos a crear un nuevo procedimiento para poner apellidos a todas las
personas con números comprendidos entre el número mínimo y el máximo que se
pasen como parámetros (no vamos a poner nada para comprobar posibles errores). No
lo vamos a hacer en el editor de procedimientos sino con el cliente mysql o con el
editor de instrucciones SQL en Workbench. */

delimiter //
CREATE PROCEDURE carga_apellidos(IN inicio INT, IN fin INT)
BEGIN
	declare n int;
	declare n2 int;
	declare ape1 varchar(25);
	DECLARE ape2 VARCHAR(25);
	set n=inicio;
	while (n <=fin) do
		set n2=floor(rand()*65428);
		set ape1=(select apellido from apellidos where n2>=desde AND n2<hasta);
		set n2=floor(rand()*65428);
		set ape2=(select apellido from apellidos where n2>=desde AND n2<hasta);
		update personas set apellido1=ape1,apellido2=ape2 where num=n;
		set n=n+1;
	end while;
END//

delimiter ;

-- 7.- Envía al servidor el código del procedimiento
-- Ejecutado

-- 8.- Ejecuta el procedimiento para que se carguen los apellidos de las 100 primeras personas

CALL carga_apellidos(1,100);

-- 9.- Modifica el procedimiento para que los números aleatorios que se generan, lo hagan con respecto al valor máximo que hay en la columna hasta.

delimiter //
create PROCEDURE carga_apellidos(IN inicio INT, IN fin INT)
BEGIN
	declare n int;
	declare n2 int;
	declare ape1 varchar(25);
	DECLARE ape2 VARCHAR(25);
	set n=inicio;
	while (n <=fin) do
    -- modificado
		set n2=floor(rand()*(SELECT max(hasta) FROM apellidos));
		set ape1=(select apellido from apellidos where n2>=desde AND n2<hasta);
		set n2=floor(rand()*(SELECT max(hasta) FROM apellidos));
		set ape2=(select apellido from apellidos where n2>=desde AND n2<hasta);
	-- modificado
		update personas set apellido1=ape1,apellido2=ape2 where num=n;
		set n=n+1;
	end while;
END//
 
 delimiter ;
 
 /* 10.- Envía nuevamente el procedimiento al servidor y vuelve a ejecutar para que se
generen apellidos para las personas con números entre 50 y 300. */
 
CALL carga_apellidos(50,300);

