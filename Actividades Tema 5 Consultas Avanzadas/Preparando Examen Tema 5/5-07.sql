use concursomusica;

/*1.- A partir del contenido de la tabla votos, obtén cuántos votos tiene cada canción que
ha sido votada. Se deben mostrar los títulos de las canciones, los nombres de los grupos
a los que pertenecen las canciones y el número de votos.*/
select titulo,grupos.nombre,count(usuario) from votos inner join canciones on cancion = numCancion inner join grupos on grupo = codgrupo group by titulo,nombre;

/*2.- A partir de la consulta anterior, obtén los títulos de las 8 canciones más votadas.*/
select titulo,nombre,count(usuario) as Total_Votos from votos inner join canciones on cancion= numCancion inner join grupos on grupo = codgrupo group by titulo,nombre order by Total_Votos desc limit 8;

/*3.- Obtén el título de todas las canciones que han recibido más votos que la canción
titulada No gires, el número de votos recibidos y el nombre del grupo al que
pertenecen*/
-- select interno votos de NO GIRES
select titulo,count(usuario) from votos inner join canciones on cancion = numCancion where titulo = 'No gires';
-- respuesta
select titulo,nombre,count(usuario) as total_votos from votos inner join canciones on cancion = numCancion inner join grupos on codgrupo = grupo group by titulo,nombre 
having total_votos > (select count(usuario) from votos inner join canciones on cancion = numCancion where titulo = 'No gires');

/*4.- Obtén los títulos de las canciones que no han recibido aún votos (los de las
canciones que no están en la tabla votos). Resuelve este ejercicio de dos formas: con
LEFT JOIN y con subconsulta.*/
-- Left Join
select titulo from canciones left join votos on numCancion = cancion where usuario is null;
-- Subconsulta, esto es una aberracion!
select titulo from canciones where numCancion not in (select distinct cancion from votos);

/*5.- Obtén los títulos de las canciones que no han recibido aún votos junto con el
nombre del grupo al que pertenecen. Debe salir además una columna con valor cero
para indicar el número de votos.*/
select titulo,nombre as Nombre_Grupo, count(usuario) from canciones left join votos on cancion = numCancion inner join grupos on grupo = codgrupo where usuario is null group by titulo,nombre;

/*6.- Obtén cuantos votos tiene cada una de las canciones, el título y el nombre del grupo
al que pertenecen. Deben salir todas las canciones, no sólo las votadas.*/
select titulo,nombre as Nombre_grupo, count(usuario) from canciones left join votos on cancion = numCancion inner join grupos on grupo = codgrupo group by titulo,nombre;

/*7.- Obtén los nombres de grupos que no hayan recibido votos, es decir, que todas sus
canciones no hayan recibido votos.*/

-- consulta interna listar codGrupo con de votos y cancion aplicar GroupBy
select grupo from canciones inner join votos on cancion = numCancion group by grupo;
select nombre from grupos where codgrupo not in (select grupo from canciones inner join votos on cancion = numCancion group by grupo);

-- sin usar subconsulta
select nombre from canciones left join votos on numCancion = cancion inner join grupos on grupo = codgrupo group by nombre having count(usuario) =0;

/*8.- Obtén los nombres y apellidos de los usuarios que han votado la canción titulada
Cancion de cuna.*/
select nombre,apellidos from usuarios inner join votos on user = usuario inner join canciones on cancion = numcancion where titulo = 'Cancion de cuna';

/*9.- Obtén los nombres y apellidos de todos los usuarios que han votado a alguno de los
grupos votados por Elsa Frutos Núñez*/
-- select interno devuelve el codigo de los grupos que voto Elsa.
select grupo from canciones inner join votos on cancion = numCancion inner join usuarios on user = usuario where nombre='Elsa' and apellidos = 'Frutos Nuñez';
-- select completo
select nombre,apellidos from usuarios inner join votos on user = usuario inner join canciones on cancion = numCancion 
where grupo in (select grupo from canciones inner join votos on cancion = numCancion inner join usuarios on user = usuario where nombre='Elsa' and apellidos = 'Frutos Nuñez');

/*10.- Obtén las fechas de enero en que se han dado menos votos que los dados el día 2
de enero de este 2018.*/
-- consulta interna para saber el total de votos del dia concreto
select count(*) from votos where year(fecha) = 2018 and month(fecha) = 01 and day(fecha) = 2;
-- select completo
select fecha from votos where month(fecha) = 1 group by fecha having count(*) < (select count(*) from votos where year(fecha) = 2018 and month(fecha) = 01 and day(fecha) = 2);
