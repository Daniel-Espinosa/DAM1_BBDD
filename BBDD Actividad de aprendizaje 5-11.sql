use nba;
/*1 Obten los puntos por partidos del jugador con mas puntos de la temporada 07/08 y que su peso sea mayor a 285  */
select puntos_por_partido from estadisticas where jugador in (select codigo from jugadores where peso>285) 
and temporada='07/08' order by puntos_por_partido desc limit 1;

/*2 Obten el nombre de los equipos que jugaron como visitantes y los puntos que anotaron 
del equipo con el jugador mas alto ordenalo por numero de puntos de mayor a menor*/
/* del equipo con el jugador mas alto*/
select equipo_visitante,puntos_local from equipos inner join partidos on
nombre=equipo_local where nombre=(select nombre_equipo from jugadores order
by altura desc limit 1) order by puntos_local desc;

(select nombre_equipo,altura from jugadores order
by altura desc limit 1);

/*3 Obten el nombre del jugador que no ha jugado partidos y que pesa menos*/
-- dato curioso si dos jugadores pesan lo mismo solo veras 1...
select nombre from jugadores left join estadisticas on jugador=codigo where
puntos_por_partido is null order by peso limit 1 ;

/*4 Obten nombre, temporada, nombre del equipo y asistencias por partido de los jugadores de los lakers en la temporada 03/04 ordenado de mayor a menor asistencias*/
select jugadores.nombre,temporada,nombre_equipo,asistencias_por_partido from
jugadores inner join estadisticas on codigo = jugador where temporada='03/04' and
nombre_equipo='lakers' order by asistencias_por_partido desc;

/*5 Obten nombre, temporada, puntos por partido y nombre del equipo del jugador con mayor 
puntos por partidos de los equipos de Texas (las ciudades de Texas son Dallas, San Antonio y Houston)*/
select jugadores.nombre,temporada,puntos_por_partido,nombre_equipo from
jugadores inner join equipos on equipos.nombre = jugadores.nombre_equipo inner
join estadisticas on codigo = jugador where ciudad = 'dallas' or ciudad = 'san antonio'
or ciudad = 'houston' order by puntos_por_partido desc limit 1;

/*6 Obten la ciudad, nombre del equipo, nombre del jugador y los puntos por partidos del Jugador que mas puntos anoto en la Temporada 07/08 de cada equipo*/
select equipos.ciudad,jugadores.nombre_equipo,jugadores.nombre,puntos_por_partido
from estadisticas inner join jugadores on jugador=codigo inner join (select
max(puntos_por_partido) as maximo,nombre_equipo from estadisticas inner join
jugadores on jugador=codigo where temporada='07/08' group by nombre_equipo) as
t on jugadores.nombre_equipo=t.nombre_equipo inner join equipos on
t.nombre_equipo=equipos.nombre where temporada='07/08' and
maximo=puntos_por_partido;

-- consulta interna
/* el maximo de puntos anotados por el cada equipo en la temporada 07/08*/
(select max(puntos_por_partido) as maximo,nombre_equipo from estadisticas inner join
jugadores on jugador=codigo where temporada='07/08' group by nombre_equipo);