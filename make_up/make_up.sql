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
certifikat_id int,
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

insert into certifikat(naziv,datum) values
('Make up','2015-05-06'),
('m','2015-09-16'),
('m','2016-06-09'),
('m','2016-09-08'),
('m','2017-01-29'),
('m','2018-10-06');

insert into certifikat_id(izdavatelj,djelatnica,certifikat) values
('Master class NY',2,1),
('Make up by Nina',1,2),
('Bipa Fashion',3,3),
('Master class Amsterdam',1,4);

insert into djelatnica( 






