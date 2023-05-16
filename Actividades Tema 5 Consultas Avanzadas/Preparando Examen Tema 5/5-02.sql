Use concursomusica;

/*1.- Obtén el resultado del producto cartesiano entre la tabla votos y la tabla usuarios.
Ojo! Para que salgan en Workbench todas las filas del resultado, tienes que establecer
en la pantalla de consultas que no se límite el número de filas de los resultados.
¿Cuántas filas se obtienen?*/

select * from usuarios,votos;

/*2.- A partir de una operación de producto cartesiano, obtén los nombres y apellidos de
usuarios que han dado votos el día 2 de enero de 2018.
Aunque en el resultado se hayan obtenido unas pocas filas, realmente se han obtenido
anteriormente todas las filas de un producto cartesiano hecho en el ejercicio anterior y
después a ese resultado intermedio se le ha aplicado la condición WHERE.*/

select nombre,apellidos,fecha from usuarios,votos where usuario=user and date(fecha) = '20180102';

/*3.- Usando la combinación INNER JOIN, obtén los nombres y apellidos de usuarios que
han dado votos el día 2 de enero de 2018.*/
select nombre,apellidos,fecha from usuarios inner join votos on usuario = user where date(fecha) = '20180102';

/*4.- Obtén un listado en el que se tengan todas las combinaciones posibles entre
canciones y usuarios. En el listado debe mostrarse el número de canción, el
identificador de usuario (user) y la fecha actual (Curdate()).*/

select numCancion,user,curdate() from canciones,usuarios;

/*5.- Obtén el nombre y apellidos de usuario y el título de la canción correspondientes al
último voto que se haya dado antes de la fecha actual. */

select nombre,apellidos,titulo from canciones inner join votos on cancion=numCancion inner join usuarios on user = usuario where fecha< curdate() order by fecha desc limit 1;

/*6.- Obtén sin repetir el nombre de todos los grupos de los que se han votado canciones
en diciembre de 2017*/
select distinct grupos.nombre from grupos inner join canciones on grupo = codgrupo inner join votos on cancion= numCancion where month(fecha) = 12 and year(fecha) = 2017;

/*7.- Obtén una lista con los nombres y apellidos de componentes que sean voz o
vocalista de grupos de Madrid.*/
select componentes.nombre,apellido from componentes inner join grupos on grupo = codgrupo where  localidad = 'Madrid' and (funcion like '%voz%' or funcion like '%vocalista%');

/*8.- Obtén una lista sin repetir con el nombre y apellidos de usuarios que han votado
canciones del grupo 16.*/
select distinct usuarios.nombre,apellidos from usuarios inner join votos on user = usuario inner join canciones on cancion = numCancion
where grupo = 16;

/*9.- Obtén una lista sin repetir con el nombre y apellidos de usuarios que han votado
canciones del grupo Cyan.*/
select distinct usuarios.nombre,apellidos from usuarios inner join votos on user = usuario inner join canciones on cancion = numCancion
inner join grupos on grupo = codgrupo where grupos.nombre = 'Cyan'; 

/*10.- Obtén una lista sin repetir con el nombre y apellidos de usuarios que han votado
canciones de grupos de Madrid o de Zaragoza entre el 20 y el 28 de diciembre, ambos
incluidos.*/
-- no existen grupos con localidad Zaragoza
select distinct usuarios.nombre,apellidos from usuarios inner join votos on user = usuario inner join canciones on cancion = numCancion
inner join grupos on grupo = codgrupo where ( localidad = 'madrid' or localidad = 'zaragoza') and month(fecha)=12 and day(fecha) between 20 and 28;
