create table unload_test as (
	select * from cust_sales_intercalada csi 
	union all
	select * from cust_sales_intercalada csi 
	union all 
	select * from cust_sales_intercalada csi 
);

select count(0) from cust_sales_intercalada;
select count(0) from unload_test;

unload ('select * from unload_test') 
to 's3://mybucketredshift1986/unload/unload_test_' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift';

unload ('select * from unload_test') 
to 's3://mybucketredshift1986/unload/unload_test_' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift'
parallel off 
ALLOWOVERWRITE 
delimiter ';' 
maxfilesize 500 mb 
ZSTD
manifest
;