
--NEW---------------------------------

--ASSIGNMENT 1

Create Table tblEmployee
(
EmployeeID int primary key,
EmployeeName varchar(50) not null,
Role varchar(50) not null,
Hiredate date default getdate(),
EmailID varchar(50) not null unique,
location varchar(50),
Salary int check(salary>15),
DepartmentID int Foreign  key references tblDepartment(DepartmentID),
)

insert into tblEmployee values(2000,'Nishanth','DB','10/16/2023','nishanth@excelindia.com','Mysore',18000,10)
insert into tblEmployee values(2001,'Sagar','Software Engineer Trainee','10/28/2023','sagar@excelindia.com','Tumkur',30000,20)
insert into tblEmployee values(2002,'Mahesh','Back end','11/20/2023','mahesh@excelindia.com','Tipturu',18000,30)
insert into tblEmployee values(2003,'Pavithra','HR','10/08/2023','pavithra@excelindia.com','Bangalore',20000,40)
insert into tblEmployee values(2004,'Anjali','HR','10/08/2023','anjali@excelindia.com','Bangalore',20000,40)
insert into tblEmployee values(2005,'Prajwal','Front end','10/16/2023','prajwal@excelindia.com','Mysore',10000,60)
insert into tblEmployee values(2006,'Bhoomika','DB','10/08/2023','bhoomika@excelindia.com','Tumkur',45000,70)
insert into tblEmployee values(2007,'Pooja','Software Trainee','08/28/2016','pooja@excelindia.com','Hebbal',15000,80)
insert into tblEmployee values(2008,'Akash','PHP developer','04/23/2012','akash@excelindia.com','Kolar',90000,90)
insert into tblEmployee values(2009,'Mouna','Sales','03/15/2023','mouna@excelindia.com','Shimoga',15000,10)

Create Table tblDepartment
(
DepartmentID int PRIMARY KEY,
EmployeeName varchar(50),
Loction varchar(50)
)

insert into tblDepartment values(10,'DB','Mysore')
insert into tblDepartment values(20,'Software Engineer Trainee','Tumkur')
insert into tblDepartment values(30,'Back end','Tipturu')
insert into tblDepartment values(40,'HR','Bangalore')
insert into tblDepartment values(50,'HR','Bangalore')
insert into tblDepartment values(60,'Front end','Mysore')
insert into tblDepartment values(70,'DB','Tumkur')
insert into tblDepartment values(80,'Software trainee','Hebbal')
insert into tblDepartment values(90,'PHP developer','Kolar')
insert into tblDepartment values(10,'Sales','Shimoga')

--1.Insert 10 records into each table. 

--2.Display Table information. 
SELECT * FROM tblEmployee

--3. Display Employee’s name,  EmployeeId, departmentId  from tblEmployee 
SELECT EmployeeName, EmployeeID, DepartmentID FROM tblEmployee
 
--4. Display Employee’s name,  EmployeeId, departmentId  of department 20 and 40. 
 SELECT EmployeeName, EmployeeID, DepartmentID FROM tblEmployee
 WHERE DepartmentID IN (20,40)
 
--5.Display information about all ‘ Trainees Software Engineer’  having salary less than 20000. 
 SELECT * FROM tblEmployee 
 WHERE Role='Software Engineer Trainee' AND Salary < 20000

--6. Display information about all employees of department 30 having salary greater than 
--20000. 
 SELECT * FROM tblEmployee 
 WHERE DepartmentID= 30 AND Salary >10000

--7.Display list of employees who are not allocated with Department. 
 SELECT EmployeeName FROM tblEmployee 
 WHERE DepartmentID IS NULL 

--8.Display name and department of all ‘ Business Analysts’. 
 SELECT EmployeeName, DepartmentID  
 FROM tblEmployee E
 where Role= 'HR'

--9.Display name, Designation and salary of all the employees of department 30 who earn 
--more than 20000 and less than 40000. 
SELECT EmployeeName, Role, Salary FROM tblEmployee
WHERE DepartmentID=30 AND Salary>10000 and Salary<40000

--10.Display unique job of tblEmployee. 
SELECT DISTINCT Role, EmployeeName FROM tblEmployee 

--11.Display list of employees who earn more than 20000 every year of department 20 and 30. 
SELECT * FROM tblEmployee
WHERE (Salary*12)>20000 AND DepartmentID IN (20,30)

--12.  List Designation, department no and Joined date in the format of Day, Month, and Year of 
--department 20. 
SELECT Role, DepartmentId, Format(Hiredate ,'dd/mm/yyyy') from tblEmployee where DepartmentId = 20

--13.Display employees whose name starts with an vowel
SELECT EmployeeID, EmployeeName FROM tblEmployee
WHERE EmployeeName LIKE '[aeiou]%'

--14.Display employees whose name is less than 10 characters 
SELECT EmployeeID, EmployeeName FROM tblEmployee
WHERE LEN(EmployeeName)<6

--15.Display employees who have ‘N’ in their name 
 SELECT EmployeeID, EmployeeName FROM tblEmployee
 WHERE EmployeeName LIKE '%N%'

--16.Display the employees with more than three years of experience 
 SELECT EmployeeID, EmployeeName FROM tblEmployee
 WHERE DATEDIFF(YEAR,Hiredate,GETDATE())>3

--17.Display employees who joined on Monday 
SELECT * FROM tblEmployee 
WHERE DATENAME(DW,Hiredate)='Monday'

--18.Display employees who joined on 1st. 
SELECT * FROM tblEmployee
WHERE DATEPART(D,Hiredate)= 1

--19.Display all Employees joined in January 
SELECT * FROM tblEmployee
WHERE DATENAME(MONTH,Hiredate)='JANUARY'

--20.Display Employees with their Initials. 
SELECT CONCAT(EmployeeName,' ',Role) FROM tblEmployee

-------------------------------------------------------------------------------------------------------------
--ASSIGNMENT 2                                                                                               

--TABLE CREATION (CONSTRAINTS)

-------------------------------------------------------------------------------------------------------------
--ASSSIGNMENT 3
--RDBMS

Create TABLE tblEmployee3
(
EmployeeId int,
EmployeeName varchar(50),
Designation varchar(50),
JoinedDate Datetime,
EmailId varchar(50),
Salary money,
Location varchar(25),
DepartmentId int
)

INSERT INTO tblEmployee3 values
(1001,'Bhoomika R','Trainee Software engineer','10/16/2023','bhoomi@gmail.com','25000','mysore','1')
INSERT INTO tblEmployee3 values
(1002,'Pooja','HR','10/16/2023','pooja@gmail.com','50000','mysore','2')
INSERT INTO tblEmployee3 values
(1003,'Anjali','Trainee Software engineer','11/16/2023','anj@gmail.com','60000','mysore','1')
INSERT INTO tblEmployee3 values
(1004,'Pavithra','IT','10/16/2023','pavithra@gmail.com','25000','Noida','3')
INSERT INTO tblEmployee3 values
(1005,'Lavanya','Marketing','10/16/2019','lavanya@gmail.com','70000','banglore','4')
INSERT INTO tblEmployee3 values
(1006,'Mouna','IT','01/18/2023','mouna@gmail.com','80000','mysore','3')
INSERT INTO tblEmployee3 values
(1007,'Bhanu','Buisness Analyst','10/16/2023','bhanu@gmail.com','90000','noida','5')
INSERT INTO tblEmployee3 values
(1008,'Akash','HR','10/16/2023','akash@gmail.com','60000','banglore','2')
INSERT INTO tblEmployee3 values
(1009,'Vivek','Marketing','10/8/2023','Vivek@gmail.com','50000','mysore','4')
INSERT INTO tblEmployee3 values
(1010,'Nischay','IT','10/16/2023','Nischay@gmail.com','25000','banglore','3')

--1.Display all the employees data by sorting the date of joining in the ascending order and 
--then by name in descending order. 
SELECT * FROM tblEmployee3
ORDER BY EmployeeName DESC, JoinedDate ASC 

--2.Modify the column name EmployeeName to Employee_FirstName and also add another 
--column Employee_LastName  
exec sp_rename 'tblemployee3.employeename','emplyee_firstname','column'
alter table tblEmployee3
add employee_lastname varchar(50)

--3.Write a query to change the table name to Employees. 
EXEC sp_rename 'tblEmp3','tblEmployee3'

--4.Write a query to update the salary of those employees whose location is ‘Mysore’ to 35000. 
UPDATE tblEmployee3  
SET Salary= 35000
WHERE Location='mysore'

--5.Write a query to disassociate all trainees from their department  
update tblemployee
set designation=' '
where designation ='software engineer trainee'

--6.Write a query which adds another column ‘Bonus’ to the table Employees where the bonus 
--is equal to the salary multiplied by ten. Update the value only when the experience is two 
--years or above. 
alter table tblEmployee3 
add bonus money
update tblEmployee3 set bonus=salary*10 where datediff(yyyy,JoinedDate,getdate())>2;

--7.Display name and salary of top 5 salaried employees from Mysore and Hyderabad. 
SELECT  TOP 5 Salary, EmployeeName FROM tblEmployee3
WHERE Location IN ('mysore','hyderabad')
ORDER BY Salary

--8.Display name and salary of top 3 salaried employees(Include employees with tie) 
SELECT TOP 3 WITH TIES Salary, EmployeeName FROM tblEmployee3
ORDER BY Salary DESC

--9.Display top 1% salaried employees from Noida and Bangalore 
SELECT TOP 1 Salary, EmployeeName FROM tblEmployee3
WHERE Location IN ('Noida','Banglore')
ORDER BY Salary 

--10.Find average and total salary for each job. 
SELECT AVG(Salary) AS AvgSalary , SUM(Salary) AS TotalSalary, Designation
FROM tblEmployee3
GROUP BY Designation

--11.Find highest salary of all departments. 
SELECT MAX(Salary) MaxSalary, Designation FROM tblEmployee3
GROUP BY Designation

--12.Find minimum salary of all departments. 
SELECT MIN(Salary) MaxSalary, Designation FROM tblEmployee3
GROUP BY Designation

--13.Find difference in highest and lowest salary for all departments. 
SELECT (MAX(Salary)-MIN(Salary)) AS  FROM tblEmployee3
GROUP BY Designation

--14.Find average and total salary for trainees 
SELECT AVG(Salary) as AverageSalary, SUM(Salary) as TotalSalary from tblEmployeee 
where Designation='Trainee Software Engineer'
GROUP BY Designation

--15.  Count total different jobs held by dept no 30 
SELECT COUNT(Designation) from tblEmployee where DepartmentID=3

--16. Find highest and lowest salary for non-managerial job 
SELECT MAX(Salary), MIN(Salary) from tblEmployee 

--17.Count employees and  average annual salary of each department. 
SELECT COUNT(EmployeeId),AVG(Salary*12) from tblEmployeee 
GROUP BY DepartmentId 

--18.Display the number of employees sharing same joining date. 
SELECT COUNT(EmployeeId),JoinedDate
FROM tblEmployee
GROUP BY JoinedDate

select * from tblEmployeee

--20.Display total number of employees in each department with same salary 
SELECT Designation,Salary, Count(*) from tblEmployeee
group by Designation, Salary
having COUNT(*)>1

--21.Display the number of Employees above 35 years in each department 
SELECT Count(*) from tblEmployee where datediff(year,JoinedDate,GETDATE())>35

------------------------------------------------------------------------------------------------------------------------
--------------------------------------------ASSIGNMENT 4------------------------------------------------------
------------------------------------------TWO TABLE JOINS-----------------------------------------------------

create database Orders
USE Orders

CREATE TABLE tblSalesmen
(
snum INT primary key,
sname varchar(20),
city varchar(20), 
commission decimal(6,2)
)

select * from tblSalesmen
drop table tblSalesmen

CREATE TABLE tblCustomer
(
cnum int primary key,
cname varchar(20),
city varchar(20), 
rating int,
snum int references tblSalesmen(snum)
)
select * from tblSalesmen
SELECT * from tblCustomer
drop table tblCustomer

Create Table tblOrder
(
onum int primary key, 
amount decimal(7,2),
odate datetime,
cnum int FOREIGN KEY references tblCustomer(cnum),
snum int FOREIGN KEY references tblSalesmen(snum)
)

