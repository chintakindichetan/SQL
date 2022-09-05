input
 
output
 
create table input1 (time time, status varchar(4) )

insert into input1 values('10:01','in')
insert into input1 values('10:02','in')
insert into input1 values('10:03','in')
insert into input1 values('10:04','in')
insert into input1 values('10:05','Out')
insert into input1 values('10:08','in')
insert into input1 values('10:09','in')
insert into input1 values('10:10','Out')
insert into input1 values('10:15','in')
insert into input1 values('10:19','Out')

Soln.1
with ct as(
select  t1,t2,
ROW_NUMBER() over (partition by t1 order by t1,t2) as rn
from (select time t1 from input1 where status='in') i1 ,(select TIME t2 from input1 where status='out') i2  
where t1<t2 )
select min(t1) login,t2 logout,count(t2) countt from ct where rn=1 group by t2

Soln.2
select min(check_in),check_out,count(*)-1 as in_count from
(select check_in,status,min(check_out) over (order by check_in rows between current row and unbounded following) as check_out from
(select a.time as check_in,a.status,b.time as check_out from
log_table as a left join (select * from log_table where status=="out") as b on a.time=b.time)) group by check_out
