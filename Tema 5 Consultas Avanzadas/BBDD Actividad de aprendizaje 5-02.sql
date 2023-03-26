use concursomusica;

/*1.- Obtén el resultado del producto cartesiano entre la tabla votos y la tabla usuarios.
Ojo! Para que salgan en Workbench todas las filas del resultado, tienes que establecer
en la pantalla de consultas que no se límite el número de filas de los resultados.*/

-- salen 6808 tuplas

select * from usuarios,votos;

/*2.- A partir de una operación de producto cartesiano, obtén los nombres y apellidos de
usuarios que han dado votos el día 2 de enero de 2018.*/

select nombre,apellidos,fecha from votos,usuarios where fecha = 20180102 and user = usuario;

/*3.- Usando la combinación INNER JOIN, obtén los nombres y apellidos de usuarios que
han dado votos el día 2 de enero de 2018*/

select nombre,apellidos,fecha from votos left join usuarios on user = usuario where fecha = 20180102;

/*4.- Obtén un listado en el que se tengan todas las combinaciones posibles entre
canciones y usuarios. En el listado debe mostrarse el número de canción, el
identificador de usuario (user) y la fecha actual (Curdate()).*/

select user,numCancion,curdate() from canciones,usuarios;

-- 4810


/*5.- Obtén el nombre y apellidos de usuario y el título de la canción correspondientes al
último voto que se haya dado antes de la fecha actual. */

select nombre,apellidos,titulo,fecha from canciones, usuarios,votos where  user = usuario and cancion = numCancion order by fecha desc limit 1;

/*6.- Obtén sin repetir el nombre de todos los grupos de los que se han votado canciones
en diciembre de 2017*/

select distinct nombre from grupos,votos,canciones where grupo = codGrupo and numCancion = cancion and fecha like '2017-12-__';

/*7.- Obtén una lista con los nombres y apellidos de componentes que sean voz o
vocalista de grupos de Madrid.*/

select componentes.nombre,apellido,funcion from componentes,grupos where codgrupo = grupo and localidad = 'madrid' 
and (funcion like '%voz%' or funcion like '%vocalista%') ;

/*8.- Obtén una lista sin repetir con el nombre y apellidos de usuarios que han votado
canciones del grupo 16.*/

select distinct usuarios.nombre,apellidos from usuarios,votos,canciones,grupos where user=usuario and cancion = numCancion and grupo=codGrupo and codGrupo = 16;

/*9.- Obtén una lista sin repetir con el nombre y apellidos de usuarios que han votado
canciones del grupo Cyan.*/

select distinct usuarios.nombre,apellidos from usuarios,votos,canciones,grupos where user=usuario and cancion = numCancion and grupo=codGrupo and grupos.nombre ='cyan';

/*10.- Obtén una lista sin repetir con el nombre y apellidos de usuarios que han votado
canciones de grupos de Madrid o de Zaragoza entre el 20 y el 28 de diciembre, ambos
incluidos.*/
 
 select distinct usuarios.nombre,apellidos from usuarios,votos,canciones,grupos where user=usuario and
 cancion = numCancion and grupo=codGrupo and (localidad = 'madrid' or localidad = 'Zaragoza') and
 month(fecha)=12 and day(fecha) between 20 and 28;
