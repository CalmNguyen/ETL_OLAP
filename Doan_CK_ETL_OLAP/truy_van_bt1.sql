select * from Fact_ThongKe
select distinct case_status, PHU_ID, Sum(So_Nguoi) from Fact_ThongKe where phu_id = 3895 group by case_status, PHU_ID

select phu_id, reporting_phu from phu_dds
select * from DimDate
select * from 

select count(*) from Fact_ThongKe
select * from Fact_ThongKe where PHU_ID = 2234
select phu_id, sum(So_Nguoi) from Fact_ThongKe group by PHU_ID 
truncate table Fact_ThongKe
select sum(So_Nguoi) from Fact_ThongKe
select PHU_ID, case_status, NgayID,So_Nguoi from Fact_ThongKe where PHU_ID = 2234
select distinct PHU_ID, case_status, count(So_Nguoi) from Fact_ThongKe where PHU_ID = 2234 group by PHU_ID, case_status

create table test(
	i int,
	j int
);
insert into test(i,j) values
(1,2),(2,3),(3,4),(3,3)
go
select * from test
select sum(j) from test
select i,sum(j) from test group by i