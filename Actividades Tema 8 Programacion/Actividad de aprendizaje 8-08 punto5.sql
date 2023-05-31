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

5.- Añade funcionalidad al trigger partidoEnJuego anterior para que actualice la 
clasificación cuando se modifica el resultado desde un resultado anterior no nulo.
Por ejemplo, cuando el resultado era 1-1 y pasa a ser 2-1, habría que hacer lo siguiente:
- El equipo local tiene un partido menos empatado.
- El equipo visitante tiene un partido menos empatado.
- El equipo local tiene un partido más ganado.
- El equipo visitante tiene un partido más perdido.
- Al equipo local se le suma un gol a favor y no se le suman goles en contra. Esto 
se debe hacer por las diferencias entre los nuevos goles y los anteriores goles.
- Al equipo visitante se le suma un gol en contra y no se le suman goles a favor. 
- Se obtienen y cargan los puntos de los equipos local y visitante (3*pg+pe).
En definitiva:
● Hay que saber cuál era el resultado del partido y, en función de ello descontar el 
número de partidos ganados, empatados o perdidos por los equipos.
● Hay que saber cuál es el nuevo resultado del partido y, en función de ello 
incrementar el número de partidos ganados, empatados o perdidos por los 
equipos.
● Hay que saber la diferencia entre los nuevos goles y los anteriores del local para 
sumárselos a favor al local y descontárselos al visitante en la clasificación. 
● Hay que saber la diferencia entre los nuevos goles y los anteriores del visitante 
para sumárselos a favor al visitante y descontárselos al local en la clasificación.

*/

delimiter //
CREATE trigger partidoEnJuego before update on partidos for each row

BEGIN

declare difgolesloc int;
declare difgolesvis int;

/*
Para establecer que un partido se inicia, debemos poner valores cero en esas dos columnas de goles. Por ello
deberemos ejecutar una instrucción UPDATE que haga que esas columnas pasen a valer 
0 partiendo de un valor anterior null.
*/
if (select golesloc from partidos where eqloc = new.eqloc and eqvis = new.eqvis) is null then
set new.golesloc=0;
set new.golesvis=0;

update clasificacion set pj = pj+1 where codeq = new.eqloc or codeq = new.eqvis;
update clasificacion set pe = pe+1 where codeq = new.eqloc or codeq = new.eqvis;
update clasificacion set puntos = puntos+1 where codeq = new.eqloc or codeq = new.eqvis;

-- si el partido esta iniciadio pasa los siguiente
elseif (select golesloc from partidos where eqloc = new.eqloc and eqvis = new.eqvis) is not null then

-- si los el equipo local anota un gol y va ganando
	if	new.golesloc > new.golesvis then
		
        /*
        -- si el equipo local ya estaba ganando solo es necesario sumar el gol anotado
        if old.golesloc > old.golesvis then
			-- no se hace nada ya que el update que lo desencadena solo sumara el tanto al partido
            -- al final del triger se modificara la diferencia de goles
        end if;
		*/
        
        -- si el equipo local estaba perdiendo y ahora va ganando, toca modificar los puntos de ambos equipos
        if old.golesloc < old.golesvis then
            -- modifica los partidos ganados y perdidos del local modifica los puntos
            update clasificacion set pg = pg + 1, pp = pp - 1, puntos = puntos + 3 where codeq = new.eqloc;
            -- modifica los partidos ganados perdidos del visitante modificas los puntos 
            update clasificacion set pg = pg - 1, pp = pp + 1, puntos = puntos -3 where codeq = new.eqvis;
            -- al final del triger se modificara la diferencia de goles.
        end if;
        
        -- si el partido estaba en empatado  y ahora va ganando el LOCAL, toca modicar los puntos de ambos equipos
        if old.golesloc = old.golesvis then
			-- modifica los partidos ganados y perdidos del local modifica los puntos
            update clasificacion set pe = pe -1 , pg = pg + 1, puntos = puntos + 2 where codeq = new.eqloc;
            -- modifica los partidos ganados perdidos del visitante modificas los puntos 
            update clasificacion set pe = pe -1 , pp = pp + 1, puntos = puntos -1 where codeq = new.eqvis;
            -- al final del triger se modificara la diferencia de goles.
        end if;
        
	end if;
    
