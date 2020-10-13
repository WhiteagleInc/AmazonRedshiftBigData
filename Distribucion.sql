create table dist_key (columna int)
diststyle key distkey (columna);
insert into dist_key values (10);

create table dist_even (columna int)
diststyle even;
insert into dist_even values (10);

create table dist_all (columna int)
diststyle all;
insert into dist_all values (10);

create table dist_auto (columna int);
insert into dist_auto values (10);

select * from pg_catalog.svv_table_info 
where "table" like '%dis%' 
limit 10;

select * from pg_catalog.pg_table_def 
where tablename = 'users';

select distinct slice, col, num_values, "minvalue", "maxvalue" from pg_catalog.svv_diskusage 
where "name" = 'users' 
and col = 0 
and num_values > 0 
order by slice, col 
limit 10;

create table user_key_state distkey(state) as (select * from users);

select distinct slice, col, num_values, "minvalue", "maxvalue" from pg_catalog.svv_diskusage 
where "name" = 'user_key_state' 
and col = 0 
and num_values > 0 
order by slice, col 
limit 10;

create table user_even diststyle even as (select * from users);

select distinct slice, col, num_values, "minvalue", "maxvalue" from pg_catalog.svv_diskusage 
where "name" = 'user_even' 
and col = 0 
and num_values > 0 
order by slice, col 
limit 10;

create table user_all diststyle all as (select * from users);

select distinct slice, col, num_values, "minvalue", "maxvalue" from pg_catalog.svv_diskusage 
where "name" = 'user_all' 
and col = 0 
and num_values > 0 
order by slice, col 
limit 10;