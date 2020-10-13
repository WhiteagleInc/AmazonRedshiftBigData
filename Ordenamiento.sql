CREATE TABLE public.cust_sales_date (
	c_custkey int4 NULL,
	c_nation varchar(15) NULL,
	c_region varchar(12) NULL,
	c_mktsegment varchar(10) NULL,
	d_date date NULL,
	lo_revenue int4 NULL
);

copy cust_sales_date from 's3://mybucketredshift1986/cust_sales_date_000.bz2' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift' 
BZIP2
region 'us-west-1';

select count(0) from cust_sales_date;
select * from cust_sales_date limit 10;

create table auxiliar (col int);
insert into auxiliar values (1),(2),(3),(4),(5);

create table cust_sales_simple
sortkey (c_custkey)
as (
select c_custkey, c_nation, c_region, c_mktsegment, d_date, lo_revenue
from cust_sales_date, auxiliar); 

create table cust_sales_compuesto
compound sortkey (c_custkey, c_region, c_mktsegment, d_date)
as (
select c_custkey, c_nation, c_region, c_mktsegment, d_date, lo_revenue
from cust_sales_date, auxiliar); 

create table cust_sales_intercalada
interleaved sortkey (c_custkey, c_region, c_mktsegment, d_date)
as (
select c_custkey, c_nation, c_region, c_mktsegment, d_date, lo_revenue
from cust_sales_date, auxiliar);