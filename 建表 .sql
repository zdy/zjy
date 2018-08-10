use tgzzzx;
create table Company( 
	Cname varchar(100) not null,     
    Cphone varchar(15) not null,     
    Caddress varchar(150) not null,     
    primary key(Cname) 
)
create table Admin(  
	Aid int not null auto_increment,     
    Apassword varchar(50),     
    Cname varchar(100) not null,     
    primary key(Aid),     
    foreign key(Cname) references Company(Cname) 
)
create table WebConcept(
	Wid int not null auto_increment,    
    Wstart mediumtext,     
    Wcontinue mediumtext,     
    Wreturn mediumtext,     
    Wintroduction mediumtext,     
    primary key(Wid) 
)
create table Teacher(  
	Tid int not null auto_increment,     
    Tname varchar(30) not null,     
    Tintroduction text,    
    Cname varchar(100) not null,     
    Wid int not null,    
    primary key(Tid),     
    foreign key(Cname) references Company(Cname),     
    foreign key(Wid) references WebConcept(Wid) 
)
create table Honor( 
	Hid int not null auto_increment,     
    Hdate date,     
    Hintroduction text,    
    Wid int not null,     
    primary key(Hid),    
    foreign key(Wid) references WebConcept(Wid) 
)
create table User(  
	Uid varchar(100) not null,     
    Upassword varchar(100) not null,    
    Ubool tinyint(1),     
    Wid int not null,    
    primary key(Uid),     
    foreign key(Wid) references WebConcept(Wid) 
)
create table Volunteers(  
	Vid int not null auto_increment,     
    Vname varchar(50) not null,     
    Vsex varchar(5) check(Vsex in ('男' or '女')),     
    Vage int not null,     
    Vmotto varchar(50),     
    Vyear year check(Vyear in (2010-2050)),     
    Vphone varchar(30) not null,     
    Vaddress varchar(100) not null,     
    Vpicture varchar(120),     
    Vnotes text,     
    Uid varchar(100) not null,     
    Vdate datetime,     
    primary key(Vid),     
    foreign key(Uid) references user(Uid) 
)
create table People(  
	Pid int not null auto_increment,     
    Pname varchar(50) not null,     
    Page int not null,     
    Psex varchar(5) check(Psex in ('男','女')),    
    Pedu varchar(15) check(Pedu in ('本科生','专科生','研究生')),     
    Pphone varchar(30) not null,     
    Pcredit varchar(30) check(Pcredit in ('首贷','续贷','还款')),     
    Pdate date,     
    Ptime time,     
    Pbool tinyint(1),     
    Uid varchar(100) not null,     
    Pndate datetime,     
    primary key(Pid),     
    foreign key(Uid) references user(Uid) 
)
