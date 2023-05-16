use Ligatercera;
/*Dado que los objetivos principales de esta actividad se centran en usar funciones de
agrupamiento y agrupar resultado, en las instrucciones que pudieras resolverlas
usando DISTINCT o LIMIT, no podrás usar esas cláusulas.*/

/*1.- Obtén los nombres de los equipos que tienen menos de 11 jugadores registrados.*/
select equipos.nombre from equipos inner join jugadores on equipo = codeq group by codeq having count(*)<11;

/*2.- Obtén los nombres de los equipos que tienen registrados 2 porteros.*/
select equipos.nombre from equipos inner join jugadores on codeq = equipo where puesto = 'portero' group by codeq having count(*)=2;

/*3.- Obtén, a partir de la tabla goles, cuantos goles se han marcado en cada jornada.*/
select count(*),jornada from goles group by jornada;

/*4.- Obtén, a partir de la tabla goles, las jornadas en las que se han marcado más de 25
goles.*/

select jornada from goles group by jornada having count(numfila)>25;

/*5.- Obtén, a partir de la tabla partidos, cuantos goles ha marcado cada equipo jugando
como local. Debe salir el nombre del equipo junto con el total de goles sólo si el total
de goles es mayor que 4.*/

select equipos.nombre,sum(golesloc) as total_goles from partidos inner join equipos on codeq = eqloc group by codeq having total_goles >4;

/*6.a.- Obtén los nombres de los equipos contra los que ha jugado el S.D. Barreda
jugando como local. No deben salir datos de partidos no jugados (goleloc a null).*/

select equipos.nombre from equipos inner join partidos on eqvis = codeq where eqloc = (select codeq from equipos where equipos.nombre = 'S.D. Barreda BP.') and golesloc is not null;

/*7.a.- Obtén los nombres de los equipos contra los que ha jugado el S.D. Barreda. Para
realizarlo debes utilizar las instrucciones de los ejercicios 6.a y 6.b.*/
select equipos.nombre from equipos inner join partidos on eqvis = codeq where eqloc = (select codeq from equipos where equipos.nombre = 'S.D. Barreda BP.') and golesloc is not null union
select equipos.nombre from equipos inner join partidos on eqloc = codeq where eqvis = (select codeq from equipos where equipos.nombre = 'S.D. Barreda BP.') and golesvis is not null;

/*7.b.- Obtén los nombres de los equipos contra los que ha jugado el S.D. Barreda, el
número de jornada del partido, los goles que metió, los que recibió y si jugó como local
o como visitante. El resultado debe salir ordenado por número de jornada.*/
select numjornada,nombre as 'rival del Barreda',golesvis as goles_barreda, golesloc as goles_en_contra, 'visitante' as 'Local/visitante' from equipos inner join partidos on codeq = eqloc where eqvis = (select codeq from equipos where equipos.nombre = 'S.D. Barreda BP.') and golesloc is not null 
union
select numjornada,nombre,golesloc, golesvis, 'local' as 'Local/visitante' from equipos inner join partidos on codeq = eqvis where eqloc = (select codeq from equipos where equipos.nombre = 'S.D. Barreda BP.') and golesloc is not null
order by numjornada;

/*8.- Obtén el número total de goles que ha marcado el Club Deportivo Cayón jugando
como local y el número total de goles que ha marcado jugando como visitante.*/
-- no permite hacer dos tablas y refundirlo en una sola linea... nos toca hacerlo con union.
select sum(golesloc) as 'Total goles' ,'local' as 'local/visitante' from partidos inner join equipos on codeq= eqloc where equipos.nombre = 'Club Deportivo Cayón'
union
select sum(golesvis), 'visitante' from partidos inner join equipos on codeq = eqvis where equipos.nombre = 'Club Deportivo Cayón';

/*9.- Obtén el número total de goles que ha marcado cada equipo jugando como local y
el número total de goles que ha marcado cada equipo jugando como visitante. El
resultado debe estar ordenado alfabéticamente por nombre de equipo.*/
select nombre,sum(golesloc) as 'Total goles' ,'local' as 'local/visitante' from partidos inner join equipos on codeq= eqloc group by eqloc
union
select nombre,sum(golesvis), 'visitante' from partidos inner join equipos on codeq = eqvis group by eqvis
order by nombre;

/*10.- Obtén cuantos jugadores de cada equipo no han marcado goles. Recuerda que
una forma de obtener los jugadores que no han marcado goles es realizar un LEFT JOIN
entre la tabla JUGADORES y la tabla GOLES. */
select count(*),equipos.nombre from jugadores left join goles on numjug = jugador inner join equipos on equipo = codeq where numfila is null group by codeq;

