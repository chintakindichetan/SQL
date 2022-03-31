---we can't call table names in stored procedure if we call we get error 
-- we have to use nvarchar datatype for variables associated with sp_executesql statement 
--sp_executesql is a built-in stored procedure in SQL Server that enables to execute of the dynamically constructed SQL statements or batches.

create or alter procedure xy @tbl varchar(50)  
as 
begin
declare @op nvarchar(50)      ---declare var
set @op='select * from ' + @tbl  ---- assgining value to var 
execute sp_executesql @op         --- executing / calling var @op internally in stored procedure
end

exec xy sal   calling stored_procedure
