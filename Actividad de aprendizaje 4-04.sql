use world;

/*1.- Obtén idiomas no oficiales que sean hablados en países por más del 40% de su
población. Mostrar también el porcentaje y el código del país en que se hablan.
*/

select CountryCode,Language,Percentage,IsOfficial from countrylanguage where IsOfficial='F' and Percentage >= 40;

/*2.- Obtén sin repetir idiomas no oficiales hablados en países por un porcentaje
comprendido entre el 5% y el 10% de su población. El listado debe estar ordenado
alfabéticamente por idioma*/

select distinct Language,Percentage,IsOfficial,CountryCode from countrylanguage where IsOfficial='F' and Percentage between 5 and 10 order by Language;

/*3.- Obtén nombres, población y continente de países pertenecientes a Asia, África o
Europa que tengan una población superior a 50 millones de habitantes. Ordena por
población de mayor a menor*/

select name, Population,Continent from country where Population > 50000000 and Continent in ('Asia','Africa','Europa') order by  Population desc;

/*4.- Obtén los nombres, población y continente de los cinco países más poblados de
África o Asia con población comprendida entre 10 y 50 millones de habitantes.*/

select name, Population,Continent from country where Population between 10000000 and 50000000 and Continent in ('Asia','Africa') order by  Population desc limit 5;

/*5.- Obtén los nombres y continente de todos los países de Asia que no tienen registrado
año de independencia.*/

select name,Continent,IndepYear from country where IndepYear is null and Continent = 'Asia';

/* 6.- Obtén el nombre y código de país a que pertenecen todas las ciudades cuyo nombre
comienza por S ordenadas por código de país y después por nombre. */

select Name,CountryCode from city where name like 'S%' order by CountryCode,Name;

/*7.- Obtén el nombre, población, región y forma de Gobierno de todos los países de Asia
excepto los que no tienen registrado año de independencia ni GNPOld.*/

select Name,Population,Region,GovernmentForm,Region,IndepYear,GNPOld from country where Continent ='Asia' and IndepYear is null and GNPOld is null;

/*8.- Obtén el nombre, población, continente de todos los países no pertenecientes
Europa y cuyo nombre comienza por N o por S y con más de dos millones de habitantes. */

select Name,Population,Continent from country where not Continent ='Europe' and name like 'N%' or name like 'S%' and Population >20000000;

/*9.- Obtén todos los países con densidad de población comprendida entre 50 y 60
habitantes por Km2 ordenados por nombre. La densidad de población se obtiene
dividiendo la población entre la superficie.*/

select Name,Population,SurfaceArea,Population/SurfaceArea as Densidad from country where Population/SurfaceArea between 50 and 60 order by name;

/*10.- Obtén el nombre de todos los países que se han independizado en el siglo XX junto
con su año de independencia.*/

select Name,IndepYear from country where IndepYear between 1990 and 2000 order by IndepYear;

/*11.- Obtén el nombre, continente y año de independencia de los cinco países que son
más antiguos de acuerdo a su año de independencia. No deben salir territorios que no
se han independizado nunca.*/

select Name,Continent,IndepYear from country where IndepYear is not null order by IndepYear limit 5;

/*12.- Obtén los nombres de todos los países cuyo nombre comience y termine con la letra
A y contenga la letra E.*/

select Name from country where Name like 'A%E%A';



