use datosorigen;
/*
1.- En la base de datos datosorigen, realiza un procedimiento cargar_direcciones para
generar aleatoriamente la dirección, localidad y provincia de todas las personas (TABLA
PERSONAS) con números comprendidos entre el número mínimo y el máximo que se
pasen como parámetros.
La dirección se obtiene aleatoriamente de la tabla CALLES añadiendo una coma, un
espacio y un número aleatorio entre 1 y 60.
La localidad y la provincia se obtiene aleatoriamente de la tabla MUNICIPIOS.
*/

call cargar_direcciones(1,10);

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_direcciones`(in min INT, in max INT)
BEGIN

declare aux int;

set aux = min;

while aux <= max do
call asigna_direccion(aux,@esiste);
set aux = aux + 1;
end while;

END
*/

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

call cargar_dnis(1,10);

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_dnis`(in min INT, in max INT)
BEGIN

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

*/


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

call cargar_sexos(11,50);

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_sexos`(in min INT, in max INT)
BEGIN

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
*/

/*
4.- En la base de datos datosorigen, realiza un procedimiento cargar_personas que
recibe el número de personas que se quieren añadir y permite añadir a la tabla
PERSONAS ese número de personas con todos los datos aleatorios (excepto la columna
autoincrementada y la columna SEXO que se establece de acuerdo con que el nombre
sea de un hombre o de una mujer).
Deberás utilizar los procedimientos que se han usado para generar todos esos datos de
forma aleatoria.
*/

call cargar_personas (9);

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_personas`(in numpersonas INT)
BEGIN

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
*/