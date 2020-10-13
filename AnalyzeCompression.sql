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