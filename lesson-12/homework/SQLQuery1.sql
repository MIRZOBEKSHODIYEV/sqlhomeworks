declare @db_name varchar(255);

declare my_cursor cursor for
	select name from sys.databases where name not in
	('master', 'tempb', 'model', 'msdb');
open my_cursor;

select @db_name;
fetch next from my_cursor into @db_name;
select @db_name, @@FETCH_STATUS;

fetch next from my_cursor into @db_name;
select @db_name, @@FETCH_STATUS;


while @@FETCH_STATUS=0
begin
	print @db_name
	fetch next from my_cursor into @db_name;
end;
close my_cursor;
deallocate my_cursor;