--1.Display the following information about each order. 
--a.Order No, Customer Name, Order Amount, Order Date 
SELECT onum,amount,odate,cname 
FROM tblOrder O JOIN tblCustomer C
ON O.cnum = C.cnum

--2.Display customers associated with each Salesman 
SELECT cname,sname 
FROM tblCustomer C right outer JOIN tblSalesmen S
ON C.snum=S.snum

--3.Display following information about each order: 
--a.OrderNo , Customer Name, Salesman Name, Order Amount, Order 
--Date 
SELECT onum,amount,odate,cname,sname
FROM tblOrder O 
JOIN tblCustomer C ON O.Cnum= C.cnum
JOIN tblSalesmen S ON C.snum= S.snum

--4.Display salesman with their order details in the decreasing order 
--value(Include salesman who has not captured any order) 
--a.Salesman name, Customer name,Ordervalue 
SELECT sname,onum,amount,odate
FROM tblOrder O
JOIN tblCustomer C ON O.cnum=C.cnum
RIGHT JOIN tblSalesmen S ON S.snum=O.snum
ORDER BY amount DESC

--5.Display customers with their orders in the ascending order of date(Include 
--customers who hasn’t booked any order) 
--a.Customer Name, Order Value Order date 
Select cname,amount,odate
FROM tblCustomer C JOIN tblOrder O
ON C.cnum=O.cnum
ORDER BY odate

--6.List the number of customers handled by each salesman.(Sales man 
--name, Number of Customers handled) 
SELECT sname, COUNT(cname) as 'No of Customer'
FROM tblSalesmen S LEFT JOIN tblCustomer C 
ON S.snum=C.snum
GROUP BY sname

--7.List the customers(Name of the customer) who have placed more than 
--one order 
SELECT cname, COUNT(onum) 
FROM tblCustomer C LEFT JOIN tblOrder O
ON C.cnum=O.cnum
GROUP BY cname
HAVING COUNT(onum)>1

--8.Display sum of orders from each city from each customer and salesman 
SELECT c.city, count(onum) as , sum(amount)
from tblOrders O INNER JOIN tblCustomer C on o.cnum=c.cnum
group by c.city

-------------------------------------------------------------------------------------------------------------------------

---------------------------------------ASSIGNMENT 5----------------------------------------------------------------

-------------------------------------THREE TABLE JOINS-----------------------------------------------------------------

----------------------------------------A)HealthCare------------------------------------------------------------------------

create TABLE patient
(
	pid VARCHAR(20) PRIMARY KEY,
	pname VARCHAR(20),
	city VARCHAR(20)
)

create table doctor
(
	did VARCHAR(20) primary key,
	dname VARCHAR(20),
	dept VARCHAR(20),
	salary Money
)

create table consultation
(
	cid int primary key,
	pid VARCHAR(20) foreign key references patient(pid),
	did VARCHAR(20) foreign key references doctor(did),
	fee money
)

--Please provide solutions to the problem statements given below based on the scenario 
--and details provided on the previous page. 

--Requirement 1 : 
--Identify the consultation details of patients with the letter ‘e’ anywhere in their name, who 
--have consulted a cardiologist. Write a SQL query to display doctor’s name and patient’s 
--name for the identified consultation details. 

select * from doctor
select * from patient
select * from consultation

SELECT d.dname,p.pname
FROM patient p join consultation c on p.pid=c.pid
join doctor d on c.did=d.did
WHERE p.pname LIKE '%e%' AND d.dept='Cardiology'

--Requirement 2 : 
--Identify the doctors who have provided consultation to patients from the cities ‘Boston’ 
--and ‘Chicago’. Write a SQL query to display department and number of patients as 
--PATIENTS who consulted the identified doctor(s). 

select * from doctor
select * from patient
select * from consultation

SELECT d.dept,count(p.pid) as[no.of patients],d.dname
FROM patient p join consultation c on p.pid=c.pid
join doctor d on c.did=d.did
WHERE p.city in ('Boston','Chicago')
group by d.dept,d.dname

--Requirement 3 : 
--Identify the cardiologist(s) who have provided consultation to more than one patient. 
--Write a SQL query to display doctor’s id and doctor’s name for the identified 
--cardiologists. 

select * from doctor
select * from patient
select * from consultation

SELECT d.dname,d.did, count(d.dname) as [no.of patients]
FROM doctor d JOIN consultation c ON d.did=c.did
WHERE d.dept='Cardiology'
GROUP BY d.did,d.dname
HAVING count(d.dname)>1

--Requirement 4 : 
--Write a SQL query to combine the results of the following two reports into a single report. 
--The query result should NOT contain duplicate records. 
--Report 1 – Display doctor’s id of all cardiologists who have been consulted by 
--patients. 
--Report 2 – Display doctor’s id of all doctors whose total consultation fee charged 
--in the portal is more than INR 800. 

select * from doctor
select * from patient
select * from consultation

SELECT DISTINCT c.did,d.dname
FROM doctor d INNER JOIN consultation c ON d.did=c.did
WHERE d.dept='Cardiology' 

UNION

SELECT c.did,d.dname
FROM doctor d JOIN consultation c ON d.did=c.did
GROUP BY c.did,d.dname
HAVING  sum(c.fee)>800

--Requirement 5 : 
--Write a SQL query to combine the results of the following two reports into a single report. 
--The query result should NOT contain duplicate records. 
--Report 1 – Display patient’s id belonging to ‘New York’ city who have consulted 
--with the doctor(s) through the portal. 
--Report 2 – Display patient’s id who have consulted with doctors other than 
--cardiologists and have paid a total consultation fee less than INR 1000. 

select * from doctor
--select * from patient
select * from consultation

select DISTINCT p.pid
from patient p inner join consultation c ON p.pid=c.pid
WHERE p.city='New York'

union

SELECT  c.pid
FROM doctor d inner join consultation c ON d.did=c.did
WHERE d.dept!='Cardiology'
group by c.pid
having sum(c.fee)<1000

-----------------------------------------------------------------------------------------------------------------

---------------------------------------------JOINS---------------------------------------------------------------

------------------------------------------B) TOY SHOP-------------------------------------------------------------

CREATE DATABASE ToyShop
USE ToyShop;

Create Table Customer
(
	Custid  int primary key,
	Custname VARCHAR(20),
	Custype char(1)
)

CREATE TABLE Category
( 
	Cid Char(4) PRIMARY KEY,
	Cname VARCHAR(10)
)

CREATE TABLE Toys
(
	Toyid CHAR(5),
	Toyname VARCHAR(15) UNIQUE NOT NULL,
	Cid char(4) FOREIGN KEY REFERENCES Category(Cid) not null
)

SELECT * FROM tblCustomers
SELECT * FROM tblToys
SELECT * FROM tblCategory
SELECT * FROM tblTransaction

	 
--1.Display CustName and total transaction cost as TotalPurchase for those customers 
--whose total transaction cost is greater than 1000. 

SELECT CustName,sum(TxnCost) AS_TOTAL_PURCHASE
FROM tblCustomers JOIN tblTransaction
ON tblTransaction.Custid=tblCustomers.Custid
GROUP BY CustName
HAVING sum(TxnCost)>1000

--2.List all the toyid, total quantity purchased as 'total quantity' irrespective of the 
--customer. Toys that have not been sold should also appear in the result with total units as 
--0 
SELECT tblToys.ToyID,COUNT(Quantity) AS_TOTAL_QNTY
FROM tblToys LEFT JOIN tblTransaction
ON tblToys.Toyid=tblToys.Toyid
GROUP BY tblToys.Toyid

--3.The CEO of Toys corner wants to know which toy has the highest total Quantity sold. 
--Display CName, ToyName, total Quantity sold of this toy. 

SELECT Category.Cid,tblToys.ToyName,count(Quantity)
from tblToys join tblTransaction
on tblToys.Toyid=tblTransaction.Toyid
join Category on Category.Cid=tblToys.Toyid

-----------------------------------------------------------------------------------------------------------------

---------------------------------------------ASSIGNMENT 6-------------------------------------------------------

----------------------------------------Joins,SubQueries-BANKING-----------------------------------------------

CREATE TABLE tblTransactionType
(TransType int primary key,
TransName varchar(50))

create table tblAccountType
(AccType int primary key,
AccountName varchar(30))

create table tblCustomerDetails
(AccNo int primary key,
CustName varchar(50),
Address varchar(50),
AccType int Foreign key references tblAccountType(AccType))

CREATE TABLE tblAccountTransaction
(Tid int primary key,
AccNo int Foreign key references tblCustomerDetails(AccNo),
Amount money,
DateOfTrans datetime,
TransType int foreign key references tblTransactionType(TransType))

select * from tblTransactionType
select * from tblAccountType
select * from tblCustomerDetails
select * from tblAccountTransaction

--1.List the Customer with transaction details who has done third lowest transaction 
select CustomerName, MIN(amount) from tblCustomer C inner join tblAccountTransaction 
on T.AccNO=C.AccNo
where Amount in (Select TOP 3 Amount FROM tblTransactions Order by Amount)

SELECT Top 1 C.CustName,T.Amount
FROM tblCustomerDetails C
INNER JOIN tblAccountTransaction T
ON T.AccNo = C.AccNo
WHERE T.Amount NOT IN (SELECT TOP 2 T.Amount
FROM tblAccountTransaction
ORDER BY T.Amount DESC)
ORDER BY T.Amount DESC;

--2.List the customers who has done more transactions than average number of transaction  
SELECT AccountTransaction.AccNo,COUNT(AccountTransaction.AccNo)
FROM AccountTransaction
GROUP BY AccountTransaction.AccNo
HAVING COUNT(AccountTransaction.AccNo) > (SELECT AVG(accountTransaction)
FROM (SELECT COUNT(AccountTransaction.Tid)
FROM AccountTransaction
GROUP BY AccountTransaction.AccNo) AS TransactionCount)

--3.List the total transactions under each account type. 
SELECT AccNo,COUNT(T.Tid) AS NoOfTransactions
FROM tblAccountTransaction T
GROUP BY T.AccNo;

--4.List the total amount of transaction under each account type 
select C.AccType, sum(T.Amount) as 'total amount'
from tblAccountTransaction T inner join tblCustomerDetails C
ON T.AccNo=C.AccNo
RIGHT OUTER JOIN tblAccountType A
ON A.AccType=C.AccType
GROUP BY C.AccType

SELECT AccountTransaction.AccNo,SUM(AccountTransaction.Amount) AS NUM_OF_TRANS
FROM AccountTransaction
GROUP BY AccountTransaction.AccNo;

--5.List the total tranctions along with the total amount on a Sunday. 
SELECT count(Tid) as 'TotalTransactions',sum(Amount) as 'total amount'
from tblAccountTransaction
where datename(weekday,DateOfTrans)='Sunday'

SELECT Tid,COUNT(Tid),SUM(AccountTransaction.Amount) AS NUM_OF_TRANS
FROM AccountTransaction
WHERE DATENAME(DW,DateOfTrans) = 'sunday'
GROUP BY Tid;

--6.List the name, address, account type and total deposit from each customer account. 
select C.CustName ,C.Address, A.AccType, A.AccountName, Sum(T.Amount) as 'TotalDeposit'
from tblCustomerDetails C inner join tblAccountType A
ON A.AccType = C.AccType
INNER JOIN tblAccountTransaction T
on T.AccNo=C.AccNo
group by C.CustName,C.Address,A.AccType, A.AccountName

SELECT C.CustName,C.address,A.AccountName,SUM(T.Amount) AS total_deposit
FROM tblCustomerDetails C
INNER JOIN tblAccountType A
ON A.AccType = C.AccType
INNER JOIN tblAccountTransaction T
ON T.AccNo = C.AccNo
GROUP BY C.CustName,C.address,A.AccountName;

--7.List the total amount of transactions of Mysore customers. 

SELECT SUM(T.Amount) AS 'Total Amount'
FROM tblAccountTransaction T
INNER JOIN tblCustomerDetails C
ON C.AccNo = T.AccNo
WHERE C.address = '123 Main St'

--8.List the name,account type and the number of transactions performed by each customer. 

SELECT C.CustName,A.AccType,A.AccountName, COUNT(T.Tid) AS NoOfTransaction
FROM tblCustomerDetails C
left outer JOIN tblAccountTransaction T
ON C.AccNo = T.AccNo
inner JOIN tblAccountType A
ON C.AccType = A.AccType
GROUP BY C.CustName,A.AccType,A.AccountName
order by AccType 

