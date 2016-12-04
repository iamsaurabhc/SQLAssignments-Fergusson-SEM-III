create table client(
	cno int primary key,
	cname varchar(20),
	addr varchar(20),
	dob date);

insert into client values(1,'himani','dhanori','07-nov-1994');
insert into client values(2,'nano','fc road','11-nov-1994');
insert into client values(3,'ridz','kothrud','13-aug-1994');
insert into client values(4,'piyu','magarpatta','07-july-1994');
insert into client values(5,'tammy','dhanori','19-dec-1994');

create table poliinfo(
	pno int primary key,
	desc1 varchar(30),
	matamt int,
	preamt int,
	pdate date,
	mdate date,
	cno1 int foreign key references client(cno));
	
insert into poliinfo values(11,'health insurance',500000,7000,'1-aug-2008','3-aug-2009',1);
insert into poliinfo values(22,'agricultural insurance',700000,60000,'8-jan-2008','3-aug-2011',2);
insert into poliinfo values(33,'bike insurance',900000,6000,'1-nov-2009','3-aug-2010',3);
insert into poliinfo values(44,'property insurance',300000,90000,'12-aug-2008','3-aug-2009',4);
insert into poliinfo values(55,'car insurance',100000,7000,'17-july-2009','3-aug-2008',5);

select cname
from client,poliinfo
where client.cno=poliinfo.cno1
	and pdate>'31-dec-2008';

select desc1,max(preamt)
from client,poliinfo
where client.cno=poliinfo.cno1
group by desc1
having max(preamt)>=all(
select max(preamt)
from client,poliinfo
where client.cno=poliinfo.cno1
group by desc1);

select cname
from client,poliinfo
where client.cno=poliinfo.cno1
	and matamt>500000 and datepart(month,dob)=11;


	select datepart(month,dob) as enddb
	from client;

select desc1,pdate
from poliinfo
order by pdate desc;
