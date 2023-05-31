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