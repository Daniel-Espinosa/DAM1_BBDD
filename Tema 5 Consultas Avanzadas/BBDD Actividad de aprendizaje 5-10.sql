use concursomusica;

/*1.- Obtener la fecha que será mañana, dentro de un mes y la que fecha de ayer y la
fecha de hace un mes.*/

select date_add(curdate(),interval 1 day) as mañana , date_add(curdate(),interval 1 month) as mesSiguiente, date_add(curdate(),interval -1 day) as ayer, date_add(curdate(),interval -1 month) as mesAnterior;

/*2.- Obtener cuantos días han transcurrido desde que se dio cada voto hasta la fecha
actual.*/
select fecha as fechaVoto, datediff(curdate(),fecha) from votos;

/*3.- Obtener la hora (horas:minutos:segundos) que será dentro de 10 horas, 12
minutos y 20 segundos.*/

select addtime(current_time, '10:12:20');

/*4.- Obtener cuanto tiempo (horas:minutos:segundos) falta para la hora final de clase.*/

select timediff('21:15:00',current_time);

/*5.- Obtener cuantos segundos en total faltan para la hora final de clase.*/
select time_to_sec(timediff('21:15:00',current_time));

/*6.- Obtener los datos de los votos que se han dado entre los días 25 y 29, ambos
incluidos, de cualquier mes.*/

select * from votos where day(fecha) between 25 and 29;

/*7.- Obtener los títulos de todas las canciones el grupo que las interpreta y un uno
cuando la canción dure más de 3 minutos o un cero cuando la duración sea menor o
igual que 3 minutos.*/

select titulo,grupos.nombre,'1' as 'Mayor 3 min',duracion from canciones inner join grupos on codgrupo = grupo where duracion > time(000300)
union
select titulo,grupos.nombre,'0' as 'menor o = a 3 min',duracion from canciones inner join grupos on codgrupo = grupo where duracion <= time(000300) order by duracion;

/*8.- Obtener cuantos usuarios han emitido vptos, cuantas canciones canciones hay en
la tabla canciones, cuantas de ellas hay de duración superior a 3 minutos y cuantas
de duración inferior o igual a 3 minutos.*/

-- no se si se refiere a usuarios distintos o a el total de votos... creo que es lo primero
select count(distinct usuario) from votos; -- el bueno
select count(usuario) from votos;
-- cuantas canciones canciones hay en la tabla canciones
select count(numCancion) from canciones;
-- cuantas de ellas hay de duración superior a 3 minutos
select count(numCancion) from canciones where duracion > 000300;
-- cuantas de duración inferior o igual a 3 minutos
select count(numCancion) from canciones where duracion <= 000300;

-- todo junto
select (select count(distinct usuario) from votos) as 'usuarios que votaron',
(select count(numCancion) from canciones) as 'Total Canciones' ,
(select count(numCancion) from canciones where duracion > 000300) as 'Canciones Duracion > 3 min',
(select count(numCancion) from canciones where duracion <= 000300) as 'Canciones Duracion <= 3 min';

/*9.- Obtener el resultado de encriptar la contraseña de cada usuario con el algoritmo
MD5 junto con la contraseña en texto plano y el nombre y apellidos.*/
select md5(contraseña),contraseña,nombre,apellidos from usuarios;

/*10.- Ahora vamos a probar como se validaría una contraseña que se ha introducido
con una contraseña que se ha encriptado en la base de datos. Antes tienes que
modificar la columna contraseña de la tabla usuarios para que sea VARCHAR(32) y
permita así guardar un MD5.*/

-- prefiero añadir una nueva columa para hacer el nuevo encriptado de contraseña
alter table usuarios add contEncriptada varchar (32);

update usuarios inner join (select contraseña as ContSinEncricont, user as user from usuarios) as t on t.user = usuarios.user set contEncriptada = md5(ContSinEncricont) where contEncriptada is null;

/*De lo obtenido en el ejercicio 9, copia la encriptación de la contraseña de Ana García
Herrero en contraseña de la usuaria (dentro de la tabla) y valida la operación.
Una vez hecho esto, realiza una consulta que comprueba se al aplicar MD5 a una
supuesta contraseña, el resultado es igual a la contraseña ahora almacenada para
Ana García Herrero.*/
