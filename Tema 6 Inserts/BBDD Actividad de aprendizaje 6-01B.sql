-- Actividad de aprendizaje 6-01B
-- Base de datos NBA
use nbapruebasinserts;

/*1.- Inserta un nuevo equipo en la tabla equipos que sea de la conferencia ‘East’,
División ‘Atlantic’, ciudad Cantabria y Nombre Bisons.*/
-- insert con Values;
insert into equipos (nombre,ciudad,conferencia,division) values ("Bision","Cantabria","East","Atlantic");
-- insert con SET;
insert into equipos set nombre="Bison",ciudad="Cantabria",conferencia="East",division="Atlantic";

/*2.- Añade ahora dos equipos en una sola instrucción. Los datos serán los mismos de
antes menos las ciudades y nombres. Deberás introducir los Santander Estela y
Piélagos Pas.*/
insert into equipos (nombre,ciudad,conferencia,division) values 
("Estela","Santander","East","Atlantic"),
("Pas","Pielagos","East","Atlantic");

/*3.- Añade un jugador nuevo llamado Carlos Alocen, cuya procedencia es Zaragoza,
Altura 6-4, Peso 180, posición G y nombre_equipo=’Bulls’. Hazlo dando valores a todas
las columnas.
¿Qué ocurre?*/
-- como el "codigo" no es autoincremental tienes que introducirlo a mano y puede dar fallo si no sabes que codigo introducir
-- calculo que la pregunta se refiere a ese problema.
-- lo resolvemos haciendo un select interno para saber el codigo maximo y le sumanos 1
-- aunque esto es una chapuza ya que existen saltos en los codigos de los jugadores, aunque existen 432 jugadores registrados el ultimo codigo es el 613

insert into jugadores (codigo,nombre,Procedencia,Altura,Peso,Posicion,Nombre_equipo,archivofoto,foto) values
((select max(codigo)+1 from jugadores as t),"Carlos Alocen","Zaragoza","6-4",180,"G","Bulls",null,null);

/*4.- Añade un jugador nuevo llamado Carlos Alocen, cuya procedencia es Zaragoza,
Altura 6-4, Peso 180, posición G y nombre_equipo=’Racing’. Hazlo dando valores a
todas las columnas.
¿Qué ocurre?*/

/* no es necesario dar valor a todos los los valores salvo la primary 
Key ya que el resto de valores los permite a nulo incluida la Foreing Key 
Pero al querer introducirlo con un Nombre_Equipo (FK) que no existe en la tabla de equipos da error*/
-- que todos los campos de un jugaro tengan default a nulo es un poco chapuza...

insert into Jugadores (codigo,nombre,Procedencia,Altura,Peso,Posicion,Nombre_equipo) values
((select max(codigo)+1 from jugadores as t),"Carlos Alocen","Zaragoza","6-4",180,"G","Racing");

/*5.- Cambia la procedencia de todos los jugadores que hayan metido más de 30 puntos
por partido en alguna temporada. La procedencia de todos ellos debe ser Buque.*/

/* Aunque esto no es parte de los Inserts se realizaria con UPDATE*/
update jugadores inner join estadisticas on codigo = jugador set procedencia = "Buque" where Puntos_por_partido >30;
