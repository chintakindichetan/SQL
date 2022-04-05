-----------------------System defined functions
---2 types
----1.single Row function  --------2. group function 

------single row functions
--char
--numeric
--DateTime
--Null
--Conversion


--------Group Function
--Avg
--min,Max
--sum
--count
--rank

---------------------------------------charachter functions
select * from EMP
select ASCII(ename) from EMP --gives ascii value of 1st char

Select Ascii('A'),ascii('a'),ascii('z'),ascii('Z');
Select Char (90),char (120);
Select Charindex('a','Maharashtra')

select CHARINDEX('a',ename) from EMP --finds index of letter a in each row of ename col

SELECT PATINDEX('%schools%', 'W3Schools.com');/* writtens starting position of schools from w3schools.com*/

select left(ename,3) from emp  --- returns 1st 3 chars of name from ename col

select RIGHT(ename,3) from EMP  --- returns last 3 chars of name from ename col

select LEN(ename) from EMP

select LOWER (ename),LOWER(job) from EMP 

select upper (ename),upper(job) from EMP 

select LTRIM('   ram'), RTRIM('ram    ') , TRIM('   ram   ') 

select REPLACE(ename,'a','____') from EMP ---replaces every 'a' char from ename with ____

select REPLICATE(EMPNO,3) as username from emp ---replicates empno values by 3 times

select REVERSE(empno) as reversed_emp,REVERSE(hiredate) as reverse_date,REVERSE(ENAME)  from EMP

select ename + SPACE(20) + job from emp

select SUBSTRING(JOB,1,4),SUBSTRING(CAST(hiredate as varchar(20)),1,4) as year from emp

select CONCAT(ename,job) from EMP

select CONCAT_WS('__',ename,job,sal) from EMP

select DATALENGTH(ename) from EMP

select FORMAT(sal,'##,###')as sal,FORMAT(HIREDATE,'dd/MM--yyyy') as formatted_date  from EMP

select FORMAT(sal,'c','in-IN'),FORMAT(sal,'c','us-US'),FORMAT(sal,'c','jp-JP') from EMP

select FORMAT(sal/1000,'p','en-IN') from EMP

select STUFF(ename,1,0,'Name--') from EMP------------delets chars from string replace them with given substitute
										--Here 1 is start position of string & 0 is number to delete chars from start position

select TRANSLATE(cast(hiredate as varchar(20)),'-0','/o') from EMP ---it translates every specified chars with every occurence in this eg. - with / & 0 with 0

SELECT TRANSLATE('3*[2+1]/{8-4}', '[]{}', '()()'); /* Results in 3*(2+1)/(8-4) */

-------------------------------------Numeric Functions

select SIN(.5),cos(.5),taN(.5),cot(.5)

select ACOS(0.5),ASIN(0.5),ATAN(45),ATN2(.5,23.5)

select CEILING(11.5),CEILING(23.2),CEILING(43.8)

select floor(1.5),floor(2.2),floor(3.8)

select ABS(sal) from emp
Select abs(10),ABS(-19),ABS(10-20),ABS(10-5)

select DEGREES(30),RADIANS(1718)            ----converts radian to degrees

select EXP(2)                 ---- returns exponential value of given number e^2.

select LOG(2),LOG10(2)

select PI(),POWER(4,2),POWER(2,5)

select RAND()----------random number between 0,1

select ROUND(22.4343,2),ROUND(22.5,-1),ROUND(22.7345,3)

select SIGN(-12),SIGN(34)

select SQUARE(3),SQRT(9)

---------------------------------------------------aggregate functions

select deptno,AVG(sal)as dept_avrg ,COUNT(empno) emp_cnt,MIN(ename) as fst_emp_in_dept ,Max(ename) as last_emp_in_dept,SUM(sal) as deptsal from EMP
group by DEPTNO

-------------------------------------------------DateTime functions

select CURRENT_TIMESTAMP  -------returns date in format yyyy-MM-dd hh-mm-ss

select GETDATE()       -------returns date in format yyyy-MM-dd hh-mm-ss

select DATEADD(yy,30,hiredate) from EMP  ---adds 30 years to hiredate col
										/*  year, yyyy, yy = Year
											quarter, qq, q = Quarter
											month, mm, m = month
											dayofyear, dy, y = Day of the year
											day, dd, d = Day
											week, ww, wk = Week
											weekday, dw, w = Weekday
											hour, hh = hour
											minute, mi, n = Minute
											second, ss, s = Second
											millisecond, ms = Millisecond  */
select DATEADD(m,5,hiredate),DATEADD(D,5,hiredate) from EMP

select DATEDIFF(YEAR,hiredate,GETDATE()) from EMP 

select DATEFROMPARTS(2022,3,5)  ---returns date from given parts

select DATENAME(WEEKDAY,GETDATE()),DATENAME(WEEK,GETDATE()) ---returns name of date 

select DATEPART(yy,hiredate) from EMP ------takes specified date part from date

select DAY(hiredate), MONTH(hiredate) , YEAR(hiredate) from EMP  ----returns day of that month from hiredate

select ISDATE(cast(hiredate as varchar(20))) from EMP ---returns 1 if its valid date else 0

select ISDATE('2032'),ISDATE('sql')

SELECT SYSDATETIME() AS SysDateTime;

----------------------coversion functioins

select CAST(hiredate as varchar(20)) from emp

select CONVERT(varchar,EMPNO),CONVERT(varchar,HIREDATE,103) from EMP

------------------------null functions
select coalesce(comm,0) from EMP

select sal,IIF(sal>=5000, 'High','Low') from EMP  

select ISNULL(comm,11) from EMP	----if null replace with 11

select ISNUMERIC(ename),ISNUMERIC(empno) from EMP ----if true returns 1 else 0

select nullif('Hello','Hello'),nullif('Hello','CLC') --if same returns null else 1st expression

select USER_ID(),USER_NAME(),USER,SYSTEM_USER,SESSION_USER

SELECT SESSIONPROPERTY('ANSI_NULLS');
