drop database if exists Hotel;
create database Hotel default character set utf8;
use  Hotel;

create table opis_sobe(
id int not null auto_increment primary key,
opis decimal(18,2)
);

create table soba(
id int not null auto_increment primary key,
kategorija varchar(30) not null,
kvadratura int not null,
opis_sobe int,
cijena decimal(18,2) not null
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

 
create table gosti(
oib char(11) not null primary key,
ime varchar(50) not null,
prezime varchar(50) not null
);

create table racun(
id int not null auto_increment primary key,
datum date not null,
cijena decimal(18,2) not null
);

create table loglist(
id int not null auto_increment primary key,
soba int not null,
gosti char not null,
osoblje int not null,
pocetak date not null,
kraj date not null,
racun int not null
);


alter table soba add foreign key (opis_sobe) references opis_sobe(id);
alter table osoblje add foreign key (vrsta_posla) references vrsta_posla(id);
alter table loglist add foreign key (soba) references soba(id) ;
alter table loglist add foreign key (osoblje) references osoblje(id) ;
alter table loglist add foreign key (gosti) references gosti(oib);
alter table loglist add foreign key (racun) references racun(id);




