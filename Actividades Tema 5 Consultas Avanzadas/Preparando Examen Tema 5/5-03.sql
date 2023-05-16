Use ligatercera;

/*1.- Obtén los nombres, apellidos y alias de los jugadores del equipo de nombre S.D.
TEXTIL ESCUDO realizando un producto cartesiano entre las tablas jugadores y
equipos.*/

select jugadores.nombre,apellidos,alias from jugadores,equipos where equipo = codeq and equipos.nombre = 'S.D. TEXTIL ESCUDO';

/*2.- Obtén el resultado del producto cartesiano completo entre la tabla equipos y la
misma tabla equipos. Hay que hacer un renombrado en las dos tablas.*/
select * from equipos as equipos1, equipos as equipos2;

/*3.- Sobre la consulta anterior, establece que en el resultado salga una columna con el
nombre de equipo local y otra con el nombre del equipo visitante y que en cada fila no
se pueda repetir el equipo, es decir, que el nombre del equipo local no puede ser igual
al nombre del equipo visitante.*/
select l.nombre as local,v.nombre as visitante from equipos as l, equipos as v where l.nombre <> v.nombre;

/*¿Cómo se obtendría el mismo resultado usando INNER JOIN?*/

select l.nombre as eq_local, v.nombre as eq_visitante from equipos as l inner join equipos as v on l.codeq <> v.codeq;

/*4.- Obtén los datos de todos los porteros de la liga junto con el nombre de los equipos
en los que juegan.*/

select numjug,alias,jugadores.nombre,apellidos,fechanac,goles,tarj_amarillas,tarj_rojas,equipo,puesto,equipos.nombre from jugadores
inner join equipos on equipo = codeq where puesto = 'portero';

/*5.- Obtén los datos de la clasificación escribiendo el nombre de cada equipo y no su
código. La clasificación debe salir ordenada descendentemente por puntos y, a
igualdad de puntos, por diferencia de goles.*/

select nombre,pj,pg,pe,gf,gc,puntos from equipos inner join clasificacion on clasificacion.codeq = equipos.codeq order by puntos desc, gf-gc desc;

/*6.- Obtén los datos de la clasificación de los cuatro primeros clasificados en la liga,
escribiendo el nombre de cada equipo y no su código.*/

select nombre,pj,pg,pe,gf,gc,puntos from equipos inner join clasificacion on clasificacion.codeq = equipos.codeq order by puntos desc, gf-gc desc limit 4;

/*7.- Obtén los datos de la clasificación de los equipos de Torrelavega, Santander o
Laredo, escribiendo el nombre de cada equipo y no su código.*/

select nombre,pj,pg,pe,gf,gc,puntos from equipos inner join clasificacion on clasificacion.codeq = equipos.codeq 
where localidad in ('Santander','Torrelavega','laredo') order by puntos desc, gf-gc desc;

/*8.- Obtén los resultados que ha obtenido el Club Deportivo Cayón jugando como local*/
select numjornada,numpartido,eqvis,golesloc,golesvis,fecha from partidos inner join equipos on codeq = eqloc where nombre = 'Club Deportivo Cayón';

/*9.- De todos los jugadores que han metido algún gol, obtener el nombre del jugador, el
nombre del equipo, la jornada y si lo ha metido o no en propia puerta.*/
select jugadores.nombre,apellidos,equipos.nombre,jornada,pp from jugadores inner join goles on jugador = numjug inner join equipos on equipo = codeq;

/*10.- Obtén los resultados de los partidos jugados en agosto, escribiendo los nombres
de los equipos y no sus códigos.*/

select l.nombre as eq_local ,golesloc,v.nombre as eq_visitante,golesvis,fecha,numjornada,numpartido from partidos 
inner join equipos as l on eqloc= l.codeq inner join equipos as v on eqvis =v.codeq where month(fecha) = 8; 