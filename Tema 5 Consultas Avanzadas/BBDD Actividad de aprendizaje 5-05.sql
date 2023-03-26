use ligatercera;

-- 1.- Obtén todas las localidades en las que hay equipos en la liga.
select localidad from equipos group by localidad;

-- 2.- Obtén cuantos partidos se han jugado, es decir, 
-- cuantos partidos tienen resultado.
select count(golesloc) from partidos;


-- 3.- Obtén en la tabla goles cuantos goles se han marcado 
-- en total y cuantos en propia
-- puerta. Realizar dos consultas, una para cada caso
select count(numfila) from goles;

select count(pp) from goles where pp <> 0;

-- 4.- Obtén los alias y nombres de equipos de los 
-- jugadores que han marcado goles. No
-- deben salir repetidos los jugadores.

select alias,equipos.nombre from jugadores inner join equipos 
on equipo = codeq  inner join goles on Jugador = numjug 
group by alias,equipos.nombre;

-- 5.- Obtén cuantos centrocampistas tiene el equipo de nombre 
-- S.D. Textil Escudo.
select count(*) from jugadores inner join equipos on equipo = codeq 
where equipos.nombre = 'S.D. Textil Escudo' 
and puesto = 'centrocampista';

-- 6.- Obtén cuantos goles en total se han obtenido en cada 
-- partido de la jornada 1 y los
-- nombres de equipos que los jugaron.
select golesloc+golesvis as goles,l.nombre as eq_local,v.nombre as eq_visitante 
from partidos inner join equipos as l on l.codeq= eqloc inner join
 equipos as v on v.codeq = eqvis where numjornada = 1;

-- 7.a.- Obtén cuantos goles en total se marcaron en la jornada 
-- número 2.
select count(numfila) from goles where jornada = 2;

-- 7.b.- Obtén cuantos goles en total se han marcado en cada jornada. 
-- En cada fila debe
-- salir el número de jornada y el número total de goles
select jornada,count(*) from goles group by jornada;

/* 8.a.- Obtén el jugador más joven, entre los que tienen registrada fecha de nacimiento,
del equipo de nombre S.D. Laredo. Debe salir el nombre y apellidos, el alias, el puesto
y la fecha de nacimiento.*/


select jugadores.nombre,apellidos,alias,puesto,fechanac from jugadores inner join equipos on equipo = codeq and fechanac = (select max(fechanac) from jugadores where equipos.nombre = 'S.D Laredo');

select jugadores.nombre,apellidos,alias,puesto,max(fechanac) from jugadores inner join equipos on equipo = codeq 
where equipos.nombre = 'S.D Laredo';

-- lo logramos!
select jugadores.nombre,apellidos,alias,puesto,fechanac from jugadores 
where fechanac = (select max(fechanac) from jugadores inner join 
equipos on equipo = codeq where equipos.nombre = 'S.D Laredo');

-- 

/*8.b.- Obtén el jugador más joven, entre los que tienen registrada fecha de nacimiento,
de cada equipo. Debe salir el nombre del equipo, y el nombre y apellidos, el alias, el
puesto y la fecha de nacimiento del jugador más joven.
*/

-- la buena
select equipos.nombre,jugadores.nombre,apellidos,alias,puesto,fechanac from jugadores inner join equipos on equipo = codeq
where fechanac in (select max(fechanac) from jugadores inner join equipos on equipo = codeq group by equipos.nombre having max(fechanac) is not null);

select equipos.nombre,jugadores.nombre,apellidos,alias,puesto,fechanac from jugadores inner join equipos on equipo = codeq
where fechanac in (select max(fechanac) from jugadores group by equipo having max(fechanac) is not null);

select equipos.nombre,jugadores.nombre,apellidos,alias,puesto,fechanac from jugadores inner join equipos on equipo = codeq
where fechanac in (select max(fechanac) from jugadores group by equipo having max(fechanac) is not null);

select equipos.nombre,jugadores.nombre,apellidos,alias,puesto,fechanac from jugadores inner join equipos on equipo = codeq
where equipo = (select equipo from jugadores where fechanac in (select max(fechanac) from jugadores) group by equipo) ;

select jugadores.nombre,apellidos,alias,puesto,fechanac from jugadores 
where fechanac = (select max(fechanac) from jugadores inner join equipos on equipo = codeq order by equipo);


-- yuju!
select jugadores.nombre,apellidos,alias,puesto,fechanac,equipos.nombre from jugadores inner join 
(select max(fechanac) as fecha,equipo as eq from jugadores group by equipo having max(fechanac)) 
as sub on fechanac=sub.fecha and jugadores.equipo=sub.eq inner join equipos on sub.eq=codeq ;

-- esto saca las fechas con el equipo suelto. con le having te quita las fechas nulas.
select max(fechanac),equipo from  jugadores group by equipo having max(fechanac);

select jugadores.nombre,apellidos,alias,puesto,fechanac,equipos.nombre as Equipo_nombre from jugadores inner join
(select max(fechanac) as fecha, equipo as equi from jugadores group by equipo) as subtabla on fechanac=subtabla.fecha and equipo=subtabla.equi
 inner join equipos on codeq = equipo;

/* 9.- Obtén el nombre y apellidos del jugador más joven de la liga y el equipo al que
pertenece.*/

select jugadores.nombre,apellidos,equipos.nombre as Equipo_Nombre,fechanac from jugadores inner join equipos on equipo = codeq 
where fechanac = (select max(fechanac) from jugadores);

/* 10.- Obtener en cuantos partidos la diferencia de goles entre un equipo y el otro fue
superior a dos goles.*/

select count(*) from partidos where golesloc-golesvis >2 or golesvis-golesloc>2;

/*
use alquileres;
select matricula from contratos where ffin is null union select matricula from automoviles where marca="renault";

select contratos.matricula from contratos inner join automoviles on contratos.matricula = automoviles.matricula where ffin is null or marca = "Renault";
*/