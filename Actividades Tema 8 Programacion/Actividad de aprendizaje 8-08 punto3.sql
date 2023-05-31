/*
3.- Modifica el trigger insertarPartido para añadirle la siguiente funcionalidad:
- Si en la jornada ya hay algún partido que contiene a los equipos del partido a
insertar, se debe hacer algo que impida la grabación del partido. No significa esto
que haya un partido jugado entre esos dos equipos en la jornada sino que alguno
de ellos aparezca ya en algún partido de la jornada. Para que se pueda rechazar
la inserción, podemos poner, por ejemplo, el nuevo número de jornada que se
guardará a valor nulo. Como en esa columna no se admiten nulos, se rechazará
la inserción. 
*/

delimiter //
CREATE trigger insertarPartido before insert on partidos for each row

BEGIN

set new.golesloc=null;
set new.golesvis=null;

-- Si en la jornada ya hay algún partido que contiene a los equipos del partido a insertar, se debe hacer algo que impida la grabación del partido
if (select eqloc,eqvis from partidos where eqloc = new.eqloc and eqvis = new.eqvis) is not null then
set new.numjornada=null;
end if;


END//
delimiter ;