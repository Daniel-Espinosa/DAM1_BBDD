use Ejerc2;
/*6. Muestra el nombre de cada grupo, la duración y el título de su canción de duración 
mayor.*/
-- select interno
select max(duracion),grupo from canciones group by grupo;
-- select completo
select nombre, titulo, duracion from canciones inner join grupos on grupo = codgrupo 
inner join (select max(duracion)as maxDur,grupo as cgrupo from canciones group by grupo) as t on maxDur = duracion and cgrupo = grupo;

/*7. Muestra los nombres y apellidos de todos los usuarios que han votado a alguno de 
los grupos votados por Elsa Frutos Núñez.*/
-- select interno
select grupo from canciones inner join votos on cancion = numCancion inner join usuarios on user = usuario where nombre = 'Elsa' and apellidos = 'Frutos nuñez';
-- select completo
select nombre,apellidos from usuarios inner join votos on user = usuario inner join canciones on cancion = numCancion 
where grupo in (select grupo from canciones inner join votos on cancion = numCancion inner join usuarios on user = usuario where nombre = 'Elsa' and apellidos = 'Frutos nuñez');

/*8. Muestra los nombres y apellidos separados mediante un guion medio y la fecha de 
nacimiento de los usuarios que cumplen años dentro de 3 días.*/
select concat(nombre,'-',apellidos), fechanac from usuarios where month(fechanac) = month(adddate(current_date(),interval 3 day)) and day(fechanac) = day(adddate(current_date(), interval 3 day));

-- esto me da el dia de hoy + 3
select day(adddate(current_date(), interval 3 day));
/*
select concat(nombre,'-',apellidos), fechanac from usuarios where fechanac like '____-04-02';
*/

/*9. Muestra nombre, apellidos y fecha de nacimiento de los usuarios que cumplirán 
años el próximo mes y cuantos días han pasado desde que emitieron su último voto*/

-- cumple ultimo mes
select nombre,apellidos,fechanac from usuarios where month(fechanac) = month(adddate(curdate(), interval 1 month));
-- ultimo voto 
select usuario,datediff(current_date(),fecha)from votos;
-- todo junto 
select nombre,apellidos,fechanac,ultimovoto from usuarios inner join (select usuario,datediff(current_date(),fecha) as ultimovoto from votos) as t on usuario = user 
where month(fechanac) = month(adddate(curdate(), interval 1 month));

/*10. Muestra en una columna el nombre seguido de los apellidos de los usuarios que han 
votado canciones en domingo.*/
select concat(nombre, ' ' , apellidos) as nombre_apellido from usuarios inner join votos on usuario = user where dayofweek(fecha) = 1;

/*11. Muestra los nombres de los componentes en mayúsculas, los títulos de sus 
canciones votadas con duración superior a 2 minutos y cuya longitud de caracteres 
sea inferior a 9, el nombre del usuario que las ha votado y una columna con 
anotación “larga” o “corta” en función de si la duración es menor o igual que 4 
minutos (“corta”) o si es superior (“larga”).*/

select ucase(nombre),titulo;

/*12. Muestra los datos de una canción cuyo número de canción sea igual a un único 
número obtenido aleatoriamente inferior o igual al número total de canciones.*/
set @aleatorio = (select round((rand()*(select count(*) from canciones)+1)));
select @aleatorio;
select * from canciones where numCancion = @aleatorio;

/*13. Muestra el título y el número de votos de la canción que más votos ha recibido. No 
se puede usar LIMIT ni ORDER BY*/
-- select interno

/*14. Muestra cuantos usuarios han emitido votos, cuantas canciones hay en la tabla 
canciones, cuantas de ellas hay de duración superior a 2 minutos y medio y cuantas 
de duración inferior o igual a 2 minutos y medio.*/
-- usuarios que emiten votos cuento los usuarios distintos
select count(distinct usuario) from votos;
-- cuantas canciones hay en la tabla canciones
select count(numCancion) from canciones;
-- cuantas de ellas hay de duración superior a 2 minutos y medio
select count(numCancion) from canciones where duracion > '00:02:30';
-- cuantas de duración inferior o igual a 2 minutos y medio.*/
select count(numCancion) from canciones where duracion <= '00:02:30';

-- todo junto
select count(distinct usuario) as 'usuarios con votos',
(select count(numCancion) from canciones) as 'total cancione',
(select count(numCancion) from canciones where duracion > '00:02:30') as 'canciones > 2:30 min',
(select count(numCancion) from canciones where duracion <= '00:02:30') as 'canciones <= 2:30 min' 
from votos;

/*15. Muestra el nombre, contraseña cifrada con MD5 de los usuarios y el número de 
votos que han emitido en total a grupos de Barcelona, Madrid o Sevilla. Se deben 
reflejar las ciudades mediante identificadores (BCN, MAD, SV respectivamente). Hay 
que usar funciones de control de flujo. No se puede usar LIMIT ni ORDER BY*/
-- select interno para los votos

select nombre, md5(contraseña), BCN, MAD, SEV from usuarios inner join (select....) ;

-- select interno para cada usuario y votos a grupos
select usuario

