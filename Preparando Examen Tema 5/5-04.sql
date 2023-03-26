use nba;

/*1.- Obtén temporada, nombre, nombre de equipo y puntos por partido de todos los
jugadores de la NBA de procedencia española.*/

select jugadores.nombre,equipos.nombre,temporada,Puntos_por_partido from equipos inner join jugadores on equipos.nombre = Nombre_equipo
inner join estadisticas on jugador = codigo where procedencia = 'Spain';

/*2.- Consigue todos los cruces posibles entre equipos de la división Pacífico (el equipo
visitante y el local no pueden ser el mismo) usando producto cartesiano.*/

select l.nombre as eq_local,v.nombre as eq_visitante from equipos as l,equipos as v 
where l.nombre <> v.nombre and l.division = 'Pacific' and v.division = 'Pacific';

/*3.- Consigue los nombres, temporada y puntos por partido de los 5 jugadores de la
división Pacífico que más puntos por partido han metido. */
select jugadores.nombre,temporada,Puntos_por_partido from jugadores inner join estadisticas on codigo = jugador
inner join equipos on equipos.nombre = nombre_equipo where division = 'Pacific' order by Puntos_por_partido desc limit 5;

/*4.- Obtén el nombre, temporada, equipo y estadísticas de los jugadores de los Knicks
de la temporada 07/08 ordenados por puntos por partido*/
select Jugadores.nombre,temporada,equipos.nombre,estadisticas.* from jugadores inner join estadisticas on codigo = jugador
inner join equipos on equipos.nombre = Nombre_equipo where temporada = '07/08' and equipos.nombre = 'Knicks' order by Puntos_por_partido desc;

/*5.- ¿Quien es el jugador que más asistencias ha dado en un equipo de California?
(Pista: Ciudades de California con equipo: Sacramento, Los Angeles y Golden State)*/
select jugadores.nombre from jugadores inner join estadisticas on jugador =codigo inner join equipos on equipos.nombre = Nombre_equipo
where ciudad in ('Sacramento','Los Angeles','Golden State') order by Asistencias_por_partido desc limit 1;

/*6.- Obtén el equipo local, el equipo visitante, puntos local, puntos visitante y
temporada de los enfrentamientos entre equipos de la división Central.*/

select equipo_local, equipo_visitante, puntos_local,puntos_visitante,temporada from partidos 
inner join equipos as l on l.nombre=equipo_local inner join equipos as v on v.nombre = equipo_visitante
where l.Division = 'Central' and v.Division = 'Central';

/*7.- ¿De qué ciudad es el equipo que más puntos ha anotado como local (hay muchos
empatados)? ¿Y el que menos?*/

SELECT puntos_local, equipo_local, ciudad FROM equipos INNER JOIN partidos ON
equipo_local = nombre ORDER BY puntos_local DESC limit 1;

SELECT puntos_local, equipo_local, ciudad FROM equipos INNER JOIN partidos ON
equipo_local = nombre ORDER BY puntos_local ASC limit 1;

/*8.- Obtén el equipo y la ciudad del jugador con más rebotes de la conferencia este*/
select equipos.nombre,ciudad from equipos inner join jugadores on equipos.nombre = Nombre_equipo inner join estadisticas on codigo = jugador 
where Conferencia = 'East' order by Rebotes_por_partido desc limit 1;
