use pruebamunicipiosU6;

/*1.- Con una sola instrucción, añade los datos de todas las localidades del municipio de id 20:*/

/*La Cueva. 740 hab
Pomaluengo. 972 hab.
Socobio. 259 hab.
Villabáñez. 681 hab */

select max(numero) from localidades where municipio = 20;
select if((select max(numero) from localidades where municipio = 20) is null,1,(select max(numero)+1 from localidades where municipio = 20));

start transaction;
insert into localidades (municipio,numero,nombre_loc,habitantes) values
(20,(select if((select max(numero) from localidades where municipio = 20) is null,1,(select max(numero)+1 from localidades where municipio = 20))),'La Cueva',740),
(20,(select if((select max(numero) from localidades where municipio = 20) is null,1,(select max(numero)+1 from localidades where municipio = 20))),'Pomaluengo',972),
(20,(select if((select max(numero) from localidades where municipio = 20) is null,1,(select max(numero)+1 from localidades where municipio = 20))),'Socobio',259),
(20,(select if((select max(numero) from localidades where municipio = 20) is null,1,(select max(numero)+1 from localidades where municipio = 20))),'Villabáñez',681);
commit;

insert into localidades (municipio,numero,nombre_loc,habitantes) values
(20,1,'La Cueva',740),
(20,2,'Pomaluengo',972),
(20,3,'Socobio',259),
(20,4,'Villabáñez',681);

/*Comprueba ahora con SELECT cuales son las localidades del municipio de nombre Castañeda*/
select localidades.* from localidades inner join municipios on id = municipio where nombre = 'Castañeda';

/*2.- Descarga el archivo de volcado de datos personas.csv que contiene información sobre
varias personas que hay que insertar en la tabla personas.
Carga en la tabla personas los datos de las personas almacenadas en el archivo. Para ello usa
la instrucción:
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/personas.csv' INTO
TABLE personas CHARACTER SET utf8mb4;
Deberás modificar la ubicación del archivo.*/

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/personas.csv' INTO TABLE personas CHARACTER SET utf8mb4;

/*3.- Añade ahora filas en la tabla concejales para indicar que las personas con id comprendido
entre 33 y 37, ambos incluidos, son concejales en el municipio número 20 por el partido AMC.*/

insert into concejales(idpers,partido,municipio) select idpers,'AMC',20 from personas where idpers between 33 and 37;

/*4.- Añade ahora una fila en la tabla rige para indicar que la alcaldesa del municipio número 20
es la persona de id 35 desde el 27 de junio de 2015*/

insert into rige (alcalde,municipio,fini,partido) values (35,20,20150627,'AMC');

/*5.- Establece que la anterior alcaldesa ha dejado de serlo hoy mismo.*/
update rige set ffin = current_date() where alcalde = 35 and municipio = 20  and fini = 20150627 and ffin is null;

/*6.- El resto de instrucciones debes realizarlas dentro de una transacción que anularás al final
de la actividad.
Incrementa en el 12% los habitantes de todas las localidades del municipio número 20.*/

Start transaction;
update localidades set habitantes = habitantes * 1.12 where municipio = 20;

/*7.- Establece para la alcaldesa que inicio su mandato en el municipio número 12 en el año
2011, que la fecha de inicio y fecha de finalización del mandato fueron una semana más tarde
del día que tienen registrado actualmente.*/

select * from rige where municipio = 12 and year(fini) = 2011;
update rige set fini = date_add(fini, interval -1 week), ffin = date_add(ffin, interval -1 week) where municipio = 12 and year(fini) = 2011;

/*8.- Elimina todas las localidades con población cero*/

set sql_safe_updates = 0;
delete from localidades where habitantes = 0;
set sql_safe_updates = 1;

/*9.- Elimina en la tabla personas todas las personas que tengan menos de 18 años actualmente*/
select * from personas where (year(current_date()) - a_nac) < 18;
set sql_safe_updates = 0;
delete from personas where (year(current_date()) - a_nac) < 18;
set sql_safe_updates = 1;

/*10.- Elimina en la tabla personas todas las personas nacidas en 1962, 1982, 1992 o 1993.
Explica lo que ocurre.alter
Establece que se eliminen las personas que no producen error de eliminación.*/
-- no puede borrar ya que hay personas con FK a otras tablas.
set sql_safe_updates = 0;
delete from personas where a_nac in (1962,1982,1992,1993);
-- con esto permite borrar las personas que no se ven afectadas por la FK
delete ignore from personas where a_nac in (1962,1982,1992,1993);

rollback;
set sql_safe_updates = 1