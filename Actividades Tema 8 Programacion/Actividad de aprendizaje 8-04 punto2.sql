CREATE DEFINER=`root`@`localhost` PROCEDURE `asigna_direccion`(in idpersona INT)
BEGIN

declare nomCalle varchar(50);
declare randCalle int;
declare nomMuni varchar(70);
declare maxMuni int;
declare nomProvi varchar(30);

-- nombre de calle aleatoria (direccion)
set randCalle = (select round((rand()*count(*))+1)  from calles);
-- set nomCalle = (select concat(nomcalle, ", " ,round((rand()*60)+1)) from calles where idcalle = randCalle);
set nomCalle = (select nomcalle from calles where idcalle = randCalle);
select nomcalle from calles where idcalle = randCalle;
select nomCalle, randCalle;

-- nombre de municipio aleatorio (localidad)
set maxMuni = (select max(hasta) from municipios);
set nomMuni = (select nommunicipio from municipios where hasta >= round(rand()*maxMuni) limit 1); 

-- nombre de provincia
set nomProvi = (select provincia from municipios where nommunicipio = nomMuni);

-- se realizas el update de los datos
update personas set direccion = nomCalle , localidad = nomMuni , provincia = nomProvi  where num = idpersona;

-- muestra por pantalla los datos
select * from personas where num = idpersona;

END