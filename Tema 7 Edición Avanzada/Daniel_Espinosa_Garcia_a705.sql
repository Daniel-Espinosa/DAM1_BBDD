use concursomusica;
-- para poder guardar el total de votos de los usuarios es necesario crear una columna en usuario para almacenar la informacion.
Alter table usuarios add total_votos int(10) default 0;
-- actualizo la informacion de total de votos.
update usuarios inner join (select count(*) as votos ,usuario from votos group by usuario) as t  on user = t.usuario set total_votos = t.votos;

/* 1.- Establece en la sesión de trabajo el modo transaccional para realizar las
transacciones correspondientes a los ejercicios 2, 3 y 4.*/

set autocommit =0;

/* 2.- En esta primera tarea, vas a simular la realización de todas las operaciones que se
deben hacer cuando un usuario ha dado un voto. La usuaria 02Ana ha dado ahora
mismo un voto a la canción titulada Cientos y cientos.*/

/*2.1.- Añade el voto realizado a la tabla votos. Comprueba los datos del voto insertado.*/
insert into votos(usuario,fecha,cancion) values
('02Ana',curdate(),(select numCancion from canciones where titulo = 'Cientos y cientos'));

/*2.2.- Suma un voto al total de votos que ha dado la usuaria 02Ana. */
-- puedo utilziar esta sentencia ya que actualiza todos los datos
update usuarios inner join (select count(*) as votos ,usuario from votos group by usuario) as t  on user = t.usuario set total_votos = t.votos;
-- o puedo sumar uno al total de votos de ana
update usuarios set total_votos = total_votos + 1 where user = '02ana';

/*2.3.- Suma un voto a la canción Cientos y Cientos. Comprueba cuántos votos tiene la
canción.*/
SET SQL_SAFE_UPDATES = 0;
-- la cancion tiene 0 votos de inicio
update canciones set total_votos = total_votos + 1 where titulo = 'Cientos y cientos';
-- es mas elegante de esta manera ya que si que cuenta todos los votos.
update canciones inner join (select count(*) as votos ,cancion from votos group by cancion) as t  on numCancion = t.cancion set total_votos = t.votos;

/* 2.4.- Aunque el proceso realizado sea correcto, anula la transacción para realizar el
proceso de otra forma (es un supuesto de que se ha producido algún fallo o algún
error en el proceso).*/

rollback;

/*3.- Ten en cuenta que al haber finalizado una transacción anteriormente, por estar en
modo transaccional, ya estás trabajando dentro de una nueva transacción, no tienes
que iniciar una nueva. Ahora vas a almacenar previamente los datos del voto en dos
variables: @u para almacenar el identificador de usuario y @t para almacenar el título.
Por ejemplo:
SET @u='02Ana' */

set @u='02Ana';
set @t='Cientos y cientos';

/*3.1.- Añade el voto realizado a la tabla votos.*/
insert into votos(usuario,fecha,cancion) values
(@u,curdate(),(select numCancion from canciones where titulo = @t));

/*3.2.- Suma un voto al total de votos que ha dado la usuaria.*/
update usuarios set total_votos = total_votos + 1 where user = @u;

/*3.3.- Suma un voto a la canción votada.*/
update canciones set total_votos = total_votos + 1 where titulo = @t;

/*3.4.- Confirma la transacción*/
commit;

/*4.- Realiza en una transacción todas las operaciones que se deben efectuar cuando se
elimine un voto. Se va a eliminar el voto dado por 02Ana en la fecha actual. Las
operaciones que se realizan son:

● Eliminar el voto dado por 02Ana en la fecha actual.
● Decrementar en uno el número de votos de la usuaria 02Ana.
● Decrementar en uno el número de votos dados a la canción votada en el voto.
*/

delete from votos where usuario = @u and fecha = curdate();
update usuarios set total_votos = total_votos - 1 where user = @u;
update canciones set total_votos = total_votos - 1 where titulo = @t;

/*5.- Establece en la sesión de trabajo el modo no transaccional. Repite lo realizado en
los ejercicios 2, 3 y 4 en este modo no transaccional.*/
set autocommit =1;

-- ejecute todas las senctencias anteriores

/* 6.- Inicia una nueva transacción.
● Elimina el voto dado por 02Ana en la fecha actual.
● Decrementa en uno el número de votos de la usuaria 02Ana.
*/

Start transaction;
SET SQL_SAFE_UPDATES = 0;
set @u='02Ana';
set @t='Cientos y cientos';

delete from votos where usuario = @u and fecha = curdate();

update usuarios set total_votos = total_votos - 1 where user = @u;

/* 7.- Sin confirmar ni anular la transacción, cierra la sesión cliente MySQL. Inicia una
nueva sesión y: Comprueba si quedaron realizados los cambios hechos en el ejercicio 6.*/

-- los cambios quedan guardados ya que estamos en modo transaccional "set autocommit =1" y aunque iniciamos un "Start Transaction" al salir de la aplicacion se quedan guardados los cambios 