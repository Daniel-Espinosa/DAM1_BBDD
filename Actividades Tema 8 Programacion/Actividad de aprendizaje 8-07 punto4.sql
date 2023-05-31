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
declare fecha_max date;

drop table if exists recaudacion;

create table if not exists recaudacion(
fecha date,
contratos_fin int,
importe double
);

if mes <10 then
set fecha_aux= concat(year,'0',mes,'01');
set fecha_max= concat(year,'0',mes,'31');
else 
set fecha_aux= concat(year,mes,'01');
set fecha_max= concat(year,mes,'31');
end if;

while fecha_aux<= fecha_max do

if (select count(*) from contratos where ffin= fecha_aux)!=0 then

insert into recaudacion values (fecha_aux,
(select count(*) from contratos where ffin= fecha_aux),
(select sum(precio*datediff(ffin,fini)) from contratos inner join automoviles using (matricula) where ffin = fecha_aux group by ffin));
end if;
set fecha_aux = date_add(fecha_aux, interval 1 day);

end while;

select * from recaudacion;

END