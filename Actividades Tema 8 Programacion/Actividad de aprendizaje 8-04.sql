Use datosorigen;
/* En la tabla personas debes añadir una columna provincia VARCHAR(30). */

-- alter table personas  add column provincia  VARCHAR(30);

/*
1.- Realiza un procedimiento asigna_fecha_nac que modifica la fecha de nacimiento de una persona de la tabla personas con una fecha generada de forma aleatoria.
● El procedimiento recibe el número de persona a modificar y una fecha mínima y una fecha máxima entre las que se va a generar la fecha aleatoria.
● Una forma de obtener la fecha aleatoria es:
o Obtener la diferencia de días (D) entre la fecha máxima y la fecha mínima.
o Generar un número aleatorio N entre 0 y D.
o Obtener la fecha sumando a la fecha mínima N días.
● Si la fecha máxima no es mayor que la mínima, el procedimiento no hace nada.
*/

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `asigna_fecha_nac`(in idpersona INT, in fechaMin date, in fechaMax date)
BEGIN

declare dif INT;
declare aux INT;
declare nuevaFecha DATE;

set dif = datediff(fechaMax,fechaMin);

-- Condicion para esto 
-- Si la fecha máxima no es mayor que la mínima, el procedimiento no hace nada.

if dif>0 THEN

set aux = round(rand()*dif);
set nuevaFecha = date_add(fechaMin, interval aux day);

update personas set fecha_nac = nuevaFecha where num = idpersona;

end if;
-- do Nothing

END
*/

call asigna_fecha_nac(2,19830409,curdate());

/*
2.- Realiza un procedimiento asigna_direccion que modifica la dirección y localidad una persona de la tabla personas con una dirección y localidad generadas aleatoriamente.
● El procedimiento recibe el número de persona a modificar.
● En la dirección carga un texto formado por una calle obtenida aleatoriamente de la tabla calles, una coma y un espacio, y un número entero comprendido entre 1 y 60.
● En la localidad carga un nombre de municipio obtenido aleatoriamente a partir de un número generado aleatoriamente entre 0 y el valor máximo que hay en la columna hasta de la tabla de municipios.
● En la columna provincia carga el nombre de la provincia del municipio obtenido anteriormente.
*/

set @randCalle = (select round((rand()*count(*))+1)  from calles);
set @nomCalle = (select concat(nomcalle , ', ' , round((rand()*60)+1)) from calles where idcalle = @randCalle);
set @nomCalle = concat((select nomcalle from calles where idcalle = @randCalle), ', ' , round((rand()*60)+1));
select @nomCalle, @randCalle;

call asigna_direccion(1);

/*
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
*/
