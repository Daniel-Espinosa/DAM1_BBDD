use ligatercera;
/*Dado que los objetivos principales de esta actividad se centran en usar funciones de
agrupamiento y agrupar resultado, en las instrucciones que pudieras resolverlas
usando DISTINCT o LIMIT, no podrás usar esas cláusulas.*/

/*1.- Obtén todas las localidades en las que hay equipos en la liga.*/
select localidad from equipos group by localidad order by localidad;

/*2.- Obtén cuantos partidos se han jugado, es decir, cuantos partidos tienen resultado.*/
select count(golesloc) from partidos;

/*3.- Obtén en la tabla goles cuantos goles se han marcado en total y cuantos en propia
puerta*/
select count(numfila)as total_goles,sum(pp) as goles_PP from goles;

/*4.- Obtén los alias y nombres de equipos de los jugadores que han marcado goles. No
deben salir repetidos los jugadores.*/
select alias,equipos.nombre from jugadores inner join goles on Jugador=numjug inner join equipos on codeq=equipo group by numjug;

/*5.- Obtén cuantos centrocampistas tiene el equipo de nombre S.D. Textil Escudo.*/
select count(*) from jugadores inner join equipos on codeq = equipo where puesto = 'centrocampista' and equipos.nombre = 'S.D. Textil Escudo';

/*6.- Obtén cuantos goles en total se han obtenido en cada partido de la jornada 1 y los
nombres de equipos que los jugaron*/
select l.nombre as eq_local, v.nombre as eq_visitante,(golesloc+golesvis) as Total_Goles_Partido from partidos 
inner join equipos as l on l.codeq = eqloc inner join equipos as v on v.codeq = eqvis where numjornada = 1;

/*7.a.- Obtén cuantos goles en total se marcaron en la jornada número 2.*/
select sum(golesloc+golesvis) as total_goles from partidos where numjornada = 2;

/*7.b.- Obtén cuantos goles en total se han marcado en cada jornada. En cada fila debe
salir el número de jornada y el número total de goles.*/
select numjornada,sum(golesloc+golesvis) from partidos group by numjornada;

/*8.a.- Obtén el jugador más joven, entre los que tienen registrada fecha de nacimiento,
del equipo de nombre S.D. Laredo. Debe salir el nombre y apellidos, el alias, el puesto
y la fecha de nacimiento.*/
-- se necesita un select interno para que no de error el resultado.
-- select interno 
select max(fechanac) from jugadores inner join equipos on equipo = codeq where equipos.nombre = 'S.D Laredo';

select jugadores.nombre,apellidos,alias,puesto,fechanac from jugadores inner join equipos on equipo=codeq 
where equipos.nombre = 'S.D Laredo' and 
fechanac = (select max(fechanac) from jugadores inner join equipos on equipo = codeq where equipos.nombre = 'S.D Laredo') ;

/*8.b.- Obtén el jugador más joven, entre los que tienen registrada fecha de nacimiento,
de cada equipo. Debe salir el nombre del equipo, y el nombre y apellidos, el alias, el
puesto y la fecha de nacimiento del jugador más joven.*/
-- select interno
select max(fechanac) as CImaxFechanac,equipo as CIequipo from jugadores inner join equipos on codeq = equipo where fechanac is not null group by codeq;

select jugadores.nombre,apellidos,alias,puesto,fechanac,equipos.nombre from jugadores inner join equipos on equipo = codeq 
inner join (select max(fechanac) as CImaxFechanac,equipo as CIequipo from jugadores inner join equipos on codeq = equipo where fechanac is not null group by codeq) as consultaInterna 
on CIequipo = equipo and fechanac = CImaxFechanac; 

/*9.- Obtén el nombre y apellidos del jugador más joven de la liga y el equipo al que
pertenece*/
-- select interno
select max(fechanac) from jugadores;
-- select final
select jugadores.nombre,apellidos,equipos.nombre from equipos inner join jugadores on equipo = codeq where fechanac= (select max(fechanac) from jugadores);

/*10.- Obtener en cuantos partidos la diferencia de goles entre un equipo y el otro fue
superior a dos goles. */
select count(*) from partidos where (golesloc-golesvis)>2 or (golesvis-golesloc) >2;