SELECT C.CustName,A.AccType,A.AccountName, COUNT(T.TransType) AS NoOfTransaction
FROM tblCustomerDetails C
INNER JOIN tblAccountTransaction T
ON C.AccNo = T.AccNo
INNER JOIN tblAccountType A
ON C.AccType = A.AccType
GROUP BY C.CustName,A.AccType,A.AccountName
order by AccType 

select * from tblTransactionType
select * from tblAccountType
select * from tblCustomerDetails
select * from tblAccountTransaction

--9.List the amount of transaction from each Location. 

SELECT C.address,sum(T.Amount) 
FROM tblAccountTransaction T
INNER JOIN tblCustomerDetails C 
ON C.AccNo = T.AccNo
GROUP BY C.address; 

SELECT CustomerDetails.address,COUNT(AccountTransaction.Tid)
FROM AccountTransaction
INNER JOIN CustomerDetails
ON CustomerDetails.AccNo = AccountTransaction.AccNo
GROUP BY CustomerDetails.address;

--10.Find out the number of customers  Under Each Account Type 

select * from tblAccountType
select * from tblCustomerDetails

SELECT A.AccountName,COUNT(A.AccType) AS Number_Of_Customer
FROM tblAccountType A
GROUP BY A.AccountName;

--correct outpt
select A.AccType, A.AccountName, count(CustName) as 'NoOfCustomer'
from tblAccountType A inner join tblCustomerDetails C
ON A.Acctype=C.AccType
group by A.AccType, A.AccountName

select * from tblAccountType
select * from tblCustomerDetails

------------------------------------------------------------------------------------------------------------------------

----------------------------------------------ASSIGNMENT 7-----------------------------------------------------------

--------------------------------------------SUBQUERIES-SALES--------------------------------------------------------
create database SALES

CREATE TABLE tblSalesman
(
Sid int primary key,
Sname varchar(25),
Location varchar(25)
)

CREATE TABLE tblProduct
(
Prodid int primary key,
Pdesc varchar(20),
Price money,
Category varchar(20),
Discount int
)

CREATE TABLE tblSale
(
Saleid int PRIMARY KEY,
Sid int foreign key references tblSalesman(Sid),
Sldate DATE,
Amount money
)

CREATE TABLE tblSaleDetail
(
Saleid int foreign key references tblSale(Saleid), 
Prodid int foreign key references tblProduct(Prodid),
Quantity int
)

select * from tblProduct
select * from tblSale
select * from tblSaleDetail
select * from tblSalesman

drop table tblSaleDetail

--1.Display the sale id and date for most recent sale. 
Select Saleid, Sldate from tblSale
where Sldate=(select max(Sldate) from tblSale)

--2.Display the names of salesmen who have made at least 2 sales. 
SELECT SName
from tblSalesman
where SId IN 
(Select SId from tblSale
group by Sid 
having COUNT(*) >= 2);

--3.Display the product id and description of those products which are sold in 
--minimum total quantity. 

select * from tblProduct
select * from tblSaleDetail
select * from tblSale
select * from tblSalesman

SELECT ProdId,Pdesc from tblProduct where ProdId in 
(SELECT TOP 1 WITH TIES ProdId from tblSaleDetail 
GROUP BY ProdId
ORDER BY SUM(Quantity)
);

--4.Display SId, SName and Location of those salesmen who have total sales 
--amount greater than average sales amount of all the sales made. Amount can 
--be calculated from Price and Discount of Product and Quantity sold. 

UPDATE
	tblSale
SET
	Amount=[Amt]	
FROM
	(SELECT SUM((P.Price-P.Discount)*S.Quantity) as [Amt], S.Saleid
		FROM
		tblProduct P INNER JOIN tblSaleDetail S ON P.Prodid=S.Prodid
		GROUP BY [Saleid]) as [IT]
		WHERE [IT].[Saleid]=[tblSale].[Saleid];

SELECT M.Sid, M.Sname, M.Location from tblSalesman M inner join tblSale S
ON S.Sid=M.Sid
GROUP BY  M.Sid, M.Sname, M.Location
HAVING SUM(AMOUNT) > (SELECT AVG(AMOUNT) FROM tblSale)

--5.Display the product id, category, description and price for those products whose 
--price is maximum in each category. 
 
SELECT P1.Prodid, P1.Category, P1.Pdesc, P1.Price
FROM tblProduct P1
WHERE P1.Price = 
(SELECT MAX(P2.Price)
FROM tblProduct P2
WHERE P2.Category = P1.Category);  

SELECT Category, Max(Price) from tblProduct
GROUP BY Category

select * from tblProduct
select * from tblSaleDetail
select * from tblSale
select * from tblSalesman

--6.Display the names of salesmen who have not made any sales. 
Select SName from tblSalesman
where SId NOT IN (Select distinct SId from tblSale);

--7.Display the names of salesmen who have made at least 1 sale in the month of 
--Jun 2015. 
SELECT DISTINCT Sname
FROM tblSalesman M
JOIN tblSale S ON M.Sid = S.Sid
WHERE S.Sldate >= '2015-06-01' AND S.Sldate <= '2015-06-30';

------------------------------------------------------------------------------------------------------------------

---------------------------------------------T-SQL-------------------------------------------------------------

--EXCEPTION HANDLING IN T-SQL

--50K ERROR MSG ARE IN SQL SERVER

-- 3 TYPES OF EXCEPTION
---SYNTAX , SEMANTIC ARE LOGICAL ERROR
-- RUN TIME ERROR CAN BE SOLVED BY EXCEPTION HANDLING
-- SQL IS INTERPRETED

--TRY AND CATCH BLOCK
--EVERY TRY SHOULD HAVE A CATCH BLOCK

--BEGIN TRY
	
--DECLARE @Dividor INT = 100, @Dividend INT = 5 ,@Quotient INT 
--SET @Quotient=@Dividor/@Dividend

--END TRY

--BEGIN CATCH

--print 'error occured'

--END CATCH

--PRINT 'AFTER CATCH'
--ASSIGNMENT 8

DECLARE @COUNT INT
SET @COUNT =1
WHILE @COUNT<20
BEGIN 
	PRINT 'ACQUIRE SKILLS'
	SET @COUNT=@COUNT+1
	IF @COUNT>10
		break
	ELSE
	 CONTINUE
END

--TO CHECK NO IS GIVEN EVEN OR ODD

DECLARE @NUM INT = 2
BEGIN
	IF(@NUM%2=0)
		PRINT 'The Given Number Is Even'
	ELSE
		PRINT 'The Given Number Is ODD'
END 

--FIBONACCI SERIES

DECLARE @NUM1 BIGINT=0, @NUM2 BIGINT =1--@COUNT INT =1 
DECLARE @COUNTER INT =1
PRINT @NUM1
PRINT @NUM2
BEGIN
WHILE (@COUNTER<=48)
	BEGIN
	
		DECLARE @NUM3 BIGINT = @NUM1 + @NUM2
		PRINT @NUM3
	
		SET @NUM1 = @NUM2
		SET @NUM2 = @NUM3
		SET @COUNTER +=1
		--SET @COUNTER = @COUNTER +1
	END

END

DECLARE @NUMBER INT =1
SELECT @NUMBER

--GENERATE FIRST 100 EVEN NUMBERS

DECLARE @NUM INT 

--display emp with their locations as tier - 1 or tier - 2 with their cities

DECLARE @MARKS INT =10
SELECT @MARKS,
CASE 
	WHEN @MARKS BETWEEN 90 AND 100 THEN '9'
	WHEN @MARKS BETWEEN 80 AND 89 THEN '8'
	WHEN @MARKS BETWEEN 70 AND 79 THEN '7'
	WHEN @MARKS BETWEEN 60 AND 69 THEN '6'
	WHEN @MARKS BETWEEN 50 AND 59 THEN '5'
   
    ELSE 'FAIL'
END

DECLARE @TMonth varchar(25)
select @TMonth=DATENAME(MONTH,GETDATE())
IF @TMonth='NOVEMBER'
	SELECT EMPLOYEE_FirstName,Salary,Salary+10000 as SalaryWithBonus
	FROM Employees
ELSE
	PRINT 'NO bonus in this month'
	PRINT @TMonth

DECLARE @Month varchar(25)
set @Month=DATENAME(MONTH,GETDATE())
select @Month

-----------------------------------------------------------------------------------------------------------

---------------------------------T-SQL ASSIGNMENT-8---------------------------------------------------------

--1.Write T-SQL block to generate Fibonacci series 

DECLARE @NUM1 BIGINT=0, @NUM2 BIGINT =1--@COUNT INT =1 
DECLARE @COUNTER INT =1
PRINT @NUM1
PRINT @NUM2
BEGIN
WHILE (@COUNTER<=48)
	BEGIN
	
		DECLARE @NUM3 BIGINT = @NUM1 + @NUM2
		PRINT @NUM3
	
		SET @NUM1 = @NUM2
		SET @NUM2 = @NUM3
		SET @COUNTER +=1
		--SET @COUNTER = @COUNTER +1
	END

END

--2.Create student and result table and perform the following: 
USE payroll
select * from tblStudentDtl 
select * from tblStudentSubMarks
select * from tblSubjectDtl

--3.Write query to find the grade of a student, if he scores above 90 its 'A’, 
--above 80 'B', above 70 ‘C’, above 60 ‘D’, above 50 ‘F’ or else print 
--failed.(Hint: Use Case ) 

select s.StudentName,s.StudentID,g.marks,
case
When marks >=90 then 'A'
when marks>=80 then 'B'
when marks>=70 then 'c'
when marks >=60 then 'D'
when marks >=50 then 'f'
else 'failed'
end as Grade
from tblStudentSubMarks G,tblStudentDtl S

--4.Display month on which the employee is born. Use case statement. 
USE payroll;
SELECT * FROM Employees;
 select Employee_FirstName, JoiningDate,
 case
 when DatePart(Month,JoiningDate)=1 then 'january'
 when DatePart(Month,JoiningDate)=2 then 'february'
 when DatePart(Month,JoiningDate)=3 then 'march'
 when DatePart(Month,JoiningDate)=4 then 'april'
 when DatePart(Month,JoiningDate)=5 then 'may'
 when DatePart(Month,JoiningDate)=6 then 'june'
 when DatePart(Month,JoiningDate)=7 then 'july'
 when DatePart(Month,JoiningDate)=8 then 'august'
 when DatePart(Month,JoiningDate)=9 then 'september'
 when DatePart(Month,JoiningDate)=10 then 'october'
 when DatePart(Month,JoiningDate)=11 then 'november'
 when DatePart(Month,JoiningDate)=12 then 'december'
END AS joindate
from Employees

--5.Write T-SQL statements to generate 10 prime numbers greater than 1000. 
  DECLARE @i INT = 1
    DECLARE @j INT = 2
    DECLARE @COUNT1 INT
    BEGIN
    WHILE @j <= 10
        BEGIN
            SET @COUNT1 = 0
            WHILE @i <= @j
                BEGIN
                    BEGIN
                        IF((@j % @i) = 0)
                            SET @COUNT1 += 1
                    END
                    SET @i += 1
                END
            BEGIN
                IF (@COUNT1 = 2)
                    PRINT @j
            END
            SET @j += 1
        END
    END
    ;

--6.Consider HR Database and generate bonus to employees as below: 
--A)one month salary  if Experience>10 years  
--B)50% of salary  if experience between 5 and 10 years  
--C)Rs. 5000  if Eexperience less than 5 years 
 
 Update Employees	
SET Bonus =
CASE
WHEN DATEDIFF(YY,GETDATE(),JoiningDate)>10 then salary
WHEN DATEDIFF(YY,GETDATE(),JoiningDate) BETWEEN 5 AND 10 THEN 0.5*SALARY
ELSE 5000
END

--7.Consider Banking database and Create a procedure to list the customers 
--with more than the specified minimum balance as on the given date. 

--8.Based on balance categorize the customers as below: 
--a.if the balance is greater than minimum balance declare them as 
--‘Premium Customer' 
--b.if the balance is less than 0, 'Overdue Customer' 
--c.Else 'NON Premium Customer' 

------------------------------------------------------------------------------------------------------------

--Stored Procedures Examples

