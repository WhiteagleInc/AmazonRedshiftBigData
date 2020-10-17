select * from encoding_value limit 10;

select * from stv_tbl_perm 
where name = 'encoding_venue';

101460

select col, max(blocknum) from pg_catalog.stv_blocklist 
where tbl = 101460 
and col <= 6 
group by col;

select * from pg_catalog.stv_blocklist 
where tbl = 101460 
and col = 0;

analyze compression cartesian_venue;

select * from cartesian_venue;

set enable_result_cache_for_session to off;

SELECT max(lo_revenue), min(lo_revenue) FROM cust_sales_simple css 
WHERE css.c_custkey < 100000;

SELECT max(lo_revenue), min(lo_revenue) FROM cust_sales_compuesto csc  
WHERE csc.c_custkey < 100000;

SELECT max(lo_revenue), min(lo_revenue) FROM cust_sales_intercalada csi
WHERE csi.c_custkey < 100000;

-----------------------------------------------------------------------
set enable_result_cache_for_session to off;

select * from cust_sales_simple css 
where css.c_region = 'ASIA' 
and css.c_mktsegment = 'FURNITURE'

select * from cust_sales_compuesto csc  
where csc.c_region = 'ASIA' 
and csc.c_mktsegment = 'FURNITURE'

select * from cust_sales_intercalada csi 
where csi.c_region = 'ASIA' 
and csi.c_mktsegment = 'FURNITURE'

-----------------------------------------------------------------------
set enable_result_cache_for_session to off;

SELECT * FROM cust_sales_simple css 
where css.d_date BETWEEN '01/01/1996' AND '01/14/1996' 
AND css.c_mktsegment = 'FURNITURE' 
AND css.c_region = 'ASIA';

SELECT * FROM cust_sales_compuesto csc  
where csc.d_date BETWEEN '01/01/1996' AND '01/14/1996' 
AND csc.c_mktsegment = 'FURNITURE' 
AND csc.c_region = 'ASIA';

SELECT * FROM cust_sales_intercalada csi  
where csi.d_date BETWEEN '01/01/1996' AND '01/14/1996' 
AND csi.c_mktsegment = 'FURNITURE' 
AND csi.c_region = 'ASIA';