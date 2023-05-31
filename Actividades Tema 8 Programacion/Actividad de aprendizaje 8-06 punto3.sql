CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_sexos`(in min INT, in max INT)
BEGIN
/*
3.- En la base de datos datosorigen, realiza un procedimiento cargar_sexos para
establecer en la columna SEXO de la tabla PERSONAS el sexo correcto de las personas
con números comprendidos entre el número mínimo y el máximo que se pasen como
parámetros. 

En sexo se cargará H si es un hombre y M si es una mujer. Dado que la tabla personas
tiene una columna NOMBRE con nombres extraídos de las tablas NOMBRES_MUJER y
NOMBRES_HOMBRE, se puede saber si un nombre corresponde a una mujer si ese
nombre está en la tabla NOMBRES_MUJER.
*/

declare aux int;
declare esiste boolean;
set aux = min;

while aux <= max do

if (select personas.nombre from personas inner join nombresmujer using(nombre) where num=aux) = false then
update personas set sexo = 'M' where num = aux;
else
update personas set sexo = 'H' where num = aux;
end if;

set aux = aux + 1;

end while;

END