--Variables
--1. Simple declaration and assign an initial value to the Variable
DECLARE @Variable1 AS VARCHAR(100) = 'Mysore Palace'
PRINT @Variable1

----------------------------------------------------------------------------------------------------------
--2. Variable declaration and assign an initial value to the Variable using SET option
DECLARE @Variable2 AS VARCHAR(100)
SET @Variable2 = 'Mysore Palace'
PRINT @Variable2

----------------------------------------------------------------------------------------------------------
--3. Variable declaration and assign an initial value to the Variable using SELECT option
DECLARE @Variable3 AS VARCHAR(100)
SELECT @Variable3 = 'Mysore Palace'
PRINT @Variable3

----------------------------------------------------------------------------------------------------------
--4. Variable declaration and assign an initial value to the Variable using SELECT option of a specific table
DECLARE @EmployeeName AS VARCHAR(50)
SELECT @EmployeeName = [Name]
FROM [dbo].[Emp]
WHERE ID = 4
PRINT @EmployeeName

----------------------------------------------------------------------------------------------------------
--5. Declaring and assiging Multiple variables
DECLARE @MultipleVariable1 AS VARCHAR(50)
DECLARE @MultipleVariable2 AS INT
SET @MultipleVariable1 = 'Save Water'
SET @MultipleVariable2= 1234
PRINT @MultipleVariable1
PRINT @MultipleVariable2

----------------------------------------------------------------------------------------------------------
--6. assiging Multiple variables with table data
DECLARE @EmployeeName AS VARCHAR(50), @Gender AS VARCHAR(50)
SELECT @EmployeeName = Name, @Gender = Gender
FROM [dbo].[Emp]
PRINT @EmployeeName
PRINT @Gender

----------------------------------------------------------------------------------------------------------
--7. Declaring and assigining different Datatypes of data
DECLARE @FloatVar AS FLOAT = 12312.1232
DECLARE @IntVar AS INT
SET @IntVar=@FloatVar
PRINT @IntVar
--===============================================================================================================

--Temp tables
CREATE TABLE #person (
    person_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL
);

--===============================================================================================================

--IDENTITY
CREATE TABLE #person (
    person_id INT IDENTITY(1,1) PRIMARY KEY,	--Given seed value=1, Increment value=1
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL
);

INSERT INTO #person(first_name, last_name, gender)
OUTPUT inserted.person_id
VALUES('John','Doe', 'M');

INSERT INTO #person(first_name, last_name, gender)
OUTPUT inserted.person_id
VALUES('Jane','Doe','F');

SELECT * FROM #person

DROP TABLE #person

--===============================================================================================================

--SCOPE_IDENTITY()
INSERT INTO #person(first_name, last_name, gender)
VALUES('Jac','Do','M');

SELECT SCOPE_IDENTITY() AS LastInsertedIdentityValue

--===============================================================================================================

--Ex1: Creating a simple stored procedure

ALTER PROCEDURE uspEx1
AS
BEGIN

	SELECT * FROM Emp WHERE ID = 4
	SELECT * FROM Dept
END

uspEx1
EXECUTE uspEx1
EXEC uspEx1

-------------------------------------------ASSIGNMENT 9-----------------------------------------------------

-----------------------------------------Stored Procedure---------------------------------------------------

--1. What are types of Variables and mention the difference between them
LOCAL VARIABLES AND GLOBAL VARIABLES
LV are declared and used within the scope of a specific script or stored procedure
GV are used to store data that can be accessed across different SQL statements within a session

--2. Declare a variable with name [SQLData] which can store a string datatype 
--and assign a value to using SELECT option and specify an alias name for the same
DECLARE @SQLData VARCHAR(20)
SELECT @SQLData='Mysore' as 'SQLData'

--3. What is used to define a SQL variable to put a value in a variable?
--	a. SET @id = 6;
--	b. SET id = 6;
--	c. Id = 6;
--	d. SET #id = 6;

--Select the correct option
a. SET @id = 6;

--4. Compare Local and Global Temporary tables with an Example
CRAETE TABLE #LocalTempTable

--5. Create a table with an IDENTITY column whose Seed value is 2 and Increment value of 100
CREATE TABLE tblStudents 
( 
StudID INT IDENTITY(2,100),
StudName varchar(20),
)

select * from tblStudents

--6. What is the difference between SCOPE_IDENTITY() and @@IDENTITY. Explain with an Example.
SCOPE_IDENTITY() is a function that returns the last identity value generated within the session
is a system variable that returns the last identity value genrated for any table in the current session, irrespective of the scope or table where the insert operation occured.
INSERT INTO tblStudent VALUES ('12','BHOOMIKA');
SCOPE_IDENTITY() AS 'LastIdentity';


CREATE TABLE tblProject
(
   ProjectId BIGINT PRIMARY KEY,
   ProjectName VARCHAR(100) NOT NULL,
   ProjectCode NVARCHAR(50) NOT NULL,
   ExamYear SMALLINT NOT NULL
);


CREATE TABLE tblExamCentre 
(
  ExamCentreId BIGINT PRIMARY KEY,
  ExamCode VARCHAR(100) NULL,
  ExamName VARCHAR(100) NULL
);

CREATE TABLE tblPECentre
(
   ProjectExamCentreId BIGINT PRIMARY KEY,
   ExamCentreId BIGINT NOT NULL FOREIGN KEY REFERENCES tblExamCentre(ExamCentreId),
   ProjectId BIGINT FOREIGN KEY REFERENCES tblProject(ProjectId)
);

INSERT INTO tblProject(ProjectId,ProjectName,ProjectCode,ExamYear) VALUES
(1,	'8808-01-CW-YE-GCEA-2022',	'PJ0001',	2022),
(2,	'6128-02-CW-YE-GCENT-2022',	'PJ0002',	2022),
(3, '7055-02-CW-YE-GCENA-2022','PJ0003',	2022),
(4,	'8882-01-CW-YE-GCEA-2022','	PJ0004',	2022),
(5,'7062-02-CW-YE-GCENT-2022',	'PJ0005',	2022),
(8,	'6128-02-CW-YE-GCENT-1000',	'PJ0008',	1000),
(9,	'7062-02-CW-YE-GCENT-5000',	'PJ0009',	5000),
(10,'8808-01-CW-YE-GCEA-2023',	'PJ0010',	2023),
(11,'8808-01-CW-YE-GCEA-2196',	'PJ0011',	2196),
(15,'6073-02-CW-YE-GCENA-2022',	'PJ0015',	2022),
(16,'8808-01-CW-YE-GCE0-2022',	'PJ0016',	2022);

INSERT INTO tblExamCentre(ExamCentreId,ExamName,ExamCode) VALUES
(112,'VICTORIA SCHOOL-GCENA-S','2711'),
(185,'NORTHBROOKS SECONDARY SCHOOL-GCENA-S','2746'),
(227,'YIO CHU KANG SECONDARY SCHOOL-GCENA-S','2721'),
(302,'CATHOLIC JUNIOR COLLEGE','9066'),
(303,'ANGLO-CHINESE JUNIOR COLLEGE','9067'),
(304,'ST. ANDREW''S JUNIOR COLLEGE','9068'),
(305,'NANYANG JUNIOR COLLEGE','9069'),
(306,'HWA CHONG INSTITUTION','9070'),
(1,NULL,'2011'),
(2,'NORTHBROOKS SECONDARY SCHOOL-GCENA-S',NULL);

INSERT INTO tblPECentre(ProjectExamCentreId,ProjectId,ExamCentreId) VALUES
(44,1,112),
(45,1,227),
(46,1,185),
(47,2,112),
(48,2,227),
(49,2,185),
(50,3,112),
(51,3,227),
(52,3,185),
(69,4,112);

drop table tblProject;
drop table tblExamCentre;
drop table tblPECentre;
--1.Write a procedure to fetch the ProjectId, ProjectName, ProjectCode, ExamCentreName and ExamCentreCode from 
--the tables tblProject and tblExamCentre based on the ProjectId and ExamCentreId passed as input parameters.

CREATE PROCEDURE uspToGetDetails
(@ProjectID BIGINT, @ExamCentreId BIGINT)
AS
BEGIN
	SELECT P.ProjectId, P.ProjectCode, E.ExamName, E.ExamCode 
	FROM tblProject P INNER JOIN tblPECentre C
	ON P.ProjectId=C.ProjectId
	INNER JOIN tblExamCentre E
	ON E.ExamCentreId= C.ExamCentreId
	WHERE C.ProjectId=@ProjectId and C.ExamCentreId=@ExamCentreId
END

uspToGetDetails @ProjectId=2, @ExamCentreId=112

--2.Write a procedure to insert values into the table tblProject when the data for the ProjectId 
--which is being inserted does not exist in the table.
CREATE PROCEDURE uspInsertValues
(@ProjectId INT,
 @ProjectName VARCHAR(100),
 @ProjectCode NVARCHAR(50), 
 @ExamYear SMALLINT)
 AS
 BEGIN
	IF(@ProjectId NOT IN
		(SELECT ProjectId from tblProject))
	INSERT INTO tblProject(ProjectId,ProjectName,ProjectCode,ExamYear) VALUES 
	(@ProjectId, @ProjectName, @ProjectCode, @ExamYear)
	ELSE
		Print 'ProjectId already exists'
END

uspInsertValues '20','SARAS','PJ0002','2023'

--3.Write a procedure to update the columns-Code and Name in tblExamCentre when either of the Code 
--or the Name column is NULL and also delete the records from the table tblProjectExamCentre when ProjectId is 4.
CREATE PROCEDURE upsUpdateColumn
AS
BEGIN
UPDATE tblExamCentre SET ExamCode=2134,ExamName='SJCE'
WHERE ExamCode IS NULL OR ExamName IS NULL;
DELETE from tblPECentre where ProjectId=4;
END

upsUpdateColumn

--4.Write a procedure to fetch the total count of records present in the table tblProject based on the ProjectId
--AS OUTPUT parameter and also sort the records in ascending order based on the ProjectName.
CREATE or ALTER PROCEDURE uspToFetchTotalCount
(@ProjectId BIGINT,@TotalRows INT OUTPUT)
AS
BEGIN
	SELECT @TotalRows=COUNT(1)
	FROM tblProject WHERE ProjectId=@ProjectId;

	end

ALTER PROCEDURE uspToFetchTotalCount
(@TotalRows INT OUTPUT)
AS
BEGIN
	SELECT @TotalRows =(SELECT Count(ProjectId) FROM tblProject)
	
	end

DECLARE @TotalRows INT
EXEC uspToFetchTotalCount @TotalRows OUTPUT
SELECT @TotalRows

--5.Write a procedure to create a Temp table named Students with columns- StudentId,StudentName and Marks where the 
--column StudentId is generated automatically and insert data into the table and also retrieve the data.

ALTER PROCEDURE uspTempTable
AS
BEGIN

	CREATE TABLE #tblStudent
	(
	StudentId INT IDENTITY(1,1),
	StudentName VARCHAR(20),
	Marks INT
	)

		INSERT INTO #tblStudent( StudentName, Marks) VALUES
		('Bhoomika',90),
		('Pooja',95),
		('Anjali',93),
		('Lavanya',85),
		('Monisha',84)

			SELECT * FROM #tblStudent
	END

	SELECT * FROM tblProject;
	SELECT * FROM tblExamCentre;
	SELECT * FROM tblPECentre;

--6.Write a procedure to perform the following DML operations on the column-ProjectName in tblProject table by 
--using a varibale. Declare a local variable and initialize it to value 0, 
--1. When the value of the variable is equal to 2, then insert another record into the table tblProject.
--2. When the value of the variable is equal to 10, then change the ProjectName to 'Project_New' for input @ProjectId
 
 CREATE PROCEDURE uspDMLop
 (@ProjectId BIGINT, @Count INT)
 AS
 BEGIN
--DECLARE @COUNT INT	
--SET @COUNT=0
	WHILE @Count<=10
	BEGIN
		IF @Count=2
		INSERT INTO tblProject(ProjectId,ProjectName,ProjectCode,ExamYear) VALUES
		(20,'Project_20','PJ0020','2011');

		IF (@Count=2)
		UPDATE tblProject
		SET ProjectName='Project_New'
		WHERE ProjectId=@ProjectId;

		SET @Count=@Count +1 ;
		if @Count>10
		BREAK
	END

	SELECT 
	CASE WHEN ExamYear>=2022 then 'NEW'
		WHEN ExamYear<=2022 then 'OLD'
	END AS Type
	FROM tblProject
	WHERE ProjectId=@ProjectId
