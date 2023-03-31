Use ejercicio1;

/*1. Obtén los nombres y puntos_por_partido de los jugadores de los Lakers y de los 
Clippers de la temporada 06/07, ordenados por los puntos por partido de mayor a 
menor.*/

select jugadores.nombre,Puntos_por_partido,equipos.nombre,temporada from jugadores inner join estadisticas on jugador = codigo inner join equipos on Nombre_equipo= equipos.nombre 
where temporada = '06/07' and equipos.nombre in ('Lakers','Clippers') order by Puntos_por_partido desc;

/*2. Obtén la ciudad del equipo que más puntos totales ha metido como local. Debes 
poner también los puntos totales y llamar a la columna “total_puntos”. */

select equipo_local,sum(puntos_local) as total_puntos,ciudad from partidos inner join equipos on nombre =equipo_local 
group by equipo_local order by total_puntos desc limit 1;

/*3. Obtén los nombres de equipos y el número de partidos en los que han metido más 
de 130 puntos como visitante contra los Magic ordenados de mayor a menor por 
dicho número de partidos.*/

-- repasar

select equipo_visitante,count(*) from partidos where equipo_local = 'Magic' group by equipo_visitante having puntos_visitante > 130;


/*4. Obtén los nombres, y la media de puntos como local de los equipos que metieron 
en la temporada 05/06 menos puntos como local de media que los Bulls (con 
subconsulta).*/

-- las mismas condiciones como local para ambos.

-- select interno
select avg(puntos_local) from partidos where temporada = '05/06' group by equipo_local having equipo_local = 'Bulls';
-- select completo
select equipo_local,avg(puntos_local) as media_puntos from partidos where temporada = '05/06' 
group by equipo_local having media_puntos < (select avg(puntos_local) from partidos  where temporada = '05/06' group by equipo_local having equipo_local = 'Bulls');

/*5. Obtén el nombre, los puntos por partido, el nombre del equipo y la temporada de 
todos los jugadores que metieron más puntos por partido que Tracy McGrady en 
la temporada 03/04 en la conferencia West (con subconsulta).*/
-- misma condicion para TracyMcgrady temporada 03/04

-- select interno
select Puntos_por_partido from estadisticas inner join jugadores on jugador = codigo where nombre = 'Tracy McGrady' and temporada = '03/04';
-- select completo equipos de la conferencia West.
select jugadores.nombre, Puntos_por_partido,equipos.nombre,temporada from jugadores inner join estadisticas on jugador = codigo inner join equipos on Nombre_equipo= equipos.Nombre 
where Conferencia = 'West' and Puntos_por_partido > (select Puntos_por_partido from estadisticas inner join jugadores on jugador = codigo where nombre = 'Tracy McGrady' and temporada = '03/04');
