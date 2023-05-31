CREATE PROCEDURE contarVotos ()
/* 5.- Realiza un procedimiento contarVotos en la base de datos concursomusica que:
● Pone los votos de todos los usuarios a cero.
● Pone los votos de todas las canciones a cero.
● Actualiza el total de votos de las canciones con el número de votos de cada
canción registrados en la tabla votos.
● Actualiza el total de votos de los usuarios con el número de votos dados por cada
usuario en la tabla votos.
*/
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
