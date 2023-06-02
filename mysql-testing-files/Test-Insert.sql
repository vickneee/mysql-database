create table DataTypes (
  Dt int not null,
  Kl int not null,
  Rl decimal(5,3) not null,
  Mj varchar (10) not null,
  M char(1),
  Pvm date not null,
  primary key(Dt));

insert into DataTypes (Dt,Kl,Rl,Mj,M,Pvm) values
(1,1000,5.2,'Varia','V','2023-02-07');