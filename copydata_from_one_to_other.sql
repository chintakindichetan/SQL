
create or alter proc copytabl  @ip_table nvarchar(100),@op_table nvarchar(100)   ----taking ip two var 
 as
 begin
 declARE @SQL   nvarchar(max) 
 set @sql = 'select * into '+ @op_table +' from '+ @ip_table    ---assigning value to var
 execute sp_executesql @sql                                    ---executing var
 end

 exec copytabl sal,sal22                                        ---calling sp
