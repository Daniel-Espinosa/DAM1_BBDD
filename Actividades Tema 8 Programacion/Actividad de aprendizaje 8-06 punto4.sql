CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_personas`(in numpersonas INT)
BEGIN
/*
4.- En la base de datos datosorigen, realiza un procedimiento cargar_personas que
recibe el número de personas que se quieren añadir y permite añadir a la tabla
PERSONAS ese número de personas con todos los datos aleatorios (excepto la columna
autoincrementada y la columna SEXO que se establece de acuerdo con que el nombre
sea de un hombre o de una mujer).
Deberás utilizar los procedimientos que se han usado para generar todos esos datos de
forma aleatoria.
*/
declare ultimo int;
declare primero int;
declare aux int;


if  (select max(num) from personas) != false then
set primero=(select max(num) from personas);
else
set primero =1;
end if;

set aux = primero;

call generar_nombres(numpersonas,ultimo);
call carga_apellidos(primero,ultimo);
call cargar_dnis(primero,ultimo);
call cargar_sexos(primero,ultimo);
call cargar_direcciones(primero,ultimo);

while aux <= ultimo do
	call asigna_fecha_nac(aux,19901201,curdate());
	set aux = aux + 1;
end while;

END