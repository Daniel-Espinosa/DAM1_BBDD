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