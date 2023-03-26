/*Actividad de aprendizaje 4-03*/

use concursomusica;

/*1.- Obtén de todas las canciones que duran más de 3 minutos: el número de canción, el
identificador de grupo al que pertenecen, la duración y el título, ordenando por duración de
mayor a menor.*/

select numCancion,grupo,duracion,titulo from canciones where duracion > 000300 order by duracion desc;

/*2.- Obtén los datos de todos los votos realizados antes del año 2018*/

select * from votos where fecha	< 20180000;

/*3.-Obtén los datos de todos los votos realizados el día 2 de enero de 2018*/

select * from votos where fecha	= 20180102;

/*4.- Sabiendo que la fecha actual se obtiene en MySQL con la función curdate(), obtén los datos
de todos los votos realizados en la fecha actual.*/

select * from votos where fecha	= curdate();

/*5.- Obtén los datos de los votos que constan como realizados después de la fecha actual.*/

select * from votos where fecha	> curdate();

/*6.- Obtén los datos del voto que se realizó por primera vez (el primero por fecha).*/

select * from votos order by fecha limit 1;

/*7.- Obtén los nombres de todos los grupos que han grabado su primer disco antes de 2006*/

select nombre,annoGrab from grupos where annoGrab < 2006 order by annoGrab;

/*8.- Obtén los nombres de todos los grupos que han realizado su primera actuación en concierto
antes de 2006.*/

select nombre,fechaEstreno from grupos where fechaEstreno < 20060000 order by fechaEstreno;

/*9.- Obtén los nombres de todos los grupos de Madrid.*/
select nombre,localidad from grupos where localidad = 'madrid';

/*10.- Obtén los nombres de todos los cantantes en solitario que hay en la tabla grupos.*/
select nombre,esgrupo from grupos where esgrupo = false;

/*11.- Obtén los nombres de todos los grupos cuyo nombre comienza por la letra V.*/
select nombre from grupos where nombre like 'V%';

/*12.- Obtén los nombres y apellidos de todos los componentes del grupo con identificador 21*/
select nombre,apellido from componentes where grupo =21;

/*13.- Obtén los nombres de todos los grupos cuyo estilo sea pop o mezcla de pop con otros
estilos.*/
select nombre,estilo from grupos where estilo like '%pop%';

/*14.- Obtén los datos de todas las canciones del grupo con identificador 21.*/
select * from canciones where grupo = 21;

/*15.- Obtén los datos de las cinco canciones de menor duración.*/
select * from canciones order by duracion limit 0,5



