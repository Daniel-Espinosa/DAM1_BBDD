CREATE PROCEDURE votar (in nom varchar(15), in ape varchar(30), in tit varchar(40))
/*1.- En la base de datos concursomusica, desarrolla un procedimiento votar que realiza
los procesos correspondientes a votar una canción:
● Recibe el nombre y apellidos de un usuario y el título de la canción que vota.
● Añade el voto en la tabla votos.
● Incrementa en uno el número de votos dados por el usuario.
● Incrementa en uno los votos de la canción.
No tienes que validar si existe el usuario o si existe la canción
*/
BEGIN

set @u = (select user from usuarios where nombre = nom and apellidos = ape);
set @numCan =(select numCancion from canciones where titulo = tit);

insert into votos(usuario,fecha,cancion) values
(@u,curdate(),@numCan);
update usuarios set total_votos = total_votos + 1 where user = @u;
update canciones set total_votos = total_votos + 1 where numCancion = @numCan;

END