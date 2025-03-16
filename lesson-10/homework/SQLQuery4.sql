create view demo

create produre sp_sales_for_date
as 
begin
create table #temp
(
	productkey int,
	unitprice decimal(10, 2),
	extendedamount decimal(10, 2)
);
insert into #temp
select
	productkey,
	unitprice,
	extendedamount
from [AdventureWorks2019].[dbo]
where 