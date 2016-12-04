create table room(
	rno int primary key,
	fare int,
	rtype varchar(20));

insert into room values(1,1200,'single_ac');
insert into room values(2,3200,'deluxe_nac');
insert into room values(3,2200,'double_ac');
insert into room values(4,3500,'deluxe_ac');
insert into room values(5,5000,'suite');

create table guest(
	gno int primary key,
	gname varchar(20),
	cdate date,
	nod int,
	nop int,rno1 int foreign key references room(rno));
	
insert into guest values(11,'ridz','7-july-2008',7,2,5);
insert into guest values(22,'nano','15-july-2008',3,2,4);
insert into guest values(33,'nihal','15-july-2008',5,2,1);
insert into guest values(44,'gauri','15-july-2008',12,2,5);
insert into guest values(55,'natasha','3-july-2008',5,2,5);
insert into guest values(66,'hetal','1-july-2008',5,2,4);
insert into guest values(77,'naman','3-july-2008',5,2,1);

select gname
from room,guest
where room.rno=guest.rno1 
	and cdate>='1-july-2008' and cdate<='5-july-2008'; 

select gname,rno
from room,guest
where room.rno=guest.rno1
 and nod>5;
 
select gname,cdate
from room,guest
where room.rno=guest.rno1 
group by gname,cdate;

select rno,max(fare)
from room,guest
where room.rno=guest.rno1
group by rno;

select rno,max(fare)
from room,guest
where room.rno=guest.rno1	
group by rno
having max(fare)>=all(select max(fare)
from room,guest
where room.rno=guest.rno1	
group by rno);