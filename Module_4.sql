-- Module 4 examples

--create table
-- Drop the PETSALE table in case it exists
drop table PETSALE;
-- Create the PETSALE table 
create table PETSALE (
	ID INTEGER PRIMARY KEY NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	SALEPRICE DECIMAL(6,2),
	SALEDATE DATE
	);
-- Insert sample data into PETSALE table
insert into PETSALE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;

-- returns the sum of all the sales
select SUM(SALEPRICE) from PETSALE;
-- returns the same with named column
select SUM(SALEPRICE) AS SUM_OF_SALEPRICE from PETSALE;
-- returns the largest number
select MAX(QUANTITY) from PETSALE;
-- returns the average price 
select AVG(SALEPRICE) from PETSALE;
-- returns average of individual dog prices
select AVG( SALEPRICE / QUANTITY ) from PETSALE where ANIMAL = 'Dog';
-- returns rounded price 
select ROUND(SALEPRICE) from PETSALE;
--returns amount of letters in all animal names
select LENGTH(ANIMAL) from PETSALE;
--returns animal names in uppercase
select UCASE(ANIMAL) from PETSALE;
-- returns distinct animal names in uppercase
select DISTINCT(UCASE(ANIMAL)) from PETSALE;
-- return all items where when they are lowercased equal 'cat'
select * from PETSALE where LCASE(ANIMAL) = 'cat';
-- return day of the month where cats were purchased
select DAY(SALEDATE) from PETSALE where ANIMAL = 'Cat';
-- returns count of sales that occured in the 5th month/may
select COUNT(*) from PETSALE where MONTH(SALEDATE)='05';
-- returns a date 3 days from when the sale occured
select (SALEDATE + 3 DAYS) from PETSALE;
-- returns how many days have passed since sale happened
select (CURRENT DATE - SALEDATE) from PETSALE;