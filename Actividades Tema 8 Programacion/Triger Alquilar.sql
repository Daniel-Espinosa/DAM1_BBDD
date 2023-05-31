delimiter //
CREATE trigger alquilar before insert on contratos for each row

BEGIN

declare k int;
declare a Boolean;

select kilometros,alquilado into k,a From automoviles where matricula = new.matricula;

if a = true then
set new.matricula=null;
else
set New.kini=k;
update automoviles set alquilado=true where matricula=new.matricula;
end if;

END//
delimiter ;
