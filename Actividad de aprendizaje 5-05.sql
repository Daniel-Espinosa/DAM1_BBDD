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

-- Actividad 6-06

/* 1.- Obtén los nombres de los equipos que tienen menos de 11 jugadores registrados*/
select equipos.nombre from equipos inner join jugadores on codeq = equipo group by equipo having count(*)<11;

/*2.- Obtén los nombres de los equipos que tienen registrados 2 porteros.*/
select equipos.nombre from equipos inner join jugadores on codeq = equipo where puesto = 'portero' group by equipo having count(puesto) = 2;

/*3.- Obtén, a partir de la tabla goles, cuantos goles se han marcado en cada jornada.*/
select jornada,count(*) from goles group by jornada;

/*4.- Obtén, a partir de la tabla goles, las jornadas en las que se han marcado más de 25
goles*/
select jornada,count(*) from goles group by jornada having count(*)>25;

/*5.- Obtén, a partir de la tabla partidos, cuantos goles ha marcado cada equipo jugando
como local. Debe salir el nombre del equipo junto con el total de goles sólo si el total
de goles es mayor que 4.*/
select nombre,sum(golesloc) from partidos inner join equipos on codeq = eqloc group by codeq;
select nombre,sum(golesvis) from partidos inner join equipos on codeq = eqloc group by codeq;


/*6.a.- Obtén los nombres de los equipos contra los que ha jugado el S.D. Barreda
jugando como local. No deben salir datos de partidos no jugados (golesloc a null).*/
select v.nombre from partidos inner join equipos as v on v.codeq = eqvis inner join equipos as l on l.codeq = eqloc 
where l.nombre = 'S.D. Barreda BP.' and golesloc is not null;

/*6.b.- Obtén los nombres de los equipos contra los que ha jugado el S.D. Barreda
jugando como visitante. No deben salir datos de partidos no jugados.*/
select l.nombre from partidos inner join equipos as l on l.codeq = eqloc inner join equipos as v on v.codeq= eqvis 
where v.nombre = 'S.D. Barreda BP.' and golesloc is not null;

/*7.a.- Obtén los nombres de los equipos contra los que ha jugado el S.D. Barreda. Para
realizarlo debes utilizar las instrucciones de los ejercicios 6.a y 6.b.*/
select v.nombre from partidos inner join equipos as v on v.codeq = eqvis inner join equipos as l on l.codeq = eqloc where l.nombre = 'S.D. Barreda BP.' and golesloc is not null 
union select l.nombre from partidos inner join equipos as l on l.codeq = eqloc inner join equipos as v on v.codeq= eqvis where v.nombre = 'S.D. Barreda BP.' and golesloc is not null;

/*7.b.- Obtén los nombres de los equipos contra los que ha jugado el S.D. Barreda, el
número de jornada del partido, los goles que metió, los que recibió y si jugó como local
o como visitante. El resultado debe salir ordenado por número de jornada.*/

-- sin terminar
select v.nombre,numjornada,golesloc from partidos inner join equipos as v on v.codeq = eqvis inner join equipos as l on l.codeq = eqloc where l.nombre = 'S.D. Barreda BP.' and golesloc is not null 
union select l.nombre,numjornada from partidos inner join equipos as l on l.codeq = eqloc inner join equipos as v on v.codeq= eqvis where v.nombre = 'S.D. Barreda BP.' and golesloc is not null;

-- ok con dudas
select numjornada,l.nombre,v.nombre,golesloc,golesvis from partidos inner join equipos as l on l.codeq = eqloc 
inner join equipos as v on v.codeq =eqvis where (l.nombre = 'S.D. Barreda BP.' or v.nombre = 'S.D. Barreda BP.') and golesloc is not null;

/*8.- Obtén el número total de goles que ha marcado el Club Deportivo Cayón jugando
como local y el número total de goles que ha marcado jugando como visitante.*/
select sum(golesloc),sum(golesvis) from partidos inner join equipos as l on l.codeq = eqloc 
inner join equipos as v on v.codeq =eqvis where (l.nombre = 'Club Deportivo Cayón' or v.nombre = 'Club Deportivo Cayón');

/*9.- Obtén el número total de goles que ha marcado cada equipo jugando como local y
el número total de goles que ha marcado cada equipo jugando como visitante. El
resultado debe estar ordenado alfabéticamente por nombre de equipo.*/
/*
select l.nombre,sum(golesloc),sum(golesvis) from partidos inner join equipos as l on l.codeq =eqloc inner join equipos as v on v.codeq = eqvis group by l.nombre;

select v.nombre,sum(golesloc),sum(golesvis) from partidos inner join equipos as l on l.codeq =eqloc inner join equipos as v on v.codeq = eqvis group by v.nombre;

select nombre,sumagolesloc,sumagolesvis from partidos inner join equipos as l on eqloc=l.codeq inner join equipos as v on v.codeq=eqvis where sumagolesloc;

select nombre,sum(golesloc)+v.g_vis,sum(golesvis)+v.g_loc from partidos inner join equipos as l on l.codeq =eqloc group by nombre union select nombre,sum(golesvis)as v.g_loc,sum(golesloc)as v.g_vis from partidos inner join equipos as v on v.codeq =eqvis group by nombre;

select nombre,l.golesloc,v.golesvis from equipos inner join partidos as l on codeq = l.eqloc inner join partidos as v on codeq = v.eqvis where v.eqvis<>l.eqloc;
*/
-- En teoria esta es la buena

select nombre, 'Local' as Local_Visitante,sum(golesloc) as total_goles from partidos inner join equipos on codeq = eqloc group by codeq union
select nombre, 'Visitante' as Local_Visitante,sum(golesvis) as total_goles from partidos inner join equipos on codeq = eqvis group by codeq order by nombre;

/*10.- Obtén cuantos jugadores de cada equipo no han marcado goles. Recuerda que
una forma de obtener los jugadores que no han marcado goles es realizar un LEFT JOIN
entre la tabla JUGADORES y la tabla GOLES. */
select equipos.nombre,count(*) from jugadores left join goles on numjug=Jugador inner join equipos on codeq=equipo where jugador is null group by equipos.nombre;