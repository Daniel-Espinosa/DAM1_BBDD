CREATE DEFINER=`root`@`localhost` PROCEDURE `asigna_fecha_nac`(in idpersona INT, in fechaMin date, in fechaMax date)
BEGIN

declare dif INT;
declare aux INT;
declare nuevaFecha DATE;

set dif = datediff(fechaMax,fechaMin);

-- Condicion para esto 
-- Si la fecha máxima no es mayor que la mínima, el procedimiento no hace nada.

if dif>0 THEN

set aux = round(rand()*dif);
set nuevaFecha = date_add(fechaMin, interval aux day);

update personas set fecha_nac = nuevaFecha where num = idpersona;

end if;
-- do Nothing

END