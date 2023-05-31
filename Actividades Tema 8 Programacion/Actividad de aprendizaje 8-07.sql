/*
1.- Realiza un procedimiento para obtener y devolver el resultado del factorial de un
número entero positivo pasado en un parámetro.
*/

call factorial(5);

/*
2.- Realiza una función que devuelve el resultado del factorial de un número entero
positivo pasado en un parámetro.
*/

select factorial(5);

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

use concursomusica;
select dias_sin_votos();

/*
4.- En la base de datos alquileres, realiza un procedimiento que recibe un número de
mes y un año y, en una tabla temporal recaudación que se crea en el procedimiento:
● Inserta una fila por cada fecha del mes del año pasados como parámetros.
● En cada fila se carga la fecha, el número de contratos finalizados en esa fecha y
el importe de esos contratos.
Finalmente, el procedimiento muestra los datos de la tabla recaudacion.
*/
use alquileres;

call recaudacion(12,2017);