drop database if exists make_up;
create database make_up default character set=utf8;
use make_up;

create table certifikat(
id int primary key auto_increment not null,
naziv varchar(50) not null,
datum datetime not null
);

create table korisnik(
id int not null primary key auto_increment,
ime  varchar (30) not null,
prezime varchar(30) not null
);

create table usluga(
id int not null primary key auto_increment,
naziv varchar(30),
cijena decimal(18,2)
);

create table djelatnica(
id int not null primary key auto_increment,
ime  varchar (30) not null,
prezime varchar(30) not null,
oib char (11),
certifikat int,
nadredeni varchar(30) 
);

create table certifikat_id(
id int primary key auto_increment not null,
izdavatelj varchar(50),
djelatnica int not null,
certifikat int
);

create table posjeta(
id int not null primary key auto_increment,
datum datetime,
djelatnica int,
korisnik int,
usluga int);

alter table certifikat_id add foreign key (djelatnica) references djelatnica(id);
alter table certifikat_id add foreign key (certifikat) references certifikat(id);
alter table posjeta add foreign key (djelatnica) references djelatnica(id);
alter table posjeta add foreign key (usluga) references usluga(id);
alter table posjeta add foreign key (korisnik) references korisnik(id); 

