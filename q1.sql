create table inspector(
	iid int primary key,
	iname varchar(20),
	bdate date,
	sdate date,
	mobile numeric(9,0)
);

create table manager(
	mid int primary key,
	mname varchar(20) not null,
	address varchar(20),
	city varchar(10),
	mobile numeric(9,0),
	email varchar(20)
);

create table restaurant(
	lno int primary key,
	rname varchar(20),
	address varchar(20),
	city varchar(10),
	phone numeric(9,0),
	odate date,
	mid int not null,
	foreign key (mid) references manager
);

create table inspection(
	lno int references restaurant
	on delete cascade,
	idate date,
	iid int references inspector
	on delete cascade,
	stime time,
	passed int check(passed>-1 and passed<2),
    violations varchar(100),
	primary key(lno, idate)
);