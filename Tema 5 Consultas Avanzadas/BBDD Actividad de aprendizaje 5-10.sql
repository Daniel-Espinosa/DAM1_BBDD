use concursomusica;

/*1.- Obtener la fecha que será mañana, dentro de un mes y la que fecha de ayer y la
fecha de hace un mes.*/

select date_add(curdate(),interval 1 day) as mañana , date_add(curdate(),interval 1 month) as mesSiguiente, date_add(curdate(),interval -1 day) as ayer, date_add(curdate(),interval -1 month) as mesAnterior;

/*2.- Obtener cuantos días han transcurrido desde que se dio cada voto hasta la fecha
actual.*/
select fecha as fechaVoto, datediff(curdate(),fecha) from votos;
