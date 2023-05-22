CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_dnis`(in min INT, in max INT)
BEGIN
/*
2.- En la base de datos datosorigen, realiza un procedimiento cargar_dnis para generar
aleatoriamente los DNI de todas las personas con números comprendidos entre el
número mínimo y el máximo que se pasen como parámetros.
Para generar aleatoriamente números de DNI de cada persona debes:
● Obtener un número aleatorio entre 0 y 99999999. Si sale un número de menos
de 8 cifras hay que rellenarlo con ceros (en un CHAR). Usar la función lpad.
Asignar el resultado a una variable usada para almacenar el DNI.
● Obtener una letra aleatoria entre las letras de ‘TRWAGMYFPDXBNJZSQVHLCKE’.
Generar un número aleatorio entre 1 y 23 y extraer la letra que está en esa
posición (Usar substring). Concatenar el contenido de la variable que contiene el
DNI con la letra que se ha extraído anteriormente.
*/

declare new_dni varchar (9);
declare num_dni varchar(8);
declare letras varchar(23);
declare letra_DNI varchar(1);
declare aux int;
set aux = min;

while aux <= max do

set num_dni = lpad(round((rand()*99999999)),8,0);
set letras = 'TRWAGMYFPDXBNJZSQVHLCKE';
set letra_DNI = substring(letras,round((rand()*22)+1),1);
set new_dni = concat(num_dni,letra_DNI);

update personas set dni = new_dni where num=aux;

set aux = aux+1;

end while;

END