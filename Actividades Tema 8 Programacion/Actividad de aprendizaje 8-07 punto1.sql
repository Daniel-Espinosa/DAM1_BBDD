CREATE DEFINER=`root`@`localhost` PROCEDURE `factorial`(in num INT)
BEGIN

/*
1.- Realiza un procedimiento para obtener y devolver el resultado del factorial de un
número entero positivo pasado en un parámetro.
*/

declare aux int;
declare i int;
set i = 1;
set aux = 1;

while i <= num do
set aux = aux * i; 
set i = i + 1;
end while;

select aux;


END