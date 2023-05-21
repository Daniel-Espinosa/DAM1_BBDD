CREATE DEFINER=`root`@`localhost` PROCEDURE `asigna_direccion`(in idpersona INT)
BEGIN

declare newDirec varchar(200);
declare randCalle int;
declare nomMuni varchar(70);
declare maxMuni int;
declare nomProvi varchar(30);

if (select num from personas where num = idpersona) != null then
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

else select ('¡La persona no esiste!') as Fail;

end if;

END