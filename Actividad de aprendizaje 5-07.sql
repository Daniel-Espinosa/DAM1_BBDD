Use concursomusica;
/*1.- A partir del contenido de la tabla votos, obtén cuántos votos tiene cada canción que
ha sido votada. Se deben mostrar los títulos de las canciones, los nombres de los grupos
a los que pertenecen las canciones y el número de votos.*/
select titulo,grupos.nombre,count(*) from votos inner join canciones on numCancion = cancion inner join grupos on grupo = codgrupo group by numCancion;

/*2.- A partir de la consulta anterior, obtén los títulos de las 8 canciones más votadas.*/
select titulo,grupos.nombre,count(*) from votos inner join canciones on numCancion = cancion inner join grupos on grupo = codgrupo group by numCancion order by count(*) desc limit 8;

/*3.- Obtén el título de todas las canciones que han recibido más votos que la canción
titulada No gires, el número de votos recibidos y el nombre del grupo al que
pertenecen.*/
select titulo,grupos.nombre,count(*) from votos inner join canciones on numCancion = cancion inner join grupos on grupo = codgrupo group by numCancion having count(*) > (select count(*) from votos inner join canciones on numCancion = cancion where titulo = 'no gires');

/*4.- Obtén los títulos de las canciones que no han recibido aún votos (los de las
canciones que no están en la tabla votos). Resuelve este ejercicio de dos formas: con
LEFT JOIN y con subconsulta.*/
-- left join
select titulo from canciones left join votos on numCancion = cancion where cancion is null;
-- subconsulta
SELECT titulo FROM canciones WHERE numcancion NOT IN (SELECT DISTINCT cancion FROM votos);

/*5.- Obtén los títulos de las canciones que no han recibido aún votos junto con el
nombre del grupo al que pertenecen. Debe salir además una columna con valor cero
para indicar el número de votos.*/
-- reguleta!
select titulo,grupos.nombre,'0' as votos from canciones left join votos on numCancion = cancion inner join grupos on grupo = codgrupo where cancion is null;
-- mejor!
select titulo,grupos.nombre,count(usuario) as votos from canciones left join votos on numCancion = cancion inner join grupos on grupo = codgrupo where cancion is null group by numCancion;

/*6.- Obtén cuantos votos tiene cada una de las canciones, el título y el nombre del grupo
al que pertenecen. Deben salir todas las canciones, no sólo las votadas.*/
-- union
select titulo,grupos.nombre,'0' as votos from canciones left join votos on numCancion = cancion inner join grupos on grupo = codgrupo where cancion is null union
select titulo,grupos.nombre,count(*) as votos from votos inner join canciones on numCancion = cancion inner join grupos on grupo = codgrupo group by numCancion order by votos;
-- left join
select titulo,grupos.nombre,count(usuario) from canciones left join votos on numCancion = cancion inner join grupos on grupo = codgrupo group by numCancion;

/*7.- Obtén los nombres de grupos que no hayan recibido votos, es decir, que todas sus
canciones no hayan recibido votos.*/
select grupos.nombre from canciones left join votos on numCancion = cancion inner join grupos on grupo = codgrupo group by nombre having count(usuario)=0;

/*8.- Obtén los nombres y apellidos de los usuarios que han votado la canción titulada
Canción de cuna.*/
select nombre,apellidos from usuarios inner join votos on usuario = user inner join canciones on numCancion=cancion where titulo = 'Canción de cuna';

/*9.- Obtén los nombres y apellidos de todos los usuarios que han votado a alguno de los
grupos votados por Elsa Frutos Núñez*/

-- select de la usuaria elsa...
select grupo from canciones inner join votos on cancion = numCancion inner join usuarios on user = usuario where usuarios.nombre = 'Elsa' and usuarios.apellidos = 'Frutos Núñez'; 

-- para buscar los grupos 
select nombre,apellidos from usuarios inner join votos on usuario = user inner join canciones on numCancion=cancion 
where grupo in (select grupo from canciones inner join votos on cancion = numCancion inner join usuarios on user = usuario 
where usuarios.nombre = 'Elsa' and usuarios.apellidos = 'Frutos Núñez');

/*10.- Obtén las fechas de enero en que se han dado menos votos que los dados el día 2
de enero de este 2018.*/

-- select inicial
select count(*) from votos where fecha = date(20180102);
-- consulta completa
select fecha,count(*) from votos where month(fecha) = 01 group by fecha having count(*)<(select count(*) from votos where fecha = date(20180102));


