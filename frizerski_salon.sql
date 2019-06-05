drop database if exists frizerski_salon;
create database frizerski_salon default character set utf8;
use  frizerski_salon;

create table djelatnica(
sifra int not null primary key auto_increment,
ime  varchar (30) not null,
prezime varchar(30) not null,
oib char (11)
);

create table korisnik(
sifra int not null primary key auto_increment,
ime  varchar (30) not null,
prezime varchar(30) not null
);

create table usluga(
sifra int not null primary key auto_increment,
cijena decimal(18,2),
naziv varchar(30)
);

create table posjeta(
sifra int not null primary key auto_increment,
datum datetime,
djelatnica int,
korisnik int,
usluga int);

alter table posjeta add foreign key (djelatnica) references djelatnica(sifra);
alter table posjeta add foreign key (korisnik) references korisnik(sifra);
alter table posjeta add foreign key (usluga) references usluga(sifra);

insert into djelatnica( sifra,ime,prezime) values
# 1
(null,'Ana','Perić'),
# 2
(null,'Monika','Rasić');

insert into usluga( sifra,cijena,naziv) values
# 1
(null,40,'šisanje'),
# 2
(null,70,'frizura'),
# 3
(null,100,'farbanje');

insert into korisnik (sifra,ime,prezime) values 
# 1
(null,'Marko','Jerko'),
# 2
(null,'Anja','Vanja'),
# 3
(null,'Ines','Kralj');

insert into posjeta (datum,djelatnica,korisnik,usluga) values 
('2019-02-05',1,2,2),
('2019-02-25',1,2,3),
('2019-03-15',2,1,1),
('2019-03-31',2,3,2),
('2019-04-01',1,2,1);

update usluga set naziv='bojanje' where sifra=3;
update  posjeta set datum='2019-05-01' where sifra=5;
update usluga set cijena=cijena+20 where sifra=3;

alter table usluga add column pranje_kose boolean; 
update usluga set pranje_kose=1 where sifra>2 ;
update usluga set pranje_kose=0 where sifra<=2; 

insert into korisnik(ime,prezime) values
('Ivan','Horvat'),
('Ana','Kolar');

insert into posjeta(datum,djelatnica,korisnik,usluga) values
('2019-05-05',2,3,2),
('2019-05-13',2,4,2),
('2019-05-15',1,5,3),
('2019-06-01',1,4,1),
('2019-06-03',1,3,1);

delete from posjeta where sifra=9;
delete from posjeta where datum='2019-06-03';
select* from posjeta;

select ime,prezime from djelatnica;
select ime,prezime,prezime from djelatnica;
select ime, length(ime) as brojznakova from korisnik;
select sifra,ime,prezime from korisnik where sifra<=4 and sifra>2;
select ime,prezime from korisnik where not(ime like'%a');
select ime, prezime from korisnik
where prezime  like '%a%nj%';
select* from djelatnica where oib is not null;
select cijena, naziv from usluga
order by cijena desc;
select datum from posjeta limit 5;
select * from posjeta
where datum between '2019-03-15' and '2019-05-15'
order by djelatnica;
