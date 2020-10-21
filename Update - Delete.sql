select * from sales limit 10;

drop table sales_auxiliar;

create table sales_auxiliar as (
select salesid, pricepaid *2 pricepaid, commission *2 commission from sales s 
where eventid in (select eventid from event e 
where eventname = 'Beck'));

select salesid, pricepaid *2 pricepaid, commission *2 commission from sales s 
where eventid in (select eventid from event e 
where eventname = 'Beck');

select * from sales_auxiliar where salesid = 137519 limit 10;

update sales 
set pricepaid = sa.pricepaid 
from sales_auxiliar sa 
where sales.salesid = sa.salesid;

delete from sales 
using sales_auxiliar 
where sales.salesid = sales_auxiliar.salesid;

insert into sales (select * from sales_auxiliar);