copy customer from 's3://awssampledbuswest2/ssbgz/customer' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift'  
gzip compupdate off region 'us-west-2';

copy dwdate from 's3://awssampledbuswest2/ssbgz/dwdate' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift'  
gzip compupdate off region 'us-west-2';

copy lineorder from 's3://awssampledbuswest2/ssbgz/lineorder' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift'  
gzip compupdate off region 'us-west-2';

copy part from 's3://awssampledbuswest2/ssbgz/part' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift'  
gzip compupdate off region 'us-west-2';

copy supplier from 's3://awssampledbuswest2/ssbgz/supplier' 
credentials 'aws_iam_role=arn:aws:iam::672415322601:role/MyRoleRedshift'  
gzip compupdate off region 'us-west-2';

select * from supplier s2 limit 10;
select * from customer_pro limit 10;

analyze compression customer;
analyze compression dwdate;
analyze compression lineorder;
analyze compression part;
analyze compression supplier;


-- DROP TABLE public.customer;

--DROP TABLE public.customer;
CREATE TABLE IF NOT EXISTS public.customer_pro
(
	c_custkey INTEGER NOT NULL  ENCODE az64 distkey
	,c_name VARCHAR(25) NOT NULL  ENCODE zstd
	,c_address VARCHAR(25) NOT NULL  ENCODE zstd
	,c_city VARCHAR(10) NOT NULL  ENCODE bytedict
	,c_nation VARCHAR(15) NOT NULL  ENCODE bytedict
	,c_region VARCHAR(12) NOT NULL  ENCODE bytedict
	,c_phone VARCHAR(15) NOT NULL  ENCODE zstd
	,c_mktsegment VARCHAR(10) NOT NULL  ENCODE bytedict
);

insert into customer_pro (select * from customer);

CREATE TABLE IF NOT EXISTS public.lineorder_pro
(
	lo_orderkey INTEGER NOT NULL  ENCODE az64 distkey
	,lo_linenumber INTEGER NOT NULL  ENCODE az64
	,lo_custkey INTEGER NOT NULL  ENCODE az64
	,lo_partkey INTEGER NOT NULL  ENCODE az64
	,lo_suppkey INTEGER NOT NULL  ENCODE az64
	,lo_orderdate INTEGER NOT NULL  ENCODE az64
	,lo_orderpriority VARCHAR(15) NOT NULL  ENCODE lzo
	,lo_shippriority VARCHAR(1) NOT NULL  ENCODE lzo
	,lo_quantity INTEGER NOT NULL  ENCODE az64
	,lo_extendedprice INTEGER NOT NULL  ENCODE zstd
	,lo_ordertotalprice INTEGER NOT NULL  ENCODE zstd
	,lo_discount INTEGER NOT NULL  ENCODE az64
	,lo_revenue INTEGER NOT NULL  ENCODE zstd
	,lo_supplycost INTEGER NOT NULL  ENCODE az64
	,lo_tax INTEGER NOT NULL  ENCODE az64
	,lo_commitdate INTEGER NOT NULL  ENCODE az64
	,lo_shipmode VARCHAR(10) NOT NULL  ENCODE bytedict
);

insert into lineorder_pro (select * from lineorder);

CREATE TABLE IF NOT EXISTS public.part_pro
(
	p_partkey INTEGER NOT NULL  ENCODE delta
	,p_name VARCHAR(22) NOT NULL  ENCODE text255
	,p_mfgr VARCHAR(6) NOT NULL  ENCODE zstd
	,p_category VARCHAR(7) NOT NULL  ENCODE bytedict
	,p_brand1 VARCHAR(9) NOT NULL  ENCODE zstd
	,p_color VARCHAR(11) NOT NULL  ENCODE bytedict
	,p_type VARCHAR(25) NOT NULL  ENCODE bytedict
	,p_size INTEGER NOT NULL  ENCODE az64
	,p_container VARCHAR(10) NOT NULL  ENCODE bytedict
);

insert into part_pro (select * from part);

CREATE TABLE IF NOT EXISTS public.supplier_pro
(
	s_suppkey INTEGER NOT NULL  ENCODE az64 distkey
	,s_name VARCHAR(25) NOT NULL  ENCODE zstd
	,s_address VARCHAR(25) NOT NULL  ENCODE zstd
	,s_city VARCHAR(10) NOT NULL  ENCODE bytedict
	,s_nation VARCHAR(15) NOT NULL  ENCODE bytedict
	,s_region VARCHAR(12) NOT NULL  ENCODE bytedict
	,s_phone VARCHAR(15) NOT NULL  ENCODE zstd
);

insert into supplier_pro (select * from supplier);