END

uspDMLop @ProjectId=2, @Count=5

------------------------------------------------------------------------------------------------------------

------------------------------------------ASSIGNMENT 10-----------------------------------------------------

-----------------------------------------STORED PROCEDURE---------------------------------------------------

USE DATABASE SALES

--1.Consider table tblEmployeeDtls and write a stored procedure to generate 
--bonus to employees for the given date  as below: 
--A)One month salary  if Experience>10 years  
--B)50% of salary  if experience between 5 and 10 years  
--C)Rs. 5000  if experience is less than 5 years 
--Also, return the total bonus dispatched for the year as output parameter. 

USE DATABASE EMPLOYEE

SELECT * FROM tblEmployee

select * from Employees
select * from tblDepartment

CREATE PROCEDURE usp_Bonus
@TotalBonus INT OUTPUT
AS
	BEGIN

		UPDATE tblEmployee SET Bonus=Salary		
		WHERE DATEDIFF(YYYY,JoiningDate,GETDATE())>10

		UPDATE tblEmployee SET Bonus=0.5*Salary
		WHERE DATEDIFF(YYYY,JoiningDate,GETDATE()) BETWEEN 5 AND 10 

		UPDATE tblEmployee SET Bonus=5000		
		WHERE DATEDIFF(YYYY,JoiningDate,GETDATE())<5

		SELECT @TotalBonus= SUM(Bonus)FROM Employees

	END 

DECLARE @TotalBonus INT 
EXEC usp_Bonus @TotalBonus OUTPUT
SELECT @TotalBonus AS [Total Bonus]

