CREATE DEFINER=`root`@`localhost` FUNCTION `dias_sin_votos`() RETURNS int
    DETERMINISTIC
BEGIN

/*
3.- En la base de datos concursomusica, realiza una función que devuelve en cuantos
días del año actual no se han votado canciones.
Una posible forma de realizarlo es la siguiente:
Establecer una fecha a 1 de enero del año actual.
Poner a 0 un contador de días sin votos
Mientras la fecha sea menor que la fecha actual
Comprobar si hay algún voto en la fecha
Si lo hay incrementar el contador de días sin voto
Incrementar la fecha
Fin_mientras
Devolver el contador de días sin votos
*/
declare cont int;
declare fecha date;

set cont = 0;
set fecha = concat(year(curdate()),'0101');

while fecha <= curdate() do
if (select count(*) from votos where votos.fecha = fecha) = 0 then
set cont = cont +1;
end if;

set fecha = date_add(fecha, INterval 1 day);
end while;

RETURN cont;
END