use concucromusica;

/*1.- Obtener los nombres y apellidos de los usuarios que han votado canciones del
grupo LoriMeyers*/
select Usuarios.nombre,apellidos from usuarios inner join votos on usuario = user inner join canciones on cancion = numCancion inner join grupos on grupo = codgrupo where grupos.nombre = 'Lori Meyers';

/*2.- Obtener el título de la canción que tiene más votos. Si hay varias canciones con el
máximo de votos, deben salir todas ellas.
Una idea para realizarlo es obtener en una subconsulta el número de votos de cada
canción ordenado por votos descendentemente y limitada a una fila*/
-- select interno se queda con el nº de votos de la cancion mas votada
select count(usuario) from votos group by cancion order by count(*) desc limit 1;
-- 
select titulo from votos inner join canciones on cancion = numCancion group by cancion having count(usuario) = (select count(usuario) from votos group by cancion order by count(*) desc limit 1);

/*3.- A partir de la tabla votos, obtener el título de todas las canciones existentes junto
con el número total de votos que han recibido ordenadas por título de canción.
Tienes que unir dos consultas, una que obtiene los votos de las canciones votadas y
una que obtiene las canciones no votadas junto con cero votos.*/
-- esto es mas simple 
select titulo,count(usuario) from canciones left join votos on cancion = numCancion group by numCancion;

-- el enunciado lo pide con un union.
select titulo,count(usuario) from canciones inner join votos on cancion = numCancion group by numCancion
union
select titulo,count(usuario) from canciones left join votos on cancion = numCancion where usuario is null group by numCancion;

/*4.- Obtener cuantas canciones han recibido votos*/
select count(distinct cancion) from votos;

/*5.- Obtener los nombres, apellidos y función de los componentes que forman el
grupo al que pertenece Jorge Guirao.*/
-- select interno para saber el codigo de grupo al que pertenece Jorge Guirao
select grupo from componentes where nombre = 'Jorge' and apellido = 'Guirao';

select componentes.nombre,apellido,funcion from componentes where grupo = (select grupo from componentes where nombre = 'Jorge' and apellido = 'Guirao');

/*6.- Obtener el nombre y apellidos del usuario registrado más joven, su edad (al
finalizar el año actual) y los títulos de las canciones que ha votado.*/
-- select interno para saber cual es la fecha de nacimiento de la persona mas joven
select max(fechanac) from usuarios;

select usuarios.nombre,apellidos,year(now()) - year(fechanac) as 'Edad actual',titulo from usuarios inner join votos on user = usuario inner join canciones on cancion = numCancion 
where fechanac = (select max(fechanac) from usuarios);

/*7.- Obtener el nombre de cada grupo y la duración menor de sus canciones*/
-- select interno sacamos de cancion el numero de la cancion y su duracion de cada grupo
select nombre,min(duracion) from canciones inner join grupos on grupo = codgrupo group by grupo ;

/*8.- Obtener el nombre de cada grupo y el título de su canción de duración menor. Para
hacer esto requieres usar una subconsulta que genera una tabla derivada (subconsulta
en FROM).*/
-- select interno devuelve el codigo del grupo y la duracion menor de su cancion
select grupo,min(duracion) from canciones group by grupo;

select nombre,titulo from canciones inner join grupos on canciones.grupo = codgrupo inner join (select grupo,min(duracion) as minduracion from canciones group by grupo) as t on t.grupo = codgrupo and minduracion = duracion;


