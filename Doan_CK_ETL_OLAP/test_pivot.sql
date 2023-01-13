select * from Compiled_COVID19_Case_Details_Canada
use NDS
go
select date_reported,phu_id, [Recovered], [Deceased], [Active], ISNULL(b.Active,0)+ISNULL(b.Deceased,0)+ISNULL(b.Recovered,0) as Infected from 
(
select date_reported,phu_id,case_status, count(*) as so_nguoi from Compiled_COVID19_Case_Details_Canada
group by date_reported,phu_id,case_status
) as a
PIVOT
(
sum(so_nguoi) for case_status in ([Recovered],[Deceased], [Active])
) as b

