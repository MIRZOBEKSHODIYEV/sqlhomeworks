declare @num int=10

if @num%2=0
begin
	print 'juft son'
else
	print 'toq son'
end;

go

declare @num int=0;

while @num<10
begin
	print @num;
	set @num = @num + 1;
	union all
end;