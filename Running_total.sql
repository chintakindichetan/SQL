--select a unique col to sum each row of sal/marks in below eg there is empno
-- select empno & compare it with itself by using table alias from inner to outer query

SELECT empno , ename,job,sal,(
	 SELECT SUM(E2.[sal]) 
         FROM [EMP] AS E2
         WHERE E2.[EMPNO] <= e1.[empno]
	) AS [Running Total]
  FROM [emp] AS e1
