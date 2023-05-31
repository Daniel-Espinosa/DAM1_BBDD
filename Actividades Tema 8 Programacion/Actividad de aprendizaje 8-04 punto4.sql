CREATE DEFINER=`root`@`localhost` PROCEDURE `asigna_direccion`(in idpersona INT, out esiste boolean)
BEGIN

/*
4.- Modifica el procedimiento anterior para que no escriba el mensaje de error en
pantalla, sino que devuelva en una variable booleana si se pudo realizar la
modificación por existir el número de persona o si no se realizó por no existir.
*/


declare newDirec varchar(200);
declare randCalle int;
declare nomMuni varchar(70);
declare maxMuni int;
declare nomProvi varchar(30);

if (select num from personas where num = idpersona) != false then
-- nombre de calle aleatoria (direccion)
set randCalle = (select round((rand()*count(*))+1)  from calles);
set newDirec = (select concat(nomcalle, ", " ,round((rand()*60)+1)) from calles where idcalle = randCalle);

-- nombre de municipio aleatorio (localidad)
set maxMuni = (select max(hasta) from municipios);
set nomMuni = (select nommunicipio from municipios where hasta >= round(rand()*maxMuni) limit 1); 

-- nombre de provincia
set nomProvi = (select provincia from municipios where nommunicipio = nomMuni);

-- se realizas el update de los datos
update personas set direccion = newDirec , localidad = nomMuni , provincia = nomProvi  where num = idpersona;

-- muestra por pantalla los datos
select * from personas where num = idpersona;

set esiste = true;

else set esiste = false;

end if;

END