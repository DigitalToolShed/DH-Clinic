create database DH_Clinic
use DH_Clinic
go

create table DH
(
ID int identity(1,1) Primary key,
Title nvarchar(200),
[Subject] nvarchar(200),
[Description] nvarchar(200),
[Creator] nvarchar(200),
[Source] nvarchar(200),
[Publisher] nvarchar(200),
[Date] nvarchar(200),
[Contributor] nvarchar(200),
[Rights] nvarchar(200),
[Relation] nvarchar(200),
[Format] nvarchar(200),
[Language] nvarchar(200),
[Type] nvarchar(200),
[Identifier] nvarchar(200),
[Coverage] nvarchar(200),
[Tags] nvarchar(200),
[Lat] nvarchar(200),
[Long] nvarchar(200),
[URL] nvarchar(200)
)
go

alter table DH
add constraint Must_Have_Title_Constraint
check (Title is not NULL)

alter table DH
add constraint Must_Have_Title_URL
check ([URL] is not NULL)

alter table DH
add constraint Must_Be_Unique_URL
unique([URL])
go


insert into DH
select * from openrowset('Microsoft.ACE.OLEDB.12.0','Excel 12.0;Database=C:\DH.xlsx;HDR=Yes','select * from [Sheet1$]') 
where Title is not NULL
go

select * from DH
go