CREATE PROCEDURE nombreMes (in mes INT(2),out mesNom Varchar(20))
BEGIN
/* 2.- Realiza un procedimiento mes que devuelve el nombre del mes en español a partir
del número de mes recibido. */

case mes
when 1 then set mesNom = 'Enero';
when 2 then set mesNom = 'Febrero';
when 3 then set mesNom = 'Marzo';
when 4 then set mesNom = 'Abril';
when 5 then set mesNom = 'Mayo';
when 6 then set mesNom = 'Junio';
when 7 then set mesNom = 'Julio';
when 8 then set mesNom = 'Agosto';
when 9 then set mesNom = 'Septiembre';
when 10 then set mesNom = 'Octubre';
when 11 then set mesNom = 'Noviembre';
when 12 then set mesNom = 'Diciembre';
Else set mesNom = 'ERROR';
End Case;

END