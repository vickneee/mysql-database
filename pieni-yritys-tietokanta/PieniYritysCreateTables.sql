CREATE TABLE Tyontekija (
  Tnro INT NOT NULL,
  Enimi VARCHAR(15) NOT NULL,
  Snimi VARCHAR(15) NOT NULL,
  Spvm DATE NOT NULL,
  Sp CHAR(1),
  PRIMARY KEY (Tnro));

CREATE TABLE Osasto ( 
  Onro INT NOT NULL,
  ONimi VARCHAR(15) NOT NULL,
  PRIMARY KEY (Onro));

CREATE TABLE Tyoskentelee ( 
  Onro INT NOT NULL,
  Tnro INT NOT NULL,
  Aloituspvm DATE NOT NULL,
  PRIMARY KEY (Tnro, Onro),
  FOREIGN KEY (Onro) REFERENCES Osasto(Onro));
  FOREIGN KEY (Tnro) REFERENCES Tyontekija(Tnro),


insert into Tyontekija (Tnro, Enimi, Snimi, Spvm, Sp) values
(1,'Jukka','Salo',str_to_date('09.03.1983', '%d.%m.%Y'),'M');

insert into Tyontekija (Tnro, Enimi, Snimi, Spvm, Sp) values
(2,'Ella','Järvinen',str_to_date('03.05.1989', '%d.%m.%Y'),'N');

insert into Tyontekija (Tnro, Enimi, Snimi, Spvm, Sp) values
(3,'Matti','Koivisto',str_to_date('12.04.1965', '%d.%m.%Y'),'M');

insert into Tyontekija (Tnro, Enimi, Snimi, Spvm, Sp) values
(4,'Kalle','Mäntinen',str_to_date('19.12.1973', '%d.%m.%Y'),'M');

insert into Tyontekija (Tnro, Enimi, Snimi, Spvm, Sp) values
(5,'Romet','Mäki',str_to_date('29.10.1981', '%d.%m.%Y'),'M');

insert into Osasto (Onro, Onimi) 
values (1,'Osasto1');

insert into Osasto (Onro, Onimi) 
values (2,'Osasto2');

insert into Osasto (Onro, Onimi) 
values (3,'Osasto3');

insert into Tyoskentelee (Onro, Tnro, Aloituspvm) 
values (1, 1, str_to_date('29.10.2012', '%d.%m.%Y'));

insert into Tyoskentelee (Onro, Tnro, Aloituspvm) 
values (1, 2, str_to_date('19.11.2010', '%d.%m.%Y'));

insert into Tyoskentelee (Onro, Tnro, Aloituspvm) 
values (1, 3, str_to_date('17.01.2015', '%d.%m.%Y'));

insert into Tyoskentelee (Onro, Tnro, Aloituspvm) 
values (2, 1, str_to_date('12.06.2018', '%d.%m.%Y'));

insert into Tyoskentelee (Onro, Tnro, Aloituspvm) 
values (2, 3, str_to_date('18.04.2013', '%d.%m.%Y'));

insert into Tyoskentelee (Onro, Tnro, Aloituspvm) 
values (2, 4, str_to_date('14.06.2017', '%d.%m.%Y'));

select *
from tyontekija;

select osasto.onro, tyoskentelee.tnro
from osasto
left join tyoskentelee
on osasto.onro = tyoskentelee.onro
union
select tyoskentelee.onro, tyontekija.tnro
from tyontekija
left join tyoskentelee
on tyontekija.tnro = tyoskentelee.tnro;

SELECT tyontekija.Tnro, tyontekija.Enimi, tyontekija.Snimi, subquery.Onro
FROM tyontekija
LEFT JOIN (
  SELECT osasto.Onro, tyoskentelee.Tnro, ROW_NUMBER() OVER (PARTITION BY tyoskentelee.Tnro ORDER BY osasto.Onro) AS row_num
  FROM osasto
  LEFT JOIN tyoskentelee ON osasto.Onro = tyoskentelee.Onro
) AS subquery ON tyontekija.Tnro = subquery.Tnro
WHERE subquery.row_num = 1 OR subquery.row_num IS NULL;

-- Drop the foreign key constraint
ALTER TABLE Tyoskentelee
DROP FOREIGN KEY tyoskentelee_ibfk_1;

-- Drop the Tyontekija table
DROP TABLE Tyontekija;
