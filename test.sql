create database XSCJ
on(
name='XSCJ_Data',
filename='F:\github\DataBase\XSCJ\XSCJ.mdf',
size=5MB,
maxsize=10MB,
filegrowth=10%
)
log on(
name='XSCJ_Log',
filename='F:\github\DataBase\XSCJ\XSCJ.ldf',
size=2MB,
maxsize=5MB,
filegrowth=1MB
)
go

create table Course(
Cno char(4) primary key,
Cname char(40) not NULL,
Cpno char(4),
Ccredit smallint,
foreign key(Cpno) references course(Cno)
);

alter table Course add Cterm char(4);

create unique index Cname_idx on Course(Cname);

alter table Course drop column Cterm;

drop index Course.Cname_idx;

create table Student(
Sno char(9) primary key,
Sname char(20) unique,
Ssex char(2),
Sage smallint,
Sdep char(20)
);

drop table Student;

--drop database XSCJ;
--drop database BSXT;

create database BSXT
on(
name='BSXT_Data',
filename='F:\github\DataBase\BSXT\BSXT.mdf',
size=5MB,
maxsize=10MB,
filegrowth=10%
)
log on(
name='BSXT_Log',
filename='F:\github\DataBase\BSXT\BSXT.ldf',
size=2MB,
maxsize=5MB,
filegrowth=1MB
)
go

alter database BSXT
modify file(
name='BSXT_Data',
maxsize=unlimited
)
go

create table Student(
Sno char(10) primary key,
Sname char(10) not null,
Ssex char(2) check(Ssex='��' or Ssex='Ů'),
Sclass char(10),
Stel char(11) not null,
Sgroup char(1) not null,
Spassword char(10) not null
);

create table Teacher(
Tno char(10) primary key,
Tname char(10) not null unique,
Tsex char(2) check(Tsex='��' or Tsex='Ů'),
Tdept char(20)  not null default('�������ѧ�뼼��ϵ'),
Tdegree char(8),
Ttitle char(10),
Tright bit not null check(Tright='true' or Tright='false'),
Ttel char(11) not null,
Temail char(50),
Tgroup char(1) not null,
Tpassword char(10) not null
)

create table Desion(
Hoo char(4) primary key,
Hname char(50) not null,
Hstatus char(5) not null,
Hcontent char(200),
dircetion char(200),
Tno char(10),
Sno char(10),
foreign key (Tno) references Teacher(Tno),
foreign key (Sno) references Student(Sno)
)

create table SC(
Sno char(9) not null,
Cno char(4) not null,
Grande char(4) not null
)

--��ѯѡ���˿γ̵�ѧ����ѧ�ţ�
select distinct Sno
from SC

--��ѯѧ�������ͳ�����ݣ����б�����ΪXM��CSNF��
select Sname Xm,(2018-Sage) CSNF
from Student

--��ѯ������18-20֮���ѧ�ţ�������ϵ
select Sno,Sname,Sdep
from Student
where Sage>=18 and Sage<=20;

--��ѯ��Ϣϵ��IS������ѧϵ��MA���ͼ������ѧϵ��CS��ѧ�����������Ա� 
select Sname,Ssex
from Student
where Sdep='CS';

select Sname,Ssex
from Student
where Sdep='MA';

select Sname,Ssex
from Student
where Sdep='IS';

--��LIKE��ѯ�γ���ΪDB_S�̵Ŀγ̺ź�ѧ�֡�
select Cno,Ccredit
from Course
where Cname like '����%';

--�������гɼ���ѧ��ѧ�źͿγ̺š�
select distinct Sno,Cno
from SC
where SC.Grande!='NULL';

--��ѯȫ��ѧ���������ѯ���������ϵ��ϵ���������У�ͬһϵ�е�ѧ����������������

--��ѯѡ���˿γ̵�ѧ��������

--����1�ſγ̵�ѧ��ƽ���ɼ���

--��ѯ��3�����ϣ���3�ˣ�ͬѧѡ�޿γ̵Ŀγ̺š�

--��ѯ1�ſγ̵ļ�����޿Ρ�

--��ѯÿ��ѧ����ѧ�š�������ѡ�޵Ŀγ������ɼ���
select Student.Sno,Sname,Cname,Grande
from Course,SC,Student
where SC.Sno=Student.Sno and SC.Cno=Course.Cno;

--�ҳ�ÿ��ѧ��������ѡ�޿γ�ƽ���ɼ��Ŀγ̺š�




--��ѯȫ��ѧ����ѧ�ź������͵绰��

--��ѯȫ��ѧ���Ļ��������

--��ѯ���˱�ҵ������ʦ�Ľ�ʦ�š�

--��ѯ��ʦ�����������������

--��ѯ�����ա�����ͬѧ�Ļ��������

--ͳ��ÿ��ѧ����ʦ��������

--��ѯ1����ʦ������ҵ���Ļ������������ѧ�ţ���������ʦ�ţ���ʦ��������ҵ�����Ŀ��
--(ע:1����ʦֻ�ܴ�1���ѧ��)

--��ѯ����ѧ����ѡ�����������û��ѡ���ѧ����������ѧ�ţ���������Ŀ���ƣ���ʦ���ơ�
--(ע:Ҫ����ʦ����ź�ѧ���������һ��.)
