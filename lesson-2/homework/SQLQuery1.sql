create table test_identity(
	id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO test_identity (name) VALUES 
('Alice'),
('Bob'),
('Charlie'),
('David'),
('Eve');

SELECT * FROM test_identity;

delete from test_identity where id>2;
SELECT * FROM test_identity;


Truncate table test_identity;
select * from  test_identity;

insert into test_identity (name) values ('MMM');

select * from  test_identity;

drop table test_identity;
select * from  test_identity;




create table data_types_demo(
	id int primary key;
	name varchar(50)
);
insert into datdata_types_demo (name) values
('olma'),
('nok'),
('apelsin');

select * from data_types_demo;
