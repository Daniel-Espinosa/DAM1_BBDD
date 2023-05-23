CREATE DEFINER=`root`@`localhost` FUNCTION `factorial`(num int) RETURNS int
    DETERMINISTIC
BEGIN

/*
2.- Realiza una función que devuelve el resultado del factorial de un número entero
positivo pasado en un parámetro.
*/

declare aux int;
declare i int;
set i = 1;
set aux = 1;

while i <= num do
set aux = aux * i; 
set i = i + 1;
end while;

RETURN aux;

END