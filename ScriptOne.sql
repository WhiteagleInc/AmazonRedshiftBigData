select 'Hola mundo!!' texto

create table estudiante (
	id int2,
	nombre varchar(30),
	pais_id int2
);

create table pais (
	pais_id int2,
	nombre varchar(60)
);

insert into estudiante values (1, 'David', 1),(2, 'Rocio', 1),(3, 'Carlos', 2)

insert into pais values (1, 'Colombia'),(3, 'Mexico')

select * from estudiante e 
left join pais p 
on e.pais_id = p.pais_id;

drop table pais;
drop table estudiante;