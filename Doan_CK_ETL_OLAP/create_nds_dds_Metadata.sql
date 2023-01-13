use METADATA
go 
select * from NDS
create table NDS(
	ID int IDENTITY(1,1) PRIMARY KEY,
	TenBang nvarchar(50),
	NgayTao date,
	NgayCapNhat date
);
create table DDS(
	ID int IDENTITY(1,1) PRIMARY KEY,
	TenBang nvarchar(50),
	NgayTao date,
	NgayCapNhat date
);
INSERT INTO NDS (TenBang, NgayTao,NgayCapNhat)
VALUES ('Cases_Report', GETDATE(), GETDATE()),
('Compiled_COVID19_Case_Details_Canada', GETDATE(), GETDATE()),
('Ongoing_Outbreaks_PHU', GETDATE(), GETDATE()),
('PHU', GETDATE(), GETDATE()),
('PHU_GROUP', GETDATE(), GETDATE()),
('Vaccines_By_Age_PHU', GETDATE(), GETDATE());

INSERT INTO DDS (TenBang, NgayTao,NgayCapNhat)
VALUES ('City', GETDATE(), GETDATE()),
('DimDate', GETDATE(), GETDATE()),
('Fact_ThongKe', GETDATE(), GETDATE()),
('Ongoing_Outbreaks_DDS', GETDATE(), GETDATE()),
('Phu_DDS', GETDATE(), GETDATE()),
('Phu_Group_DDS', GETDATE(), GETDATE()),
('Fact_Deceased_Age_Year', GETDATE(), GETDATE()),
('fact_outbreak_group', GETDATE(), GETDATE()),
('Vaccines_By_Age_PHU', GETDATE(), GETDATE());