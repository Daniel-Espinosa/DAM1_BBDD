delimiter //
CREATE trigger entregar after update on contratos for each row

BEGIN

declare k int;
declare a Boolean;

if old.ffin is null and new.ffin is not null then
	update automoviles set alquilado = false where matricula = new.matricula;

	if	new.kfin is not null then
		update automoviles set kilometros=new.kfin where matricula = new.matricula;
	end if;
end if;

END//
delimiter ;