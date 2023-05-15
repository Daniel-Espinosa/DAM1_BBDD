Create user 'albano'@'%' identified by '1234';
grant all on *.* to 'albano'@'%' with grant option;
drop user 'albano';

Create user 'carmen'@'%' identified by '1234';
grant all on *.* to 'carmen'@'%' with grant option;
drop user 'carmen';

show global variables like'auto%';
set global autocommit=0;
commit;

