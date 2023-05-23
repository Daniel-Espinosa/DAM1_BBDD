CREATE DEFINER=`root`@`localhost` PROCEDURE `recaudacion`(in mes INT, in ano INT)
BEGIN
/*
4.- En la base de datos alquileres, realiza un procedimiento que recibe un número de
mes y un año y, en una tabla temporal recaudación que se crea en el procedimiento:
● Inserta una fila por cada fecha del mes del año pasados como parámetros.
● En cada fila se carga la fecha, el número de contratos finalizados en esa fecha y
el importe de esos contratos.
Finalmente, el procedimiento muestra los datos de la tabla recaudacion.
*/

declare fecha_aux date;
set fecha_aux = concat(ano,mes,'01');

drop table if exists recaudacion;

create table if not exists recaudacion(
fecha date,
num_contratos_fin int,
importe_contratos double
);

while fecha_aux <= concat(ano,mes,31) do 

-- if	(select count(*) from contratos where ffin = fecha_aux) != 0 then

insert into recaudacion set 
fecha = fecha_aux,
num_contratos_fin = (select count(*) from contratos where ffin = fecha_aux),
importe_contratos = (select sum(precio) from automoviles inner join contratos using(matricula) where ffin = fecha_aux);

-- end if;

set fecha_aux = date_add(fecha_aux, interval 1 day);
end while;

select * from recaudacion;

END