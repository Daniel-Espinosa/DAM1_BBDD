/*
1.- Realiza un trigger insertarEquipo que provoca que, al insertar un nuevo equipo en la
tabla equipos, lo inserta automáticamente en la tabla clasificación.
*/

delimiter //
CREATE trigger insertarEquipo after insert on equipos for each row
BEGIN

insert into clasificacion set codeq =new.codeq;

END//
delimiter ;