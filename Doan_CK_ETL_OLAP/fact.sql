use DDS
go 
CREATE TABLE Phu_Group_DDS(
	GROUP_ID int IDENTITY(1,1) PRIMARY KEY,
	PHU_Group nvarchar(50) NULL,
	NgayTao date,
	NgayCapNhat date,
);
CREATE TABLE City_DDS (
    City_ID int IDENTITY(1,1) PRIMARY KEY,
    City nvarchar(50),
	GROUP_ID int,
	NgayTao date,
	NgayCapNhat date
	FOREIGN KEY (GROUP_ID) REFERENCES Phu_Group_DDS(GROUP_ID)
);
CREATE TABLE Phu_DDS(
	[PHU_ID] [int] NULL,
	[Reporting_PHU] [nvarchar](100) NULL,
	[Reporting_PHU_Address] [nvarchar](50) NULL,
	[Reporting_PHU_City] [nvarchar](50) NULL,
	[Reporting_PHU_Postal_Code] [nvarchar](50) NULL,
	[Reporting_PHU_Website] [nvarchar](100) NULL,
	[Reporting_PHU_Latitude] [bigint] NULL,
	[Reporting_PHU_Longitude] [bigint] NULL,
	[City_ID] [INT],
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
	FOREIGN KEY (City_ID) REFERENCES City_DDS(City_ID)
);

CREATE TABLE Ongoing_Outbreaks_DDS(
	[ID] [INT] IDENTITY(1,1) PRIMARY KEY,
	[outbreak_group] [nvarchar](50) NOT NULL,
	NgayTao date,
	NgayCapNhat date,
);
drop table Fact_ThongKe
create table Fact_ThongKe(
	FactID int IDENTITY(1,1) PRIMARY KEY,
	PHU_ID int,
	Reporting_PHU nvarchar(100),
	Deceased int default (0),
	Active int default (0),
	Infected int default (0),
	Recovered int default (0),
	NgayID int,
	NgayTao date,
	NgayCapNhat date,
	FOREIGN KEY (NgayID) REFERENCES DimDate(DateKey)
);

create table Fact_Deceased_Age_Year(
	ID int IDENTITY(1,1) PRIMARY KEY,
	age_group nvarchar(50),
	gender nvarchar(50),
	year varchar(4),
	So_Nguoi bigint,
	NgayTao date,
	NgayCapNhat date
);
create table fact_outbreak_group(
	Fact_ID int IDENTITY(1,1) PRIMARY KEY,
	outbreak_group nvarchar(50),

);
CREATE TABLE [fact_outbreak_group] (
    [Fact_ID] int IDENTITY(1,1) PRIMARY KEY,
    [outbreak_group] nvarchar(50),
    [city] nvarchar(50),
    [phu_group] nvarchar(50),
    [year] varchar(4),
    [number_ongoing_outbreaks] bigint,
    [Deceased] bigint,
    [Infected] bigint,
	NgayTao date,
	NgayCapNhat date
)
Create table Vaccines_By_Age_PHU(
	ID int IDENTITY(1,1) PRIMARY KEY,
	Date date,
	PHU_ID int,
	At_least_one_dose_cumulative bigint,
	NgayTao date,
	NgayCapNhat date
);
select SUM(At_least_one_dose_cumulative) from Vaccines_By_Age_PHU
select * from fact_outbreak_group
select ISNULL(Deceased,0)*ISNULL(Active,1) from Fact_ThongKe
select * from Fact_ThongKe

select b.outbreak_group, b.city, b.phu_group, b.year,SUM(b.Deceased) as Deceased, SUM(b.infected) as Infected, SUM(b.CFR) as CFR,b.Lever from
(select 
a.outbreak_group, a.city, a.phu_group, a.year,a.Deceased, a.infected, a.CFR, CASE
 when CFR < 0.025 then 1
 when CFR < 0.05 then 2
 when CFR < 0.2 then 3
 ELSE 4 END as Lever
 from 
 (select fg.outbreak_group, fg.city, fg.phu_group, fg.year,fg.Deceased, fg.infected,CAST((CAST(ISNULL(fg.Deceased,0) AS FLOAT) / CAST(ISNULL(fg.infected,1) AS FLOAT)) as FLOAT) as CFR 
 from fact_outbreak_group fg) as a) as b

group by b.outbreak_group, b.city, b.phu_group, b.year, b.Lever
select outbreak_group, City, phu_group, year from fact_outbreak_group

select * from Fact_ThongKe
--bai 1
select ft.PHU_ID,d.year,SUM(ft.Deceased) as Deceased, SUM(ft.Recovered) as Recovered,SUM(ISNULL(ft.Deceased,0) + ISNULL(ft.Recovered,0) + ISNULL(ft.Active,0)) as Infected, d.year 
from Fact_ThongKe ft inner join DimDate d on ft.NgayID = d.DateKey
group by ft.PHU_ID, d.year
--bai 2
select a.Quarter, a.Year, a.PHU_ID, a.CFR, CASE
 when CFR < 0.025 then 1
 when CFR < 0.05 then 2
 when CFR < 0.2 then 3
 ELSE 4 END as Lever 
from
(select ft.PHU_ID,d.Quarter,d.year,CAST(CAST(sum(ISNULL(ft.Deceased,0)) as FLOAT)/CAST(sum(ISNULL(ft.Deceased,1)+ISNULL(ft.Deceased,0)+ISNULL(ft.Deceased,0)) as FLOAT) as FLOAT) as CFR
from Fact_ThongKe ft inner join DimDate d on ft.NgayID = d.DateKey
group by ft.phu_id, d.Quarter, d.Year
) as a
order by a.PHU_ID, a.Year, a.Quarter, Lever
--bai 3
select age_group,gender,year, So_Nguoi as Deceased from Fact_Deceased_Age_Year 
--bai 4


select outbreak_group, city, phu_group, year from fact_outbreak_group
select * from DimDate
select ft.PHU_ID, ft.Deceased, ft.Recovered,ft.Deceased + ft.Recovered + ft.Active as Infected, d.year 
from Fact_ThongKe ft inner join DimDate d on ft.NgayID = d.DateKey


select * from Fact_ThongKe
select * from fact_outbreak_group
select * from Fact_Deceased_Age_Year
select * from Ongoing_Outbreaks_DDS