create table donor(
	dno int primary key,
	dname varchar(20),
	dcity varchar(20),
	rbno int foreign key references blood(bno));

insert into donor values(1,'nano','pune',101);
insert into donor values(2,'naman','pune',102);
insert into donor values(3,'komal','pune',104);
insert into donor values(4,'tammy','pune',104);
insert into donor values(8,'shal','pune',107);
insert into donor values(5,'erich','pune',103);
insert into donor values(6,'vishu','pune',106);
insert into donor values(7,'vishal','pune',105);

select * from donor;
create table blood(
	bno int primary key,
	bgrp varchar(12),
	qty int,
	rh_fctr varchar(12),
	doc date);

insert into blood values(101,'O',300,'rh +ve','11-april-2008');
insert into blood values(102,'B',250,'rh +ve','31-jan-2007');
insert into blood values(103,'AB',200,'rh -ve','12-aug-2008');
insert into blood values(104,'A',100,'rh +ve','11-april-2008');
insert into blood values(105,'A',100,'rh -ve','12-april-2008');
insert into blood values(106,'A',100,'rh -ve','13-april-2008');
insert into blood values(107,'B',100,'rh -ve','31-jan-2007');

select count(dno) as donated_on_date
from donor,blood
where donor.rbno=blood.bno
	and doc='11-april-2008';

select dname,dcity
from donor,blood
where donor.rbno=blood.bno
	and bgrp='A' and rh_fctr='rh -ve';

select bgrp,sum(qty) as quantity
from donor,blood
where donor.rbno=blood.bno
	and doc='31-jan-2007'
group by bgrp;

select dname,bgrp
from donor,blood
where donor.rbno=blood.bno
group by dname,bgrp;
