drop table Kansalaisuus;
drop table Maa;
drop table Urheilee;
drop table Urheilu;
drop table Urheilija;

CREATE TABLE Urheilija
(
  UrhelijaNro INT NOT NULL,
  Nimi VARCHAR(15) NOT NULL,
  Spvm DATE NOT NULL,
  Sp CHAR(1),
  SyntymaMaa VARCHAR(20) NOT NULL,
  PRIMARY KEY (UrhelijaNro)
);

CREATE TABLE Urheilu
(
  UrheiluNro INT NOT NULL,
  Nimi VARCHAR(20) NOT NULL,
  Tyyppi VARCHAR(15) NOT NULL,
  MinIka INT NOT NULL,
  MaxIka INT NOT NULL,
  PRIMARY KEY (UrheiluNro)
);

CREATE TABLE Maa
(
  MaaNro INT NOT NULL,
  Nimi VARCHAR(20) NOT NULL,
  PRIMARY KEY (MaaNro)
);

CREATE TABLE Urheilee
(
  AloitusPvm DATE NOT NULL,
  LopetusPvm DATE NOT NULL,
  UrheiluNro INT NOT NULL,
  UrhelijaNro INT NOT NULL,
  PRIMARY KEY (UrheiluNro, UrhelijaNro),
  FOREIGN KEY (UrheiluNro) REFERENCES Urheilu(UrheiluNro),
  FOREIGN KEY (UrhelijaNro) REFERENCES Urheilija(UrhelijaNro)
);

CREATE TABLE Kansalaisuus
(
  AloitusPvm DATE NOT NULL,
  LopetusPvm DATE NOT NULL,
  MaaNro INT NOT NULL,
  UrhelijaNro INT NOT NULL,
  PRIMARY KEY (MaaNro, UrhelijaNro),
  FOREIGN KEY (MaaNro) REFERENCES Maa(MaaNro),
  FOREIGN KEY (UrhelijaNro) REFERENCES Urheilija(UrhelijaNro)
);

insert into Urheilija (UrhelijaNro,Nimi,Spvm,Sp,SyntymaMaa) 
values (1,'Totti','1960-01-01','M','Italia');

insert into Urheilija (UrhelijaNro,Nimi,Spvm,Sp,SyntymaMaa) 
values (2,'Kimi','1985-03-15','M','Suomi');

insert into Urheilu (UrheiluNro,Nimi,Tyyppi,MinIka,MaxIka) 
values (1,'Jalkapallo','Joukkue', 7,50);

insert into Urheilu (UrheiluNro,Nimi,Tyyppi,MinIka,MaxIka) 
values (2,'F1','Joukkue', 18,60);

insert into Maa (MaaNro,Nimi) values(1,'CostaRica');
insert into Maa (MaaNro,Nimi) values(2,'Italia');
insert into Maa (MaaNro,Nimi) values(3,'Iran');
insert into Maa (MaaNro,Nimi) values(4,'Suomi');

insert into Urheilee (AloitusPvm,LopetusPvm,UrheiluNro,UrhelijaNro) 
values ('1975-03-15','2010-03-15',1,1);

insert into Urheilee (AloitusPvm,LopetusPvm,UrheiluNro,UrhelijaNro) 
values ('1975-03-15', '2010-03-15',2,2);

insert into Kansalaisuus (AloitusPvm,LopetusPvm,MaaNro,UrhelijaNro) 
values ('1960-01-01','2030-03-15',2,1);

insert into Kansalaisuus (AloitusPvm,LopetusPvm,MaaNro,UrhelijaNro) 
values ('1985-03-15','2030-03-15',4,2);

SELECT nimi, YEAR(CURRENT_DATE) - YEAR(spvm) - (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(spvm, '%m%d')) AS Ikä
FROM urheilija;

SELECT u2.urhelijanro, u1.nimi, u3.nimi, FLOOR(DATEDIFF(CURRENT_DATE, spvm) / 365) AS Ikä
FROM urheilija u1, urheilee u2, urheilu u3
WHERE u1.UrhelijaNro = u2.UrhelijaNro AND u3.urheilunro = u2.urheilunro;

