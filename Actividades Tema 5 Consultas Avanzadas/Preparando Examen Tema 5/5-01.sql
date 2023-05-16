Use concursomusica;

/*1.- Obtén el título y duración de todas las canciones junto con el nombre del grupo que
las interpreta. El listado debe estar ordenado por nombre de grupo*/
select titulo,duracion,nombre from canciones inner join grupos on grupo = codgrupo order by nombre;

/*2.- Obtén el nombre y apellido de todos los componentes de grupos junto con el
nombre del grupo al que pertenecen*/

select componentes.nombre,apellido,grupos.nombre from componentes inner join grupos on codgrupo = grupo;

/*3.- Modifica la instrucción anterior para que no salgan los datos de los intérpretes
individuales (los que no son grupos).*/

select componentes.nombre,apellido,grupos.nombre from componentes inner join grupos on codgrupo = grupo where esgrupo = false;

/*4.- Obtén el nombre, apellido, alias y nombre de grupo de todos los componentes de
grupos de Zaragoza.*/
-- no hay grupos de Zaragoza
select componentes.nombre,apellido,alias,grupos.nombre from componentes inner join grupos on codgrupo = grupo where localidad = 'Zaragoza';

/*5.- Obtén el nombre, apellido y nombre de grupo de todos los componentes que no
tienen registrado alias.*/
select componentes.nombre,apellido,grupos.nombre from componentes inner join grupos on codgrupo = grupo where alias is null;

/*6.- Obtén el título y duración de las canciones del grupo Delorean.*/
select titulo,duracion from canciones inner join grupos on codgrupo = grupo where nombre = 'Delorean';

/*7.- Obtén el título, duración y nombre de grupo de las cinco canciones de más corta
duración.*/
select titulo,duracion,nombre from canciones inner join grupos on codgrupo = grupo order by duracion asc limit 5;

/*8.- Obtén el nombre, apellido y código de grupo de todos los componentes que son
batería.*/
select nombre,apellido,grupo from componentes where funcion like '%bateria%';

/*9.- Obtén la fecha de cada voto y el título de la canción votada.*/
select titulo,fecha from canciones inner join votos on cancion = numCancion;

/*10.- Obtén la fecha de cada voto junto con el título de la canción votada y el nombre
del grupo al que pertenece la canción.*/
select titulo,fecha,nombre from canciones inner join votos on cancion = numCancion inner join grupos on codgrupo = grupo;