-- si el equipo visitante anota un gol y va ganando
	if	new.golesloc < new.golesvis then

		/*
		-- si el equipo visitante ya estaba ganando solo es necesario sumar el gol anotado
        if old.golesloc < old.golesvis then
			-- no se hace nada ya que el update que lo desencadena solo sumara el tanto al partido
            -- al final del triger se modificara la diferencia de goles.
        end if;
		*/
        
        -- si el equipo visitante estaba perdiendo y ahora va ganando, toca modificar los puntos de ambos equipos 
        if old.golesloc > old.golesvis then
            -- modifica los partidos ganados y perdidos del local modifica los puntos
            update clasificacion set pg = pg -1, pp = pp + 1, puntos = puntos - 3 where codeq = new.eqloc;
            -- modifica los partidos ganados perdidos del visitante modificas los puntos 
            update clasificacion set pg = pg + 1, pp = pp - 1, puntos = puntos +3 where codeq = new.eqvis;
            -- al final del triger se modificara la diferencia de goles.
        end if;
        
        -- si el partido estaba en empatado y ahora va ganando el VISITANTE, toca anotar los goles modicar los puntos de ambos equipos
        if old.golesloc = old.golesvis then
			-- modifica los partidos ganados y perdidos del local modifica los puntos
            update clasificacion set pe = pe -1 , pp = pp + 1, puntos = puntos - 1  where codeq = new.eqloc;
            -- modifica los partidos ganados perdidos del visitante modificas los puntos 
            update clasificacion set pe = pe -1 , pg = pg + 1, puntos = puntos + 2 where codeq = new.eqvis;
            -- al final del triger se modificara la diferencia de goles.
        end if;

	end if;

-- si el partido esta empata
    if	new.golesloc = new.golesvis then
    
    -- si el equipo local estaba ganando toca modificar los puntos de ambos equipos.
        if old.golesloc > old.golesvis then
			-- modifica los partidos ganados y empatados del local modifica los puntos
            update clasificacion set pe = pe + 1, pg = pg - 1, puntos = puntos - 2 where codeq = new.eqloc;
            -- modifica los partidos ganados perdidos del visitante modificas los puntos 
            update clasificacion set pe = pe + 1, pp = pp - 1, puntos = puntos + 1 where codeq = new.eqvis;
            -- al final del triger se modificara la diferencia de goles.
        end if;

        -- si el equipo visitante estaba ganando, toca modificar los puntos de ambos equipos
        if old.golesloc < old.golesvis then
            -- modifica los partidos ganados y perdidos del local modifica los puntos
            update clasificacion set pe = pe + 1, pp = pp - 1, puntos = puntos + 1 where codeq = new.eqloc;
			-- modifica los partidos ganados perdidos del visitante modificas los puntos
            update clasificacion set pe = pe + 1, pg = pg - 1, puntos = puntos - 2 where codeq = new.eqvis;
            -- al final del triger se modificara la diferencia de goles.
        end if;
        
        /*
        -- si el partido estaba en empatado  y seguimos en empate
        if old.golesloc = old.golesvis then
            -- no se hace nada ya que el update que lo desencadena solo sumara el tanto al partido
            -- al final del triger se modificara la diferencia de goles.
        end if;
        */
        
	end if;

-- modificar los goles anotados de la tabla clasificacion.
-- seteo la diferencia de goles del local y visitante antes y despues de la modificacion, con esto obtenemos los gf y gc de cada equipo
set difgolesloc = new.golesloc - old.golesloc;
set difgolesvis = new.golesvis - old.golesvis;
-- modificamos los gf y gc del LOCAL
update clasificacion set gf= gf + difgolesloc, gc= gc + difgolesvis where codeq = new.eqloc;
-- modificamos los gf y gc del VISITANTE
update clasificacion set gf= gf + difgolesvis, gc= gc + difgolesloc where codeq = new.eqvis;

end if;


END//
delimiter ;