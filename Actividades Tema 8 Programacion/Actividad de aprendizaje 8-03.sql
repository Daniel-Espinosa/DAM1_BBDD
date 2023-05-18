Use concursomusica;

/*1.- En la base de datos concursomusica, desarrolla un procedimiento votar que realiza
los procesos correspondientes a votar una canción:
● Recibe el nombre y apellidos de un usuario y el título de la canción que vota.
● Añade el voto en la tabla votos.
● Incrementa en uno el número de votos dados por el usuario.
● Incrementa en uno los votos de la canción.
No tienes que validar si existe el usuario o si existe la canción*/

/* 
CREATE DEFINER=`root`@`localhost` PROCEDURE `votar`(in nom varchar(15), in ape varchar(30), in tit varchar(40))
BEGIN

set @u = (select user from usuarios where nombre = nom and apellidos = ape);
set @numCan =(select numCancion from canciones where titulo = tit);

insert into votos(usuario,fecha,cancion) values
(@u,curdate(),@numCan);
update usuarios set total_votos = total_votos + 1 where user = @u;
update canciones set total_votos = total_votos + 1 where numCancion = @numCan;

END
*/

/* 2.- Comprueba la ejecución del procedimiento anterior. Antes de ejecutarlo, comprueba
los votos que tiene la canción que se va a votar y los del usuario que va a dar el voto. */

set @nombre='Ana';
set @apellidos='García Herrero';
set @titulo='Cientos y cientos';

select * from usuarios where nombre = @nombre and apellidos = @apellidos;
select * from canciones where titulo = @titulo;

call votar(@nombre,@apellidos,@titulo);

/* 3.- Comprueba la ejecución del procedimiento anterior cuando un usuario que no existe
vota la misma canción que la que has usado en el ejercicio 2. Interpreta lo que ha
ocurrido.*/

call votar('Pepito','Invent',@titulo);

-- aparece este error.
-- Error Code: 1048 Column Usuario cannot be null
-- Como al intentar insertar un voto el usuario no existe da error ya que no puede ser nulo y detiene todo el procedimiento por ende no suma el voto a la cancion.

/* 4.- Modifica el procedimiento para que al final escriba los datos de la canción votada.
Para poder modificarlo, antes tienes que eliminarlo. */

/* 
CREATE DEFINER=`root`@`localhost` PROCEDURE `votar`(in nom varchar(15), in ape varchar(30), in tit varchar(40))
BEGIN

set @u = (select user from usuarios where nombre = nom and apellidos = ape);
set @numCan =(select numCancion from canciones where titulo = tit);

insert into votos(usuario,fecha,cancion) values
(@u,curdate(),@numCan);
update usuarios set total_votos = total_votos + 1 where user = @u;
update canciones set total_votos = total_votos + 1 where numCancion = @numCan;

-- punto 4
select * from canciones where numCancion = @numCan;

END
*/

/* 5.- Realiza un procedimiento contarVotos en la base de datos concursomusica que:
● Pone los votos de todos los usuarios a cero.
● Pone los votos de todas las canciones a cero.
● Actualiza el total de votos de las canciones con el número de votos de cada
canción registrados en la tabla votos.
● Actualiza el total de votos de los usuarios con el número de votos dados por cada
usuario en la tabla votos.
*/

/*
CREATE PROCEDURE contarVotos ()
/* 5.- Realiza un procedimiento contarVotos en la base de datos concursomusica que:
● Pone los votos de todos los usuarios a cero.
● Pone los votos de todas las canciones a cero.
● Actualiza el total de votos de las canciones con el número de votos de cada
canción registrados en la tabla votos.
● Actualiza el total de votos de los usuarios con el número de votos dados por cada
usuario en la tabla votos.
*/

/*
BEGIN
update usuarios set total_votos = 0;
update canciones set total_votos = 0;
-- para comprobar inserto un select para ver que estan a 0
select * from usuarios;
select * from canciones;

update usuarios inner join (select count(*) as votos ,usuario from votos group by usuario) as t  on user = t.usuario set total_votos = t.votos;
update canciones inner join (select count(*) as votos ,cancion from votos group by cancion) as t  on numCancion = t.cancion set total_votos = t.votos;
-- comprobar que actualizo.
select * from usuarios;
select * from canciones;

END
*/

set sql_safe_updates = 0;
call contarvotos();
set sql_safe_updates = 1;

/* 6.- Comprueba la ejecución del procedimiento. */
-- Funciona!




