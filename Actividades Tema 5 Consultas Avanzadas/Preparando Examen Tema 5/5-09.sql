use alquileres;

/*1.- Obtener el resultado de truncar o redondear por abajo a entero el valor 4.7,
redondearlo al entero más próximo y redondearlo a entero por arriba.*/
select round(4.7),ceil(4.7) ,floor(4.7);

/*2.- Obtener la matrícula, marca, modelo de cada automóvil y el precio redondeado al
entero más próximo*/
select matricula,marca,modelo,round(precio) from automoviles;

/*3.- Obtener el precio medio de alquiler de los automóviles de cada marca.*/
select marca,avg(precio) from automoviles group by marca;

/*4.- Obtener el precio medio de alquiler de los automóviles de cada marca. Los precios
medios deben salir con dos decimales redondeando al más próximo.*/
select marca,round(avg(precio),2) from automoviles group by marca;

/*5.- Sabiendo que la duración en días de los contratos se obtiene con
datediff(ffin,fini), obtener sin decimales la duración media de los contratos
finalizados.*/
select round(avg(datediff(ffin,fini))) from contratos where ffin is not null;

/*6.- Obtener un número aleatorio con 2 decimales comprendido entre 0 y 1 y un
número aleatorio entero comprendido entre 1 y 50.*/

select truncate(rand(),2) as '0 o 1', round(rand()*50+1) as 'de 1 a 50';

/*7.- Obtener los datos de un contrato cuyo número de contrato sea igual a un número
obtenido aleatoriamente inferior a 16*/
-- como los numero aleatorios no se quedan fijados tenemos que aplicar un SET para generar un numero y almacenarlo y utilizarlo luego para buscar 
set @aleatorio = round(rand()*15+1);
select @aleatorio;
select * from contratos where numcontrato = @aleatorio;

/*8.- Obtener los nombres y apellidos de los clientes que han realizado contratos. El
nombre y apellidos debe salir en una sola columna con el formato APELLIDOS,
NOMBRE y en mayúsculas. Para cada cliente se ha de obtener un número aleatorio
entre 0 y 1.*/

select ucase(concat(apellidos," ",nombre)) as "apellidos y nombre", round(rand()) as '0 o 1'  from clientes inner join contratos on dni = dnicliente group by dni;

/*9.- A partir de la consulta anterior, genera el resultado de un sorteo en el que
resultan premiados tres clientes que hayan realizado contratos.*/


/*10.- Obtener los nombres de clientes que tienen nombres compuestos, es decir, que
tienen un espacio en la columna nombre (para separar los dos nombres).*/

select nombre from clientes where instr(nombre,' ');

/*11.- Obtener nombres y apellidos de clientes que tienen en apellidos más de 12
caracteres.*/
select nombre,apellidos from clientes where length(apellidos)>12;

/*12.- Obtener los nombres y apellidos de todos los clientes. Del nombre solo se
obtendrán los 8 primeros caracteres y de los apellidos los 12 primeros.*/
select left(nombre,8),left(apellidos,12) from clientes;

