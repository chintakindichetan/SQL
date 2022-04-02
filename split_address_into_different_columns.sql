--create table adress containing sigle col
--split addresss at comma
--by using cross apply & string_split function which converts single row into multiple rows
--& then pivot the ans 

create table addresss(
 adress varchar(100)
 )
 insert into addresss values('10, bhavani peth,ghongade vasti,solapur')
 insert into addresss values('20,yerwada,pune')
 insert into addresss values('30,kachiguda,hyderabad')

with ct as(
select *, row_number() over(partition by adress order by adress) as rn from addresss cross apply string_split(adress,',')
)
select [1] as adrs1,[2] as adrs2,[3] as adrs3 ,[4] as adrs4 from ct
pivot (max(value) for rn in([1],[2],[3],[4])) as res
