create table temp (
    name text,
    id int,
    nametype text,
    class text,
    mass real,
    discovery text,
    year int,
    lat real,
    long real,
    primary key(id)
);


.import --csv --skip 1 meteorites.csv temp


update temp
set mass = null
where mass = '';

update temp
set year = null
where year = '';

update temp
set lat = null
where lat = '';

update temp
set long = null
where long = '';


update
    temp
set
    mass = round(mass, 2),
    lat = round(lat, 2),
    long = round(long, 2);


delete from temp
where nametype = 'Relict';


create table meteorites (
    id int,
    name text,
    class text,
    mass real,
    discovery text,
    year int,
    lat real,
    long real,
    primary key(id)
);

insert into meteorites (
    id,
    name,
    class,
    mass,
    discovery,
    year,
    lat,
    long
) select
    row_number() over (order by year, name),
    name,
    class,
    mass,
    discovery,
    year,
    lat,
    long
from
    temp;

drop table temp;
