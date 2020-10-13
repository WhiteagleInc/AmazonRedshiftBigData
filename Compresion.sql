select * from venue limit 10;
select count(0) from listing;
select count(*) from venue;
select count(*) from cartesian_venue;

create table cartesian_venue as (
select venueid, venuename, venuecity, venuestate, venueseats 
from venue, listing);

select * from cartesian_venue limit 10;

create table encoding_venue (
	nameraw varchar(100) encode raw,
	namebytedict varchar(100) encode bytedict,
	namelzo varchar(100) encode lzo,
	namerunlength varchar(100) encode runlength,
	nametext255 varchar(100) encode text255,
	nametext32k varchar(100) encode text32k,
	namezstd varchar(100) encode zstd
);

insert into encoding_venue 
(select venuename, venuename, venuename, venuename, venuename, venuename, venuename 
from cartesian_venue
);

select count(0) from encoding_venue limit 10;