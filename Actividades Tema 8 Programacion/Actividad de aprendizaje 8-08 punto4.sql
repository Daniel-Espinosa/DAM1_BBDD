/*
4.- Se supone que los partidos, de acuerdo a lo realizado anteriormente, se cargan con 
valores null en goles del equipo local y goles del equipo visitante.

Para establecer que un partido se inicia, debemos poner valores cero en esas dos columnas de goles. Por ello
deberemos ejecutar una instrucción UPDATE que haga que esas columnas pasen a valer 
0 partiendo de un valor anterior null.

Realizar un trigger partidoEnJuego que controla las modificaciones (entiendo que es un Update) realizadas sobre el 
resultado de un partido en la tabla partidos y desencadena las siguientes acciones:

- Si al hacer la modificación, los valores anteriores de las columnas de goles de los 
equipos local y visitante son null, se pondrán a cero esos goles y, si se produce 
esta condición:
1. En la tabla clasificación, se incrementa en 1 el número de partidos jugados 
por los dos equipos.
2. En la tabla clasificación, se incrementa en 1 el número de partidos empatados 
de los dos equipos.
3. En la tabla clasificación, se incrementan en 1 (debido al empate registrado) 
los puntos de los dos equipos.
*/

delimiter //
CREATE trigger partidoEnJuego before update on partidos for each row

BEGIN


/*
Para establecer que un partido se inicia, debemos poner valores cero en esas dos columnas de goles. Por ello
deberemos ejecutar una instrucción UPDATE que haga que esas columnas pasen a valer 
0 partiendo de un valor anterior null.
*/
if (select golesloc from partidos where eqloc = new.eqloc and eqvis = new.eqvis) is null then
set new.golesloc=0;
set new.golesvis=0;

/*
1. En la tabla clasificación, se incrementa en 1 el número de partidos jugados 
por los dos equipos.
*/
update clasificacion set pj = pj+1 where codeq = new.eqloc or codeq = new.eqvis;

/*
2. En la tabla clasificación, se incrementa en 1 el número de partidos empatados 
de los dos equipos.
*/
update clasificacion set pe = pe+1 where codeq = new.eqloc or codeq = new.eqvis;

/*
3. En la tabla clasificación, se incrementan en 1 (debido al empate registrado) 
los puntos de los dos equipos.
*/
update clasificacion set puntos = puntos+1 where codeq = new.eqloc or codeq = new.eqvis;

end if;


END//
delimiter ;