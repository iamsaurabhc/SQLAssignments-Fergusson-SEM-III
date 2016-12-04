use nano;

create table game(gname varchar(20) primary key,nop int,captname varchar(20));
insert into game values ('cricket',11,'virat');
insert into game values ('basketball',11,'jaremy lin');
insert into game values ('football',11,'messi');
insert into game values ('chess',2,'mr.nene');
insert into game values ('badminton',4,'mr.james');
create table player(pname varchar(20) primary key,addr varchar(20),clubname varchar(20));
insert into player values('dhoni','ranchi','icc');
insert into player values('sachin','mumbai','bcci');
insert into player values('sehwag','delhi','bcci');
insert into player values('yuvi','punjab','icc');
insert into player values('bhajji','punjab','icc');
insert into player values('virat','delhi','icc');
insert into player values('anand','pune','chessassociation');
insert into player values('neymar','brazil','fifa');
insert into player values('ronaldo','portugese','fifa');
insert into player values('saina','mumbai','pyc');
insert into player values('sindhu','bangalore','pyc');
create table gp(coachname varchar(20),gname1 varchar(20) foreign key references game(gname),
pname1 varchar(20) foreign key references player(pname));

insert into gp values('ravishastri','cricket','dhoni');
insert into gp values('gary','cricket','virat');
insert into gp values('ravishastri','cricket','saina');
insert into gp values('vishwanathan','chess','saina');
insert into gp values('padukone','badminton','saina');
insert into gp values('mr.henry','football','neymar');



select pname 
from player,game,gp
where player.pname=gp.pname1 and game.gname=gp.gname1
group by pname
having count(pname)>2

select gname,captname
from player,game,gp
where player.pname=gp.pname1 and game.gname=gp.gname1
group by gname,captname
having count(coachname)>2

select distinct gname
from game
where  nop>5;

select pname,coachname 
from player,game,gp
where player.pname=gp.pname1 and game.gname=gp.gname1
group by pname,coachname