--CREATE PROCEDURE uspEmployeeBonus
--(@Bonus, @DateDiff
--AS 
--BEGIN
--	IF(@DateDiff IN (SELECT JoinedDate from tblEmployee where JoinedDate= DATEDIFF(Year,JoinedDate,GETDATE())>10)
--	BEGIN 
--	UPDATE tblEmployee SET 

CREATE PROCEDURE uspEmployeeBonus
(@TotalBonus MONEY OUTPUT)
AS 
BEGIN
	UPDATE tblEmployee SET Bonus=Salary
		WHERE DATEDIFF(Year,JoinedDate,GETDATE())>10

	UPDATE tblEmployee SET Bonus=(0.5 * Salary)
		WHERE DATEDIFF(Year,JoinedDate,GetDate()) BETWEEN 5 AND 10

	UPDATE tblEmployee SET Bonus= 5000
		WHERE DATEDIFF(Year,JoinedDate,GETDATE())<5

	SET @TotalBonus=(SELECT SUM(Bonus) as 'TotalBonus' FROM tblEmployee)
END

DECLARE @TotalBonus MONEY  
EXEC uspEmployeeBonus @TotalBonus OUTPUT
SELECT @TotalBonus AS 'TotalBonus'


--2.Create a stored procedure that returns a sales report for a given time period for a given Sales Person.
--Write commands to invoke the procedure
--Also generate the month and maximum ordervalue booked by the given salesman(use output parameter) Tables
--SALESMAN -SalesmanNo, Customerno, Orderno
--Customers -CustomerNo,CustomerName, SalesmanNo, OrderNo
--Orders -Orderno, ProductNo, Qty, CustomerNo, OrderDate
--Products -ProdctNo, ProductName, UnitPrice,Discount

CREATE PROCEDURE uspSalesReport
(@SNUM INT, @StartDate DATE, @EndDate DATE)
AS
BEGIN
	IF(@SNUM IN (SELECT sid FROM tblSale))
		BEGIN 
			SELECT * FROM tblSale
			WHERE sldate BETWEEN @StartDate AND @EndDate AND sid = @SNUM 
		END
	ELSE
	PRINT 'Salesman does not exists'
END

EXEC uspSalesReport 202,'2022-03-10','2023-12-10'

--CREATE PROCEDURE uspSalesReport
--(@Snum INT,@StartDate DATETIME, @EndDate DATETIME)
--AS
--BEGIN
--SELECT S.Snum, FROM tblSalesman S INNER JOIN tblSale T ON S.Sid=T.Sid
--WHERE 

SELECT * FROM tblSale
SELECT * FROM tblSaleDetail
SELECT * FROM tblSalesman
SELECT * FROM tblProduct 

--3.Also generate the month and maximum ordervalue booked by the given salesman(use output parameter)
CREATE PROCEDURE uspMaxOrderValue
(@SID INT, @StartDate DATE, @EndDate DATE, @Month varchar(10) OUTPUT, @MaxOrder INT OUTPUT)
AS 
BEGIN
	IF(@SID IN(SELECT Sid FROM tblSalesman))
		BEGIN
		SELECT TOP 1 @MONTH= DATENAME(MONTH,Sldate) , @MaxOrder =Amount FROM tblSale
		WHERE Sldate BETWEEN @StartDate AND @EndDate AND Sid= @SID
		ORDER BY Amount DESC
		END
	ELSE
	PRINT 'Salesman does not exists'
END
		
DECLARE @Month VARCHAR(10),@MaxOrder INT
EXECUTE uspMaxOrderValue 203, '2014/05/12','2016/08/12', @Month OUTPUT, @MaxOrder OUTPUT

SELECT @Month AS 'Month', @MaxOrder AS 'MaxOrder'

--4.Consider Toy Centre database 
--Procedure Name : usp_UpdatePrice 
--Description: This procedure is used to update the price of a given product. 
--Input Parameters: ProductId Price 
--Output Parameter: UpdatedPrice 
--Functionality: 
--Check if the product id is valid, i.e., it exists in the Products table 
--If all the validations are successful, update the price in the table Products appropriately 
--Set the output parameter to the updated price 
--If the update is not successful or in case of exception, undo the entire operation and set the 
--output parameter to 0 
--Return Values: 
--1 in case of successful update 
--1 in case of any errors or exception 

CREATE OR ALTER PROCEDURE usp_UpdatePrice
(@ProductId VARCHAR(5) , @Price MONEY, @UpdatedPrice MONEY OUTPUT)
AS
BEGIN
	IF(@ProductId NOT IN (SELECT ToyId from tbltoys))
	BEGIN
		PRINT 'The Product does not exists'
		RETURN -1
	END
	BEGIN TRY
		BEGIN TRAN
			UPDATE tbltoys SET Price=@Price WHERE ToyID=@ProductId
			SELECT @UpdatedPrice=Price FROM tbltoys WHERE ToyId = @ProductId
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
		PRINT 'UPDATE NOT DONE'
		RETURN -1
	END CATCH

	RETURN 1
END

select * from tbltoys

--@STATUS is used to see the return values for example in this program RETURN 1 AND RETURN -1.

DECLARE @op MONEY, @STATUS INT;
EXEC @STATUS = usp_UpdatePrice 'T1091', 500, @op OUTPUT;
PRINT @Op
PRINT @STATUS

select * from tbltoys

DBCC USEROPTIONS

--5.Procedure Name : usp_InsertPurchaseDetails 
--Description: 
--This procedure is used to insert the purchase details into the table PurchaseDetails and 
--update the available quantity of the product in the table Products by performing the 
--necessary validations based on the business requirements. 
--Input Parameters: 
--∙EmailId 
--∙ProductId 
--∙QuantityPurchased 
--Output Parameter: 
--    PurchaseId 
--Functionality: 
--∙Check if all the input parameters are not null 
--∙Check if the Email is valid, i.e., it exists in the Users table 
--∙Check if the product Id is valid, i.e., it exists in the Products table 
--∙Check if the purchased quantity is greater than 0 
--∙If all the validations are successful, insert the purchase details into the table 
--PurchaseDetails 
--∙Update the available quantity in the table Products appropriately 
--∙Set the output parameter to the newly generated PurchaseId.If the insert or update 
--is not successful, undo the entire operation and set the output parameter to 0 
--Return Values : 
--∙1 in case of successful insertion and update 
--∙-1 if EmailId is null 
--∙-2 if EmailId is not valid 
--∙-3 if ProductId is null 
--∙-4 if ProductId is not valid 
--∙-5 if the QuantityPurchased is not valid or QuantityPurchased is null 
--∙-99 if there is any exception 
SELECT * FROM tblUser
SELECT * FROM tblProducts
SELECT * FROM tblPurchaseDetails

 CREATE PROCEDURE uspToyUpdate
 @CustId INT ,@ToyID VARCHAR(10), @Quantity INT ,@TxnId INT OUTPUT

 AS
		BEGIN
			 IF @CustId IS NULL 
				BEGIN
					PRINT 'Customer ID Cannot be NULL'
					RETURN -1
				END 
			 IF @ToyID IS NULL 
				BEGIN
					PRINT 'Toy ID Cannot be NULL'
					RETURN -3
				END 
			 IF @Quantity IS NULL 
				BEGIN
					PRINT 'Quantity Cannot be NULL'
					RETURN -5
				END 
			 IF (@CustId EXISTS (SELECT CustID FROM tblCustomers))
				BEGIN
					
				END

	    	END    -------------------PENDING

--------------------------------------------------------------------------------------------------------------

--FUNCTIONS

--User defined functions :

--> block of code or statement 
--> reuse
--> reduce the repeating of code.

--types of fuctions :

--1.scaler functions
--2.Table valued fucntions ---
--a.inline TVF 
--b. Multi TVF

--1. Scaler functions:

--syntax : 

CREATE FUNCTION function_name (parameter)
RETURNS data_type  AS
BEGIN
    SQL statements
    RETURN value
END;

Ex:

CREATE OR ALTER FUNCTION Add_values (@addno int)
RETURNS varchar(50) AS
BEGIN
 
   RETURN @addno+10

END;  

select dbo.Add_values(20) as Addno


alter FUNCTION col_per(@col_name int,@percentage int)
RETURNS Int AS
BEGIN
 
 return @col_name+(@col_name*@percentage)/100

END;

Select *, from employee

create table employee
(
  id int,
  name varchar(50),
  age int,
  income decimal(10,5)
)

select *,dbo.col_per(income,20) as hike_value from employee


--2.Table valued functions :


CREATE FUNCTION Fn_name (
	@Parameter
)
RETURNS TABLE AS
RETURN
	statement

SELECT * FROM tblEmployee

CREATE OR ALTER FUNCTION max_salary 
(@Salary Int)

RETURNS TABLE AS
RETURN
	SELECT *
	FROM tblEmployee E
	WHERE E.Salary > @Salary;

SELECT * FROM max_salary(60000);


--Multi-statement table-valued function returns a table as output and this output table structure can be defined 
--by the user. MSTVFs can contain only one statement or more than one statement. 

CREATE FUNCTION MultiStatement_TableValued_Function_Name
(
        @param1 DataType,
        @param2 DataType,
        @paramN DataType 
)
RETURNS 
@OutputTable TABLE
(
        @Column1 DataTypeForColumn1 ,
        @Column2 DataTypeForColumn2
)
AS
BEGIN
  --FunctionBody
RETURN
END

CREATE OR Alter FUNCTION fn_getmoviedate(@genre varchar(50))
RETURNS 
@Movietab TABLE
(
        moviename varchar(50) ,
        releasedate datetime,
		genre varchar(50)
)
AS
BEGIN
 insert into @Movietab
    select moviename,releasedate,genre
	from movie
	where genre=@genre
RETURN
END
============================================================================================================

CREATE OR ALTER FUNCTION  UDF_GetAvgDesSal
(@d1 VARCHAR(100),@d2 VARCHAR(100))
RETURNS @res TABLE ([Designation Name] VARCHAR(50), [Average Salary] MONEY)
AS
BEGIN
	INSERT INTO @res
		SELECT Designation, MIN(sALARY)
		FROM tblEmployee
		WHERE Designation IN (@d1,@d2) 
		GROUP BY Designation;

	RETURN;
END

SELECT * FROM UDF_GetAvgDesSal('IT','HR')


CREATE OR ALTER FUNCTION  UDF_GetDesMaxSalHolder(@d1 VARCHAR(100),@d2 VARCHAR(100))
RETURNS @res TABLE (
	[Designation Name] VARCHAR(100),
	[Highest Salary Holder] VARCHAR(100))
AS
BEGIN
	DECLARE @MAX_SAL MONEY, @MAX_SAL2 MONEY;

	SELECT  @MAX_SAL=MAX(Salary)
	FROM tblEmployee
	WHERE Designation IN (@d1);

	SELECT @MAX_SAL2=MAX(Salary)
	FROM tblEmployee
	WHERE Designation IN (@d2);

	INSERT INTO @res
		SELECT Designation, EmpName
		FROM tblEmployee
		WHERE 
			(Designation = @d1 AND Salary=@MAX_SAL)
			OR
			(Designation = @d2 AND Salary=@MAX_SAL2);

	RETURN;
END

SELECT * FROM UDF_GetDesMaxSalHolder('Trainee Software engineer','IT')

SELECT * FROM tblEmployee

--select * from movie
select * from fn_getmoviedate('comedy')

SELECT * FROM [dbo].[tblBookingDetails]
SELECT * FROM [dbo].[tblShowDetails]
SELECT * FROM [dbo].[tblTheatreDetails]
SELECT * FROM [dbo].[tblUserDetail]

--Stored procedures can modify database objects, and need not return results.
--Functions can only have input parameters, whereas procedures can have either input or output parameters.
--Functions can be called from procedures, but procedures cannot be called from functions. 
--Exceptions can be handled in try-catch blocks within procedures, but try-catch blocks cannot be used within functions

--WRITE A FUNCTION TO DISPLAY ALL EMPLOYEE WHO HAVE MORE THAN 10 YEARS OF EXPERIENCE IN
--FOLLOWING FORMAT:
--EmpId,EmpName,JoinedDate,Experience,DepartmentName,Location,Salary

USE DATABASE EMPLOYEE

CREATE FUNCTION fnEmp()
RETURNS TABLE 
AS
	RETURN 
	SELECT EmployeeId,EmpName,JoinedDate,DATEDIFF(YYYY,JoinedDate,GETDATE()) AS 'EXPERIENCE',DepartmentName,Location,Salary 
	FROM tblEmployee E INNER JOIN tbldept D
	ON E.DepartmentId=D.DepartmentId
	WHERE DATEDIFF(YYYY,JoinedDate,GETDATE())>2

ALTER FUNCTION fnEmp(@LOCATION VARCHAR(20))
RETURNS TABLE 
AS
	RETURN 
	SELECT EmployeeId,EmpName,JoinedDate,DATEDIFF(YYYY,JoinedDate,GETDATE()) AS 'EXPERIENCE',DepartmentName,Location,Salary 
	FROM tblEmployee E INNER JOIN tbldept D
	ON E.DepartmentId=D.DepartmentId
	WHERE DATEDIFF(YYYY,JoinedDate,GETDATE())>2 AND Location=@LOCATION
	

SELECT * FROM dbo.fnEmp('mysore')

---------------------------------------ASSIGNMENT 11---------------------------------------------------------

--Capstone – MovieGo 
--Problem Statement 
--MovieGo is a ticket booking application to book movie tickets. The application allows 
--registered users to login and view the shows available based on the choice of location. User 
--can then choose a show and book tickets based on the availability of seats in a theatre. To 
--persist the data related to registered users, theaters available, shows currently running and 
--the booking details. The application has to store the data in a relational database. The 
--application has the following features to be implemented. 
--Users must register and then login to access the application 
--The registered users can book movie tickets in theaters of their choice based on the 
--location 
--The ticket shows the show timings, seat number and theatre address 
--The users must be able to view their previous bookings in the application 

--Stored Procedure: usp_BookTheTicket 
--Create a stored procedure named usp_BookTheTicket to insert values into the 
--BookingDetails table. Implement appropriate exception handling. 
--Input Parameters: 
--UserId 
--ShowId 
--NoOfTickets 
--Functionality: 
--Check if UserId is present in Users table 
--Check if ShowId is present in ShowDetails table 
--Check if NoOfTickets is a positive value and is less than or equal to TicketsAvailable 
--value for the particular ShowId 
--If all the validations are successful, insert the data by generating the BookingId and 
--calculate the total amount based on the TicketCost 
--Return Values: 
--1, in case of successful insertion 
---1,if UserId is invalid 
---2,if ShowId is invalid 
---3,if NoOfTickets is less than zero 
---4,if NoOfTickets is greater than TicketsAvailable 
---99,in case of any exception 

CREATE TABLE tblUserDetail
(
UserId VARCHAR(50) PRIMARY KEY,
UserName VARCHAR(50),
Password VARCHAR(50),
Age INT,
Gender CHAR(1),
EmailId VARCHAR(50),
PhoneNumber NUMERIC(10)
)

CREATE TABLE tblTheatreDetails
(
TheatreId INT Primary Key, 
TheatreName	VARCHAR(50),
Location VARCHAR(50)	
)

CREATE TABLE tblShowDetails
(
ShowId INT Primary Key, 
TheatreId INT Foreign Key REFERENCES tblTheatreDetails(TheatreId),
ShowDate DATE,	
ShowTime TIME,
MovieName VARCHAR(50),
TicketCost DECIMAL(6,2),	
TicketsAvailable INT
)

CREATE TABLE tblBookingDetails
(
BookingId VARCHAR(5) Primary Key, 
UserId VARCHAR(50) Foreign Key REFERENCES tblUserDetail(UserId),
ShowId INT Foreign Key REFERENCES tblShowDetails(ShowId),
NoOfTickets	INT,
TotalAmt DECIMAL(6,2)	
)

SELECT * FROM tblUserDetail
SELECT * FROM tblTheatreDetails
SELECT * FROM tblShowDetails
SELECT * FROM tblBookingDetails

CREATE PROCEDURE uspBookTicket
(@UserId VARCHAR(30), @ShowId INT, @NoOfTickets INT)
AS
BEGIN
	IF(@UserId NOT IN (SELECT UserId FROM tblUserDetail)
	BEGIN
		PRINT 'UserId is Invalid'
		RETURN -1
	END

	IF(@ShowId NOT IN (SELECT ShowId FROM tblShowDetails)
	BEGIN
		PRINT 'ShowId is Invalid'
		RETURN -2
	END

	IF @NoOfTickets<=0
	BEGIN
		PRINT 'INVALID NUMBER OF TICKETS'
		RETURN -3
	END

	IF @NoOfTickets>(SELECT TicketsAvailable from tblShowDetails WHERE ShowId=@ShowId)
	BEGIN
		PRINT 'TICKETS UNAVAILABLE'
		RETURN -4
	END

	BEGIN TRY                                                                               --SELECT RIGHT(MAX([BookingId],4)+1)
	                                                                                	      --SELECt 'B'+100	                                                                                    --SELECT 'B'+CAST(1002 AS VARCHAR)
		BEGIN TRANSACTION

		--INSERT
			DECLARE @MaxId VARCHAR(5), @Price MONEY;
		
			SELECT 
				@MaxId= 'B'+CAST(RIGHT(MAX(BookingId),4)+1 AS VARCHAR) 
			FROM tblBookingDetails

			SELECT @price=TicketCost
			FROM tblShowDetails
			WHERE ShowId = @ShowId

			INSERT INTO tblBookingDetails(BookingId, UserId, ShowId, NoOfTickets, TotalAmt)
			VALUES
			(@MaxId, @USERID, @SHOWID, @NOOFTICKET, @Price*@NOOFTICKET);

			--UPDATE AVAILABLE TICKETS
			UPDATE tblShowDetails
			SET TicketsAvailable -= @NOOFTICKET
			WHERE ShowId = @ShowId;

		COMMIT
		RETURN 1
	END TRY

	BEGIN CATCH
		ROLLBACK
		PRINT 'OTHER EXCEPTION'
		RETURN -99
	END CATCH
END

--Function: ufn_GetMovieShowtimes 
--Create a function ufn_GetMovieShowtimes to get the show details based on the MovieName 
--and Location 
--Input Parameter: 
--MovieName 
--Location 
--Functionality: 
--Fetch the details of the shows available for a given MovieName in a location 
SELECT * FROM BookingDetails
SELECT * FROM ShowDetails
SELECT * FROM TheatreDetails
SELECT * FROM Users

CREATE FUNCTION ufn_GetMovieShowtimes(
@MovieName VARCHAR (20),
@Location VARCHAR(20))
RETURNS @MOVIETABLE TABLE 

(MovieName VARCHAR(20),
ShowDate DATE,
ShowTime TIME,
TheatreName VARCHAR(20),
TicketCost DECIMAL)
AS
BEGIN
INSERT INTO @MOVIETABLE
SELECT MovieName,ShowDate ,ShowTime,TheatreName ,TicketCost 
FROM TheatreDetails JOIN ShowDetails
ON TheatreDetails.THEATREID=ShowDetails.THEATREID
WHERE MOVIENAME=@MOVIENAME OR LOCATION=@LOCATION
RETURN
END

select * from dbo.ufn_GetMovieShowtimes( 'hit man','bengaluru')

------------------------------------------------------------------------------------------------------------

--------------------------------------------ASSIGNMENT 12---------------------------------------------------
----------------------------------------------FUNCTIONS-----------------------------------------------------

--1. Create a function to List the details as shown below for the students of a given department and 
--given pass marks 

CREATE TABLE tblDepartment
(DId INT PRIMARY KEY,
DName VARCHAR(30)
);

INSERT INTO tblDepartment VALUES(1,'CS'),(2,'IS'),(3,'MECH');
SELECT * FROM tblDepartment;

CREATE TABLE tblSubject(SId INT PRIMARY KEY,
SubName VARCHAR(30) NOT NULL
);

INSERT INTO tblSubject VALUES(101,'C PROGRAMMING'),
(102,'PYTHON'),
(103,'H T M L'),
(104,'WEB DESIGN'),
(105,'SQL'),
(106,'DATA ANALYTICS'),
(107,'BIG DATA'),
(108,'.NET'),
(109,'THERMODYNAMICS'),
(110,'FLUID MECHINARY'),
(111,'MECHANICS OF MATERIALS'),
(112,'KINEMATICS');

SELECT * FROM tblSubject;

CREATE TABLE tblDeptSub( DId INT FOREIGN KEY REFERENCES tbldepartment(Did),
                        SId int FOREIGN KEY REFERENCES tblsubject(sid)
)

INSERT INTO tblDeptSub VALUES(1,101),(1,102),(1,103),(1,104),(1,105),
(2,106),(2,107),(2,105),(2,104),(2,108),
(3,109),(3,110),(3,111),(3,112),(3,101);

CREATE TABLE tblStudent(StudentId INT PRIMARY KEY,
StudentName VARCHAR(30),
DepartmentId INT FOREIGN KEY REFERENCES tbldepartment(Did)
);

INSERT INTO tblStudent VALUES(201,'anjali',1),(202,'pooja',2),(203,'bhoomika',3);

SELECT * FROM tblStudent;

CREATE TABLE tblMarks(StudentId INT FOREIGN KEY REFERENCES tblSTUDENT(StudentId),
SubjectId INT  FOREIGN KEY REFERENCES tblsubject(sid),
ExamDate DATE,
SCore INT
);

INSERT INTO tblMarks VALUES(201,101,'10-01-2023',80),
(201,102,'10-02-2023',67),
(201,103,'10-3-2023',87),-----passsing 47 above
(201,104,'10-4-2023',91),
(201,105,'10-5-2023',90),

(202,106,'10-6-2023',76),
(202,107,'10-7-2023',82),
(202,105,'10-8-2023',86),
(202,104,'10-9-2023',99),
(202,108,'10-10-2023',34),

(203,109,'10-11-2023',96),
(203,110,'10-12-2023',82),
(203,111,'10-13-2023',86),
(203,112,'10-14-2023',99),
(203,101,'10-15-2023',94);

SELECT * FROM tblMarks

CREATE OR ALTER FUNCTION ufn_getStudentResults(@Dept INT ,@Marks INT)
RETURNS @reports table
(
Id INT,
Name varchar(50),
TotalMarks INT,
Percentage INT,
NoOfSubjectsAttended INT,
NoOfPassed INT,
Result varchar(50),
Grade Varchar(50))
AS
BEGIN

	INSERT INTO @reports(Id,Name,TotalMarks,Percentage,NoOfSubjectsAttended,NoOfPassed,Result,Grade)
 
		SELECT SM.id,SM.name,SUM(SM.marks),SUM(SM.MARKS)*100/(COUNT(SM.MARKS)*100) AS PERCENTAGE,COUNT(SM.MARKS) AS ATTEMPTED,
		COUNT(SM.RESULT) AS PASSED,
			CASE WHEN COUNT(SM.MARKS)=COUNT(SM.RESULT) THEN 'Pass'
				ELSE 'Fail'
			END AS RESULTS,
			CASE
				WHEN (SUM(SM.MARKS)*100/(COUNT(SM.MARKS)*100)) >80 AND COUNT(SM.MARKS)=COUNT(SM.RESULT) THEN 'Distinction'
				WHEN (SUM(SM.MARKS)*100/(COUNT(SM.MARKS)*100)) BETWEEN 70 AND 80 AND COUNT(SM.MARKS)=COUNT(SM.RESULT)THEN 'First Class'
				WHEN (SUM(SM.MARKS)*100/(COUNT(SM.MARKS)*100)) BETWEEN 50 AND 70 AND COUNT(SM.MARKS)=COUNT(SM.RESULT) THEN 'Second Class'
				else '---'
			END AS GRADE

		FROM

		(SELECT M.StudentId AS ID ,S.StudentName AS NAME ,M.subjectid AS SubId,S.DepartmentId as Dept,M.SCore as marks,CASE
			WHEN
			m.SCORE>67 THEN 1
			ELSE NULL
			END as RESULT
			FROM tblStudent S
			INNER JOIN tblMarks M
			ON S.StudentId=M.StudentId) SM
			WHERE SM.Dept=@Dept
			GROUP BY SM.id,SM.Name
		RETURN
	END

SELECT * FROM ufn_getStudentResults(2,20)

------------------------------------------------------------------------------------------------------------

--TRIGGERS

--In general, a trigger is a special kind of stored procedure that automatically executes 
--when an event occurs in the database server. 
 
--3 Types of Events 
 
--1.DML Triggers 
--2.DDL Triggers 
--3.Logon triggers 
 
--1.DML Triggers -- INSERT,UPDATE,DELETE 
 
--DML stands for Data Manipulation Language. INSERT, UPDATE, and DELETE 
--statements are DML statements.  
--DML triggers are fired, when ever data is modified using INSERT, UPDATE, and 
--DELETE events. 
 
--DML triggers can be again classified into 2 types.​
--1. After triggers (Sometimes called as FOR triggers)​
--2. Instead of triggers 

--After triggers, as the name says, fires after the triggering action. The INSERT, 
--UPDATE, and DELETE statements, causes an after trigger to fire after the respective 
--statements complete execution.​

--On other hand, as the name says, INSTEAD of triggers, fires instead of the triggering 
--action. The INSERT, UPDATE, and DELETE statements, can cause an INSTEAD OF 
--trigger to fire INSTEAD OF the respective statement execution. 


CREATE TRIGGER trDemoInsertTrigger
ON tblEmployee
FOR INSERT
AS
BEGIN
	PRINT 'Record Inserted'
END

USE EMPLOYEE
SELECT * from tblEmployee
    
INSERT INTO tblEmployee values(1011,'Monisha','Trainee Software Engineer','12/10/2023','monisha@gmail.com',30000,2)

--in Trigger table
--print some operation happened 
--insert into audittablemployee
--select i.employeeid, d.salary, i.salary, getdate()  from
--inserted i full outer join deleted d
--n i.employeeid=d.employeeid
--end

DROP TABLE tblEmp

CREATE TABLE tblEmp
(EmpId int,
EmpName varchar(20),
Salary MONEY,
Gender varchar(20),
DepartmentId int
)

SELECT * FROM tblEmp

CREATE TRIGGER trEmpInsert
ON tblEmp
FOR INSERT
AS
BEGIN
	DECLARE @ID INT
	SELECT @ID=EmpId from inserted	

INSERT into tblEmployeeAudit ​
values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + 
cast(Getdate() as nvarchar(20)))​
END 

CREATE TABLE tblEmployeeAudit​
(​
 Id int identity(1,1) primary key,​
 AuditData nvarchar(1000)​
) 

select * from tblEmployeeAudit

INSERT INTO tblEmp VALUES (7,'Prajwal',30000,'Male',2)

alter TRIGGER trEmpDelete
ON tblEmp
FOR DELETE
AS
BEGIN
	DECLARE @GENDER varchar(20)
	SELECT @GENDER=Gender FROM DELETED
INSERT INTO tblEmployeeAudit
VALUES ('New Employee with Gender =' + cast(@GENDER as Varchar(20))+ 'is removed at' + cast(GETDATE() as varchar(20)))
END

DELETE FROM tblEmp WHERE GENDER ='Female'

CREATE TRIGGER trUpdate
on tblEmp
FOR UPDATE
AS
BEGIN
	SELECT * FROM DELETED
	SELECT * FROM INSERTED
END

UPDATE tblEmp SET Salary=100000 WHERE Salary=21000

--------------------------------------------------------------------
CREATE Trigger tr_Update
ON tblEmp
for Update
AS 
BEGIN
	Declare @EmpId int
	Declare @OldEmpName varchar(20), @NewEmpName varchar(20)
	Declare @OldSalary INT, @NewSalary INT
	Declare @OldGender varchar(20), @NewGender varchar(20)
	Declare @OldDeptId INT, @NewDeptId INT

	Declare @AuditString varchar(1000)

	Select * into #TempTable from inserted

	WHILE (EXISTS(SELECT EmpId from #TempTable))
	BEGIN
		SET @AuditString=''

			SELECT TOP 1 @EmpId= EmpId, @NewEmpName = EmpName, ​
            @NewGender = Gender, @NewSalary = Salary,​
            @NewDeptId = DepartmentId​
            from #TempTable
           ​
            -- Select the corresponding row from deleted table​
            Select @OldEmpName = EmpName, @OldGender = Gender, ​
            @OldSalary = Salary, @OldDeptId = DepartmentId​
            from deleted where EmpId = @EmpId​
​          ​
            Set @AuditString = 'Employee with Id = ' + Cast(@EmpId as nvarchar(4)) + ' changed'​
            if(@OldEmpName <> @NewEmpName)​
                  Set @AuditString = @AuditString + ' NAME from ' + @OldEmpName + ' to ' + @NewEmpName​
                 ​
            if(@OldGender <> @NewGender)​
                  Set @AuditString = @AuditString + ' GENDER from ' + @OldGender + ' to ' + @NewGender​
                 ​
            if(@OldSalary <> @NewSalary)​
                  Set @AuditString = @AuditString + ' SALARY from ' + Cast(@OldSalary as nvarchar(10))+ ' to ' + Cast(@NewSalary as nvarchar(10))​
                  ​
			if(@OldDeptId <> @NewDeptId)​
                  Set @AuditString = @AuditString + ' DepartmentId from ' + Cast(@OldDeptId as nvarchar(10))+ ' to ' + Cast(@NewDeptId as nvarchar(10))​
           ​
            insert into tblEmployeeAudit values(@AuditString)​
            ​
            Delete from #TempTable where EmpId = @EmpId​
      End​
End 

Update tblEmp set EmpName = 'Vivek', Salary = 19000,  
Gender = 'Male' where EmpId = 1 

SELECT * from tblEmp
SELECT * FROM tblEmployeeAudit
-----------------------------------------------------------------------------------------------------
drop table tblEmployee
CREATE TABLE tblEmployee
(
 EmpId int Primary Key,
 EmpName nvarchar(30),
 Gender nvarchar(10),
 DeptId int
)

CREATE TABLE tblDepartment
(
DeptId int Primary Key,
DeptName nvarchar(20)
)

SELECT * FROM tblEmployee
SELECT * FROM tblDepartment

Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')

Insert into tblEmployee values (1,'Vivek', 'Male', 3)
Insert into tblEmployee values (2,'Akash', 'Male', 2)
Insert into tblEmployee values (3,'Anjali', 'Female', 1)
Insert into tblEmployee values (4,'Sagar', 'Male', 4)
Insert into tblEmployee values (5,'Pooja', 'Female', 1)
Insert into tblEmployee values (6,'Nishanth', 'Male', 3)

CREATE VIEW vwEmployeeDetails
AS
SELECT EmpId,EmpName,Gender,DeptName FROM tblEmployee E
INNER JOIN tblDepartment D
ON E.DeptId=D.DeptId

DROP VIEW vwEmployeeDetails
SELECT * FROM vwEmployeeDetails

--Insert into vWEmployeeDetails values(7, 'Valarie', 'Female', 'IT')

alter TRIGGER trEmpInsteadOfInsert
ON vwEmployeeDetails
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @DeptId INT
		SELECT @DeptId=DeptId FROM tblDepartment D INNER JOIN INSERTED E
		ON D.DeptName=E.DeptName
	IF(@DeptId IS NULL)
		BEGIN
		RAISERROR('Invalid DepartmentName.Statement Terminated',16,1)
		RETURN
		END
		INSERT INTO tblEmployee(EmpId,EmpName,Gender,DeptId)
		SELECT EmpId,EmpName,Gender,@DeptId
		FROM INSERTED
		END

Insert into vWEmployeeDetails values(8, 'Valarie', 'Female', 'IT')
select * from trEmpInsteadOfInsert
DROP TRIGGER trEmpInsteadOfTrigger

--INSERT OF DELETE------------------------------------------------------------------------------------

CREATE TRIGGER trEmpInsteadOfDelete
ON vwEmployeeDetails
INSTEAD OF DELETE
AS
BEGIN
	DELETE tblEmployee FROM tblEmployee E
	INNER JOIN DELETED D ON E.EmpId=D.EmpId
END
	
DELETE FROM vwEmployeeDetails WHERE EmpId=7

--INSTEAD OF UPDATE--------------------------------------------------------------------------
CREATE TRIGGER trEmpInsteadOfUpdate
ON vwEmployeeDetails
INSTEAD OF UPDATE
AS BEGIN 
IF(UPDATE(EmpName))
	UPDATE tblEmployee SET EmpName =INSERTED.EmpName 
	FROM INSERTED 
	JOIN tblEmployee 
	ON tblEmployee.EmpID=INSERTED.EmpID
END
DROP TRIGGER trEmpInsteadOfUpdate
SELECT * FROM tblEmployee

ALTER TRIGGER trEmpInsteadOfUpdateTrigger
ON vwEmployeeDetails
INSTEAD OF UPDATE
AS
BEGIN

	IF(Update(EmpId))
	BEGIN
	RAISERROR('Id cannot be changed', 16, 1)
	RETURN
END

	IF(Update(DeptName)) 
	BEGIN
	DECLARE @DeptId INT

	SELECT @DeptId = DeptId
	FROM tblDepartment D INNER JOIN INSERTED I ON I.DeptName = D.DeptName

	IF(@DeptId is NULL )
	BEGIN
		RAISERROR('Invalid Department Name', 16, 1)
		RETURN
	END

	UPDATE tblEmployee SET DeptId = @DeptId
	FROM INSERTED I
	INNER JOIN tblEmployee E
	ON E.EmpId = I.EmpId
	END

	IF(Update(Gender))
	BEGIN
		UPDATE tblEmployee SET Gender = I.Gender
		FROM INSERTED I
		INNER JOIN tblEmployee E
		ON E.EmpId = I.EmpId
	END

	IF(Update(EmpName))
	BEGIN
		UPDATE tblEmployee SET EmpName = I.EmpName
		from INSERTED I
		INNER JOIN tblEmployee E
		ON E.EmpId = I.EmpId
	END
END

	SELECT * FROM vwEmployeeDetails
	UPDATE vwEmployeeDetails SET EmpName='Prajwal' WHERE EmpId=1

DROP TABLE tblCustomers

----------------------------------------------------------------------------------------------------------------------------------------

--ASSESSMENT----------------------------------------------------------------------

--Stored Procedure: usp_BookTheTicket 
--Create a stored procedure named usp_BookTheTicket to insert values into the 
--tblBookingDetails. Implement appropriate exception handling. 
--Input Parameters: 
--(CustId, FlightId, NoOfTickets)

--Functionality: 
--Check if CustId is present in tblCustomer 
--Check if FlightId is present in tblFlight 
--Check if NoOfTickets is a positive value and is less than or equal to TicketsAvailable 
--value for that flight 
--If all the validations are successful, insert the data by generating the BookingId and 
--calculate the total amount based on the TicketCost 
--Return Values: 
-- 1,in case of successful insertion 
---1,if CustId is invalid 
---2,if FlightId is invalid 
---3,if NoOfTickets is less than zero 
---4,if NoOfTickets is greater than TicketsAvailable 
---99,in case of any exception 

USE VIEWS

CREATE TABLE tblCustomer 
(
    CustId INT PRIMARY KEY,
    CustName VARCHAR(255) NOT NULL
)

CREATE TABLE tblFlights 
(
    FlightId INT PRIMARY KEY,
    FlightName VARCHAR(200) NOT NULL,
    FlightType VARCHAR(50) CHECK (FlightType IN ('International', 'Domestic')) NOT NULL,
    Source VARCHAR(200) NOT NULL,
    Destination VARCHAR(200) NOT NULL,
    FlightCharge DECIMAL(10, 2) NOT NULL,
    TicketsAvailable INT NOT NULL,
	Travelclass VARCHAR(200) NOT NULL
)

CREATE TABLE tblBookings 
(
    BookingId INT PRIMARY KEY,
    FlightId INT FOREIGN KEY (FlightId) REFERENCES tblFlights(FlightId),
    CustId INT FOREIGN KEY (CustId) REFERENCES tblCustomer(CustId),
    NoOfSeats INT NOT NULL,
    BookingDate DATE NOT NULL,
	Totalamt MONEY
)

INSERT INTO tblCustomer (CustId, CustName) VALUES
(101, 'John'),
(102, 'sam'),
(103, 'robert'),
(104, 'albert'),
(105, 'jack')

INSERT INTO tblFlights (FlightId, FlightName, FlightType, Source, Destination, FlightCharge, TicketsAvailable,Travelclass) VALUES
(201, 'spice jet airline', 'Domestic', 'mumbai', 'kolkata', 1500.00, 100,'business'),
(202, 'india airline', 'international', 'delhi', 'germany', 2000.00, 150,'business'),
(203, 'deccan airline', 'Domestic', 'chennai', 'bengalore', 1000.00, 120,'economy'),
(204, 'british airline', 'international', 'london', 'italy', 5000.00, 100,'economy'),
(205, 'swiss airline', 'international', 'zurich', 'spain', 4000.00, 140,'business')

INSERT INTO tblBookings (BookingId, FlightId, CustId, NoOfSeats, BookingDate,Totalamt) VALUES
(1001, 201, 101,2,'22-march-18',3000),
(1002, 204, 103,1,'17-may-18',5000),
(1003, 202, 105,3,'23-oct-18',6000),
(1004, 205, 104,5,'01-sep-18',15000),
(1005, 203, 102,1,'17-jan-18',1000),
(1006, 202, 102,2,'19-feb-18',4000),
(1007, 203, 104,4,'21-jun-18',4000),
(1008, 201, 105,3,'12-jan-18',4500) 

SELECT * FROM tblCustomer
SELECT * FROM tblFlights
SELECT * FROM tblBookings

 CREATE OR ALTER PROCEDURE usp_BookTheTicket
 @CustId INT, @FlightId INT, @NoOfTickets INT, @Result INT OUTPUT
	AS
	BEGIN

    DECLARE @BookingId INT, @TicketCost DECIMAL(10, 2), @TotalAmt DECIMAL(10, 2);

    IF NOT EXISTS (SELECT 1 FROM tblCustomer WHERE CustId = @CustId)
	BEGIN
		PRINT 'Customer does not Exists'
        RETURN -1;
	END

    IF NOT EXISTS (SELECT 1 FROM tblFlights WHERE FlightId = @FlightId)
	BEGIN
		PRINT 'FlightId is Invalid'
        RETURN -2;
	END

    IF @NoOfTickets <= 0
	BEGIN
		PRINT 'Invalid No Of Tickets'
        RETURN -3;
	END

    IF @NoOfTickets > (SELECT TicketsAvailable FROM tblFlights WHERE FlightId = @FlightId)
	BEGIN
		PRINT 'Tickets Unavailable' 
        RETURN -4;
	END

		BEGIN TRY
		  BEGIN TRANSACTION

			SELECT @BookingId = ISNULL(MAX(BookingId),0) + 1 FROM tblBookings;
		   
			SELECT @TicketCost = FlightCharge FROM tblFlights WHERE FlightId = @FlightId;
			SET @TotalAmt = @TicketCost * @NoOfTickets;

				INSERT INTO tblBookings (BookingId, FlightId, CustId, NoOfSeats, BookingDate, TotalAmt)
				VALUES (@BookingId, @FlightId, @CustId, @NoOfTickets, GETDATE(), @TotalAmt);
				
				UPDATE tblFlights SET TicketsAvailable=TicketsAvailable-@NoOfTickets
				WHERE FlightId=@FlightId

			SET @Result=(SELECT TicketsAvailable from tblFlights WHERE FlightId=@FlightId)

			COMMIT
			RETURN 1;
		END TRY
		BEGIN CATCH
			ROLLBACK
			PRINT 'OTHER EXCEPTION'
			RETURN -99;
		END CATCH
	END

DECLARE @Result INT 
EXECUTE usp_BookTheTicket 105,204,83, @Result OUTPUT
SELECT @Result AS 'Tickets Available'

--Function: ufn_BookedDetails 
--Create a function ufn_BookedDetails to get the booking details based on the BookingId 
--Input Parameter: 
--BookingId 
--Functionality: 
--Fetch the details of the ticket purchased based on the BookingId 
--Return Value: 
--A table containing following fields: 
--BookingId 
--CustName 
--FlightName 
--Source 
--Destination 
--BookingDate 
--NoOfTickets 
--TotalAmt

CREATE OR ALTER FUNCTION ufn_BookedDetails
(@BookingId INT)
RETURNS TABLE
AS
RETURN 
(
	SELECT B.BookingId,C.CustName,F.FlightName,F.Source,F.Destination,B.BookingDate,B.NoOfSeats AS NoOfTickets, B.Totalamt
	FROM tblBookings B 
	INNER JOIN tblCustomer C ON B.CustId=C.CustId
	INNER JOIN tblFlights F ON B.FlightId=F.FlightId
	WHERE BookingId= @BookingId
)

SELECT * FROM tblBookings
SELECT * FROM ufn_BookedDetails(1015)

-----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------ASSESSMENT 2--------------------------------------------------------------------

CREATE TABLE tblUsers
(
	UserID INT PRIMARY KEY,
	UserName VARCHAR(50) NOT NULL,
	EmailID Varchar(100) NOT NULL
)

INSERT INTO tblUsers(UserID, UserName, EmailID) VALUES
(1001,'Akash','akash@gmail.com'), 
(1002,'Arvind','arvind123@gmail.com'),
(1003,'Sakshi','sakshimys12@gmail.com'),
(1004,'Kumar','kumar987@gmail.com')

CREATE TABLE tblCategory
(
	CategoryID INT PRIMARY KEY,
	CategoryName VARCHAR(50) NOT NULL,
	Description VARCHAR(255) NOT NULL
)

INSERT INTO tblCategory(CategoryID, CategoryName, Description) VALUES
(201,'Electronics','One stop for electronic items'),
(202,'Apparel','Apparel is the next destination for fashion') ,
(203,'Grocery','All needs in one place')

CREATE TABLE tblProducts
(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(50) NOT NULL,
	Quantity INT NOT NULL,
	ProductPrice INT NOT NULL,
	CategoryID INT REFERENCES tblCategory(CategoryID)
)

INSERT INTO tblProducts(ProductID, ProductName, Quantity, ProductPrice, CategoryID) VALUES
(1,'Mobile Phone',1000,15000,201), 
(2,'Television',500,40000,201) ,
(3,'Denims',2000,700,202),
(4,'Vegetables',4000,40,203) ,
(5,'Ethnic Wear',300,1500,202) ,
(6,'Wireless Earphone',5000,2500,201),
(7,'Lounge Wear',200,1600,202),
(8,'Refrigerator',50,30000,201),
(9,'Pulses',60,150,202),
(10,'Fruits',100,250,203)
 
CREATE TABLE tblSales
(
	SalesID INT PRIMARY KEY,
	SalesUserID INT REFERENCES tblUsers(UserID),
	ProductID INT REFERENCES tblProducts(ProductID)
)
 
INSERT INTO tblSales(SalesID, SalesUserID, ProductID) VALUES
(500,1001,1), 
(501,1002,1), 
(502,1003,2), 
(504,1004,3), 
(505,1004,1), 
(506,1004,1), 
(507,1002,2), 
(508,1003,1), 
(509,1001,7), 
(510,1001,8)  
 
 SELECT * FROM tblUsers
 SELECT * FROM tblCategory
 SELECT * FROM tblProducts
 SELECT * FROM tblSales

 EXEC uspUpdateCategory 1004


--1.Write a function to fetch the names of the product,category and users along with the cost for each product sold depending on the sales_id. 
-- Also if the cost for each product is more than 2000, then display a message stating that 'The product has gained profit'.  
-- If the product cost is between 500 and 1000, then raise a message stating that 'The product has occured loss'.  
-- If the product cost is less than 500, then raise an exception stating 'No profit no loss'. 

CREATE OR ALTER FUNCTION fn_Sale (@SaleID INT)
RETURNS @Result TABLE (ProductName VARCHAR(100), CategoryName VARCHAR(100), UserName VARCHAR(100), ProductID INT, ProductPrice INT, ProfitOrLoss VARCHAR(100))
AS
BEGIN
	INSERT INTO @Result
	SELECT P.ProductName, CategoryName , UserName , S.ProductID , ProductPrice ,
	CASE
		WHEN ProductPrice>2000 THEN 'The Product has Gained Profit'
		WHEN ProductPrice BETWEEN 1001 AND 2000 THEN 'Average Profit'
		WHEN ProductPrice BETWEEN 500 AND 1000 THEN 'The Product has occured Loss'
		WHEN ProductPrice<500  THEN 'No Profit No Loss'
	END AS 'Profit Or Loss'
	FROM tblCategory C
	INNER JOIN tblProducts P ON C.CategoryID= P.CategoryID
	INNER JOIN tblSales S ON S.ProductID= P.ProductID
	INNER JOIN tblUsers U ON U.UserID= S.Salesuserid
	WHERE S.SalesID= @SaleID
	RETURN
END

 SELECT * FROM fn_Sale (511)

  SELECT * FROM tblUsers
 SELECT * FROM tblCategory
 SELECT * FROM tblProducts
 SELECT * FROM tblSales

 --2.Write a procedure to update the name of the category from 'Electronics' to 'Modern Gadgets' and also  
--fetch the category and product names when the userid is passed as the input parameter.
 CREATE OR ALTER PROCEDURE uspUpdateAndFetch
 @UserID INT
 AS
 BEGIN
		UPDATE tblCategory
		SET CategoryName= 'Modern Gadgets'
		WHERE CategoryName= 'Electronics'

		SELECT C.CategoryName, P.ProductName
		FROM tblSales S
		INNER JOIN tblProducts P ON S.ProductID = P.ProductID
		INNER JOIN tblCategory C ON P.CategoryID = C.CategoryID
		WHERE S.SalesUserID = @UserID;
 END

EXEC uspUpdateAndFetch 1004

OR 

--USING EXCEPTION HANDLING

 CREATE OR ALTER PROCEDURE uspUpdateAndFetchUsingExceptionHandling
 @UserID INT
 AS
 BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE tblCategory
			SET CategoryName= 'Modern Gadgets'
			WHERE CategoryName= 'Electronics'

			SELECT C.CategoryName, P.ProductName, P.CategoryID, SUM(ProductPrice) AS 'TotalPrice'
			FROM tblSales S
			INNER JOIN tblProducts P ON S.ProductID = P.ProductID
			INNER JOIN tblCategory C ON P.CategoryID = C.CategoryID
			WHERE S.SalesUserID = @UserID
			GROUP BY C.CategoryName, P.ProductName, P.CategoryID

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
	ROLLBACK TRANSACTION 
		PRINT 'Other Transaction'
		RETURN 99
	END CATCH;
	END

EXEC uspUpdateAndFetchUsingExceptionHandling 1004

