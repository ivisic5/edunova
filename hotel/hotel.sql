drop database if exists Hotel;
create database Hotel default character set utf8;
use  Hotel;


create table soba(
id int not null auto_increment primary key,
kategorija varchar(30) not null,
kvadratura int not null,
opis_sobe varchar(200),
cijena decimal(18,2) not null
);

create table soba_rezervirano(
id int not null auto_increment primary key,
rezervacija int,
soba int
);

create table vrsta_posla(
 id int not null auto_increment primary key,
 naziv varchar(50) not null
 );

create table osoblje(
id int not null auto_increment primary key,
ime varchar(50) not null,
prezime varchar(50) not null,
oib char(11),
vrsta_posla int not null
);

 
create table gost(
oib char(11) not null primary key,
ime varchar(50) not null,
broj_telefona char(20),
prezime varchar(50) not null
);

create table racun(
id int not null auto_increment primary key,
datum date not null,
cijena decimal(18,2) not null,
rezervacija int
);

create table rezervacija(
id int not null auto_increment primary key,
soba_rezervirano int not null,
gost char not null,
broj_gostiju int not null,
pocetak date not null,
kraj date not null,
racun int
);

alter table soba_rezervirano add foreign key (soba) references soba(id);
alter table soba_rezervirano add foreign key (rezervacija) references rezervacija(id);
alter table osoblje add foreign key (vrsta_posla) references vrsta_posla(id);
alter table rezervacija add foreign key (gost) references gost(oib);
alter table racun add foreign key (rezervacija) references rezervacija(id);







