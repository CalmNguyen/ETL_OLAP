select * from Compiled_COVID19_Case_Details_Canada where date_reported = '2020-03-23 19:00:00.0000000'
select * from phu
select * from Compiled_COVID19_Case_Details_Canada
select * from Ongoing_Outbreaks_PHU
use nds 
go
select phu_id, date_reported,case_status, count(case_status) as count_TuVong_And_Other from Compiled_COVID19_Case_Details_Canada group by phu_id, date_reported,case_status

select objectId, date_reported, health_region, phu_id, case_status from Compiled_COVID19_Case_Details_Canada

select date_reported from Compiled_COVID19_Case_Details_Canada