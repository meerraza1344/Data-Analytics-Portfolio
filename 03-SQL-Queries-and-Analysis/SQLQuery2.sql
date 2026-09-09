SELECT TOP (1000) [Emp_ID]
      ,[Dep_Name]
      ,[Dep_ID]
      ,[Dep_Address]
  FROM [Sample].[dbo].[Department]
  Create view Karachi_employees as
  Select Employee.Emp_Name, Department.Dep_Name, Department.Dep_Address
  From Employee, Department
  where Employee.Emp_ID= Department.Emp_ID
  And Department.Dep_Address= 'Karachi';

  Select * from Karachi_employees

update Karachi_employees
set Emp_Name= 'Oshin';
select * from Karachi_employees
Update Karachi_employees
Set Emp_Name= 'Laila' WHERE Dep_Name= 'IT';
Select * from Karachi_employees
Drop view Karachi_employees;
