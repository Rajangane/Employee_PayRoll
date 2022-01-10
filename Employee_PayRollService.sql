--UC1
create database PayRollService

--use database
use PayRollService

--UC2 create a table for Employee_PayRoll
create table Employee_PayRoll
(
id int primary key,
name varchar(100),
salary int,
start_date Date
);

-- Displaying Records 
select * from Employee_PayRoll

--UC3 inserting data
insert into Employee_PayRoll values(1,'Pratiksha',40000,'2021-08-28')
insert into Employee_payroll values(2,'Prerana',50000,'2021-08-20')
insert into Employee_PayRoll values(3,'Sakshi',25000,'2021-06-11')
insert into Employee_PayRoll values(4,'Pritha',42000,'2021-12-31')
insert into Employee_PayRoll values(5,'Ruhi',60000,'2022-02-14')

--UC4 
select * from Employee_PayRoll;

--UC5
--Retriving salary data for particular empolyee(where condition)
select * from Employee_payroll where salary = 40000 
--searching name and salary for people how join from 2018-01-01
select name,salary from Employee_PayRoll where start_date between CAST('2021-08-28' AS date) and GETDATE();

--UC6 add gender
Alter table Employee_PayRoll add gender char;

update Employee_payroll set gender='F' where name='Pratiksha' or name='Prerana';
update Employee_payroll set gender='F' where name='Sakshi' or name='Pritha';
update Employee_payroll set gender='F' where name='Ruhi';

--UC7 Finding sum,avg,min,max,count of employees
--Average
select AVG(salary) from Employee_PayRoll;
--Sum 
select SUM(salary) from Employee_PayRoll;
--Minimum
select MIN(salary) from Employee_PayRoll;
--Maximum
select MAX(salary) from Employee_PayRoll;
--Count
select COUNT(salary) from Employee_PayRoll;
-- Group by 
--Total female salary
select SUM(salary) from Employee_PayRoll
where gender = 'F' group by gender

--UC8
--Adding Address,Phone_no,Dept
Alter table Employee_PayRoll add address varchar(255) default 'Banglore'; 
Alter table Employee_PayRoll add phone_no varchar(255);
Alter table Employee_PayRoll add dept varchar(255) not null default 'IT';
select * from Employee_PayRoll;

--UC9
--Adding basicPay, Deductions, Taxable Pay, Income Tax, Net Pay
Alter table Employee_PayRoll add basicPay float, Deduction float, TaxablePay float, IncomeTax float, NetPay float;

--UC10 Add Two Employee Having same name but different Dept.
insert into Employee_payroll values
(90,'Darla',2000000, '2018-04-06' , 'F','Maldives',6360384041,'Marketting',  4000000.00, 1000000.00, 3000000.00, 700000.00, 2000000.00)
, (91,'Darla',2000000, '2019-04-06' , 'F','Maldives',6363123456,'Sales',  4000000.00, 1000000.00, 3000000.00, 700000.00, 2000000.00);
select * from Employee_payroll where name='Darla';

--UC 11 Create Tables Using ER Diagram
use PayRollService
create table Company(
CmpID int identity(1,1) PRIMARY KEY,
CmpName varchar(100) not null);
select * from Company

use PayRollService
create table Department(
DepartmentID int identity(1,1) PRIMARY KEY,
DepartmentName varchar(100) not null);

use PayRollService
create table employee(
ID int identity(1,1) PRIMARY KEY,
EmployeeName varchar(100) NOT NULL,
EmployeePhoneNumber int not null,
EmployeeAddress varchar(255),
EmployeeGender char(1),
CompanyID int,
Foreign key(CompanyID) REFERENCES employee(id)
);

use PayRollService
create table Payment(
PaymentID int identity(1,1) PRIMARY KEY,
EmployeeID int,
basicPay float, 
Deduction float, 
TaxablePay float, 
IncomeTax float, 
NetPay float
Foreign key(EmployeeID) REFERENCES employee(id)
);

use PayRollService
create table EmployeeDepartment(
EmployeeID int,
DepartmentID int,
Foreign key(EmployeeId) REFERENCES employee(id),
Foreign key(DepartmentID) REFERENCES Department(DepartmentID)
)


