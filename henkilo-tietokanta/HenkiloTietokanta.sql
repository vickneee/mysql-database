CREATE TABLE Henkilo (
  Hetu INT NOT NULL,
  Enimi VARCHAR(15) NOT NULL,
  Snimi VARCHAR(15) NOT NULL,
  Spvm DATE NOT NULL,
  Sp CHAR(1),
  PRIMARY KEY (Hetu));

CREATE TABLE Harrastus (
  Hnro INT NOT NULL,
  Hnimi VARCHAR(15) NOT NULL,
  MinIka INT NOT NULL,
  MaxIka INT NOT NULL,
  PRIMARY KEY (Hnro));

CREATE TABLE Harrastaa (
  Aloituspvm DATE NOT NULL,
  Hetu INT NOT NULL,
  Hnro INT NOT NULL,
  FOREIGN KEY (Hetu) REFERENCES Henkilo(Hetu),
  FOREIGN KEY (Hnro) REFERENCES Harrastus(Hnro),
  PRIMARY KEY (Aloituspvm));

insert into henkilo (Hetu, Enimi, Snimi, Spvm, Sp) values
(18111979, 'Pekka', 'Savolainen', '1979-11-18', 'M');

insert into henkilo (Hetu, Enimi, Snimi, Spvm, Sp) values
(01011983, 'Tiina', 'Karjalainen', '1983-01-01', 'N');

insert into henkilo (Hetu, Enimi, Snimi, Spvm, Sp) values
(12041981, 'Jari', 'Oululainen', '1981-04-12', '');

insert into henkilo (Hetu, Enimi, Snimi, Spvm, Sp) values
(10031982, 'Janne', 'Virolainen', '1982-03-10', 'M');

insert into Harrastus (Hnro, Hnimi, MinIka, MaxIka) values
(1, 'Jalkapallo', 5, 45);

insert into Harrastus (Hnro, Hnimi, MinIka, MaxIka) values
(2, 'Koripallo', 5, 55);

insert into Harrastus (Hnro, Hnimi, MinIka, MaxIka) values
(3, 'Lentopallo', 5, 65);

insert into Harrastaa (Aloituspvm, Hetu, Hnro) values
('2005-10-12', 18111979, 1);

insert into Harrastaa (Aloituspvm, Hetu, Hnro) values
('2012-10-19', 01011983, 1);

insert into Harrastaa (Aloituspvm, Hetu, Hnro) values
('2013-08-04', 12041981, 3);

insert into Harrastaa (Aloituspvm, Hetu, Hnro) values
('2009-09-07', 10031982, 2);
