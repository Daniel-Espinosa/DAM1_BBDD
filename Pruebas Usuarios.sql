create database if not exists BaseDaniel;
-- crear Usuario con IP del aula
CREATE USER 'Javier'@'192.168.24.%' IDENTIFIED BY '1234';

-- borrar usuario
-- Drop user 'Javier'@'192.168.24.%'

-- Punto 3
-- permisos
	-- solo en la BBDD Basedaniel
	-- grant all on BaseDaniel.* to 'Javier'@'192.168.24.%';

	-- permiso para todo.
	grant all on *.* to 'Javier'@'192.168.24.%';

-- actualiza la tabla de privilegios
 FLUSH PRIVILEGES;
 
 -- Punto 4
 -- Establece que esa cuenta de usuario pueda hacer consultas sobre cualquier tabla de las bases de datos world.
CREATE USER 'Javier2'@'192.168.24.%' IDENTIFIED BY '1234';
GRANT SELECT on world.* to 'Javier2'@'192.168.24.%';

-- Punto 6
CREATE USER 'Javier3'@'192.168.24.24' IDENTIFIED BY '1234'; --
CREATE USER 'Javier3'@'192.168.24.10' IDENTIFIED BY '1234'; -- ip local host
-- drop user 'Javier3'@'192.168.24.10';
-- drop user 'Javier3'@'192.168.24.24';


-- Punto 8
GRANT insert, drop, alter, select on nba.* to 
'Javier3'@'192.168.24.10',
'Javier3'@'192.168.24.24';

