/*
Actividad de aprendizaje 8-01

Se trata de:
● Manipular variables de sistema y variables de estado.

Objetivos:
● Obtener el valor de variables de sistema.
● Modificar valor de variables de sistema.
● Diferenciar entre variables de sistema de sesión y variables de sistema globales.
● Obtener el valor de variables de estado.
● Diferenciar entre variables de estado locales y globales.
● Crear, modificar y consultar variables de usuario. Procedimiento
*/

-- 1.- Obtén un listado con todas las variables de sistema de sesión
show session variables;

-- 2.- Obtén un listado con todas las variables de sistema globales
show global variables;

/* 3.- Modifica las variables de sistema que controlan el valor inicial de una columna
autoincrement y el valor del incremento para que sean 5 y 10 respectivamente, */

set auto_increment_offset = 5;
set auto_increment_increment = 10;

/* 4- Crea una tabla con dos columnas num y nombre donde num es PRIMARY KEY
numérica y autoincrementada. */
Create database aa8_1;
use aa8_1;
create table tabla_prueba(
num int(5) unsigned auto_increment,
nombre varchar(25),
primary key (num)
);

/* 5.- Inserta tres nuevos registros en la tabla comprobando que se insertan de acuerdo a
la configuración dada para el valor inicial y de incremento de autoincrement.*/
insert into tabla_prueba(nombre) values
('Daniel'),
('Ramiro'),
('Albano');

-- 6.- Obtén el valor de las variables de estado locales y globales.
show status;
show global status;

-- 7.- Obtén el número de consultas que han sido enviadas al servidor desde la sesión cliente.
show status like 'Questions'; 
show global status like 'Questions';

/* 8.- Obtén cuantos bytes han sido recibidos por el servidor y emitidos por el cliente desde
la sesión cliente en que estás trabajando. */
show status like 'Bytes_received'; 
show status like 'Bytes_sent'; 

/* 9.- Realiza una consulta de todos los datos de una tabla de la BD que tengas abierta.
Repite las tareas 7 y 8. */

SELECT * FROM aa8_1.tabla_prueba;
-- se obserba como se incrementan los valores de las Questions y Bytes recividos y enviados.

-- 10.- Cierra la sesión cliente e inicia una nueva
-- Done

/* 11.- Obtén cual es el valor de las variables de sistema de sesión que controlan el valor
inicial y el incremento de una columna autoincrement y valora lo que ha ocurrido. */

select @@auto_increment_offset, @@auto_increment_increment;
-- como solo era para la sesion al reiniciar la sesion los valores vuelven al estado inicial

-- 12.- Repite las tareas 7 y 8 y valora lo que ha ocurrido
	-- 7.- Obtén el número de consultas que han sido enviadas al servidor desde la sesión cliente.
	show status like 'Questions'; 
	show global status like 'Questions';

	/* 8.- Obtén cuantos bytes han sido recibidos por el servidor y emitidos por el cliente desde
	la sesión cliente en que estás trabajando. */
	show status like 'Bytes_received'; 
	show status like 'Bytes_sent';
    
-- como solo era para la sesion al reiniciar la sesion los valores vuelven al estado inicial

/* 
13.- Abre la base de datos concursomusica. Carga en dos variables de usuario el nombre
y apellidos de un usuario cualquiera de la tabla usuarios (el que quieras). Carga en una
variable de usuario el título de una canción. A partir de aquí y usando más variables, si
así lo quieres para obtener por ejemplo el número de la canción, escribe las
instrucciones necesarias para:
● Insertar el voto del usuario.
● Incrementar en uno los votos del usuario.
● Incrementar en uno los votos de la canción.
*/
use concursomusica;
start transaction;
SET SQL_SAFE_UPDATES = 0;
set @u='02Ana';
set @t='Cientos y cientos';
update usuarios set total_votos = total_votos - 1 where user = @u;
update canciones set total_votos = total_votos - 1 where titulo = @t;
select numCancion from canciones where titulo = @t;
rollback;


-- 14.- Consulta el valor de las variables de estado que indican, para la sesión actual:
-- ● El número de instrucciones select ejecutadas.
show status like 'com_select';
-- ● El número de instrucciones insert ejecutadas.
show status like 'com_insert';
-- ● El número de instrucciones update ejecutadas.
show status like 'com_update';
-- ● El número de instrucciones set ejecutadas.
show status like 'com_set_option';
-- ● El número de instrucciones create table ejecutadas.
show status like 'com_create_table';