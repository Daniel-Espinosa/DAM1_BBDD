use concursomusica;

/*Daniel_Espinosa_Garcia_AA405*/

/*1.- Obtén los identificadores de los usuarios que han votado el 7 de enero de 2018 y el
número de canción que han votado.*/

select usuario,fecha,cancion from votos where fecha =20180107;

/*2.- Obtén, sin repetir, los usuarios que han votado entre el 2 de enero y el 6 de enero de
2018 ambos incluidos, ordenando por usuario ascendentemente.*/

select distinct usuario from votos where fecha between 20180102 and 20180106 order by usuario;

/*3.- Obtén toda la información sobre los votos registrados en enero de 2018 ordenando
por número de canción.*/

select * from votos where fecha like '2018-01-__' order by cancion;

/*4.- Obtén todos los grupos cuya fecha de la primera actuación en directo sea anterior al
año 2010. Realiza esto usando la función year, que devuelve el año de una fecha. La
sintaxis de year es:
year(fecha)*/

select * from grupos;
select nombre,fechaEstreno from grupos where year(fechaEstreno) < 2010 order by fechaEstreno;

/*5.- Obtén los datos de todas las canciones del concurso que tienen una duración
comprendida entre 3 y 4 minutos. */

select * from canciones where duracion between 000300 and 000400 order by duracion;

/*6.- Obtén el nombre, apellidos y alias de todos los componentes de grupos que tienen
registrado un alias (componentes que son conocidos por un alias).*/

select nombre,apellido,alias from componentes where alias is not null;

/*7.- Obtén los datos de todos los votos dados a canciones del grupo número 6 entre los
días 2 y 7 de enero de 2018, ambos incluidos. Las canciones del grupo 6 son las
canciones con números de canción 30, 31 y 32.*/

select * from votos where cancion in (30,31,32) and fecha between 20180102 and 20180107;

/* 8.- Obtén los datos los 10 últimos votos registrados por fecha (los de las últimas fechas).*/

select * from votos order by fecha desc limit 10;

/*9.- Sabiendo que la fecha actual se obtiene con la función curdate(), comprueba si hay
votos registrados incorrectamente por tener una fecha posterior a la actual.*/

select * from votos where fecha >= current_date() order by fecha;

/*10.- Obtén los datos, excepto la contraseña, de todos los usuarios que cumplen años en
enero (usar el operador LIKE para comprobar si la fecha de nacimiento coincide con un
patrón correspondiente a una fecha de enero).*/

select user,nombre,apellidos,fechanac from usuarios where fechanac like '____-01-__';

/*11.- Obtén los datos, excepto la contraseña, de todos los usuarios que cumplen años en
enero entre los días 16 y 31, ambos incluidos.
Para realizar esto, debes usar las siguientes funciones que devuelven el mes de una
fecha y el día de una fecha:
month(fecha)
dayofmonth(fecha)
*/

select user,nombre,apellidos,fechanac from usuarios where month(fechanac) = 1 and (dayofmonth(fechanac) between 16 and 31);

/*12.- Obtén los datos de los votos que han dado los usuarios 02Ana, 26Fer, 20luis y
26Juan (usar el operador IN).*/

select * from votos  where usuario in ('02Ana','26Fer','20luis','26Juan');

/*13.- Obtén los datos de los votos que han dado los usuarios 02Ana, 26Fer, 20luis y
26Juan entre el 3 de enero del 2018 y el 7 de enero de 2018, ambos incluidos.*/

select * from votos  where usuario in ('02Ana','26Fer','20luis','26Juan') and fecha  between 20180103 and 20180107;

/*14.- Obtén sin repetir los números de canción que han votado los usuarios cuyo nombre
de usuario comienza por 02.*/

select distinct cancion from votos where usuario like '02%';

/*15.- Obtén el nombre, apellidos, alias, función y número de grupo al que pertenece cada
componente que en su función contiene los textos voz o vocalista.*/

select nombre,apellido,alias,funcion,grupo from componentes where funcion like '%voz%' or funcion like '%vocalista%' ;



