CREATE PROCEDURE diaSemana (in dia INT(1),out diaEs Varchar(15))
BEGIN
/* 1.- Realiza un procedimiento dia_semana que devuelve el nombre del día de la
semana en español a partir del número de día de la semana recibido. */

case dia
when 1 then set diaEs = 'Lunes';
when 2 then set diaEs = 'Martes';
when 3 then set diaEs = 'Miercoles';
when 4 then set diaEs = 'Jueves';
when 5 then set diaEs = 'Viernes';
when 6 then set diaEs = 'Sabado';
when 7 then set diaEs = 'Domingo';
End Case;

END
