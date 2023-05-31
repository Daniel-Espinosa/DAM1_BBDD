CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_direcciones`(in min INT, in max INT)
BEGIN
/*
1.- En la base de datos datosorigen, realiza un procedimiento cargar_direcciones para
generar aleatoriamente la dirección, localidad y provincia de todas las personas (TABLA
PERSONAS) con números comprendidos entre el número mínimo y el máximo que se
pasen como parámetros.
La dirección se obtiene aleatoriamente de la tabla CALLES añadiendo una coma, un
espacio y un número aleatorio entre 1 y 60.
La localidad y la provincia se obtiene aleatoriamente de la tabla MUNICIPIOS.
*/

declare aux int;

set aux = min;

while aux <= max do
call asigna_direccion(aux,@esiste);
set aux = aux + 1;
end while;

END