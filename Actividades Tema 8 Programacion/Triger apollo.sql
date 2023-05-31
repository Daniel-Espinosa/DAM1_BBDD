insert into contratos(matricula,dnicliente,fini) values
('1234JMY','11223344M',curdate());

update automoviles set alquilado = 0 where matricula = '1234JMY';

update contratos set ffin = curdate(), kfin = 4000 where matricula = '1234JMY' ;

drop trigger alquilar;