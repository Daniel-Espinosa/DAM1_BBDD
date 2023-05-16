use concursomusica;
/*1.- Obtener los nombres y apellidos de los usuarios que han votado canciones del
grupo Lori Meyers*/

select usuarios.nombre,apellidos from usuarios inner join votos on user = usuario inner join
canciones on cancion= numCancion inner join grupos on grupo = codgrupo where grupos.nombre = 'Lori Meyers';
 
 /*2.- Obtener el título de la canción que tiene más votos. Si hay varias canciones con el
máximo de votos, deben salir todas ellas.
Una idea para realizarlo es obtener en una subconsulta el número de votos de cada
canción ordenado por votos descendentemente y limitada a una fila.*/

-- al no tener empate en votos puedo realizarlo de esta manera mas simple.
select titulo,count(*) from canciones inner join votos on cancion=numCancion group by cancion order by count(*) desc limit 1;

select titulo from canciones inner join votos on cancion=numCancion group by cancion having count(*)= 
(select count(*) from votos group by cancion order by count(*) desc limit 1);

/*3.- A partir de la tabla votos, obtener el título de todas las canciones existentes junto
con el número total de votos que han recibido ordenadas por título de canción.
Tienes que unir dos consultas, una que obtiene los votos de las canciones votadas y
una que obtiene las canciones no votadas junto con cero votos.*/
-- con esta sale todo
select titulo,count(usuario) from canciones left join votos on cancion = numCancion group by numcancion order by titulo;
-- consultas por separado
select titulo,count(*) from canciones inner join votos on cancion = numCancion group by numcancion;
select titulo,count(usuario) from canciones left join votos on cancion = numCancion where cancion is null group by numcancion;
-- como manda el ejercicio
select titulo,count(*) from canciones inner join votos on cancion = numCancion group by numcancion union
select titulo,count(usuario) from canciones left join votos on cancion = numCancion where cancion is null group by numcancion order by titulo;
-- la otras solucion que no me gusta nada!
select titulo,count(*) as votitos from canciones inner join votos on cancion = numCancion group by numcancion union
select titulo, 0 as votitos from canciones left join votos on cancion = numCancion where cancion is null group by numcancion order by titulo;

/*4.- Obtener cuantas canciones han recibido votos.*/
-- consulta que dice cuantos votos tiene una cancion (no veo el numero o titulo de la cancion)
select count(*) from votos group by cancion;
-- cuenta las canciones votadas.
select count(*) from (select cancion from votos group by cancion) as t;
-- de ramiro muy guay!
select count(distinct cancion) as votadas from votos;

/*5.- Obtener los nombres, apellidos y función de los componentes que forman el 
grupo al que pertenece Jorge Guirao.*/
-- consulta interna ( determinar el grupo de Jorge Guirao)
select componentes.grupo from componentes where componentes.nombre = 'Jorge' and componentes.apellido = 'Guirao';
-- consulta externa
select nombre,apellido,funcion from componentes where grupo = (select componentes.grupo from componentes where componentes.nombre = 'Jorge' and componentes.apellido = 'Guirao');

/*6.- Obtener el nombre y apellidos del usuario registrado más joven, su edad (al 
finalizar el año actual) y los títulos de las canciones que ha votado.*/
-- consulta interna
select max(fechanac) from usuarios;
-- consulta externa
select nombre,apellidos,year(now())-year(fechanac) as edad, titulo from usuarios inner join votos on usuario = user 
inner join canciones on cancion = numCancion where fechanac = (select max(fechanac) from usuarios);

/*7.- Obtener el nombre de cada grupo y la duración menor de sus canciones.*/
select nombre,min(duracion) from canciones inner join grupos on codgrupo = grupo group by grupo;

/*8.- Obtener el nombre de cada grupo y el título de su canción de duración menor. Para 
hacer esto requieres usar una subconsulta que genera una tabla derivada (subconsulta 
en FROM).*/
-- select interno
select grupo,min(duracion) from canciones group by grupo;

-- select externo
select nombre,titulo,duracion from canciones inner join grupos on codgrupo = canciones.grupo inner join
(select grupo,min(duracion) as dura from canciones group by grupo) as t on t.grupo = canciones.grupo 
and dura= duracion;