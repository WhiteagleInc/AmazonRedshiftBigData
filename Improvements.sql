select * from pg_catalog.pg_statistic_indicator where stairelid = 101492;

select * from stv_tbl_perm where name = 'sales';

select * from pg_catalog.pg_table_def  
where tablename = 'sales';

analyze sales(salesid, pricepaid);
analyze sales predicate columns;
analyze sales;

select * from stl_analyze;

--------------- Vaccum ---------------
select "table", unsorted, vacuum_sort_benefit from pg_catalog.svv_table_info;

vacuum sales;
vacuum sort only sales to 75 percent;
vacuum delete only sales to 75 percent;
vacuum reindex sales;