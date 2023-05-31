/*
2.- Realiza un trigger insertarPartido que provoca que, al insertar un nuevo partido en
la tabla partidos:
- No permite que se carguen valores en goles de equipo local y goles de equipo
visitante. Por ello, si se hubieran cargado en una instrucción INSERT, el trigger
fuerza a que vuelvan a valor null.
*/

delimiter //
CREATE trigger insertarPartido before insert on partidos for each row

BEGIN

set new.golesloc=null;
set new.golesvis=null;

END//
delimiter ;