SELECT TOP (1000) [Emp_ID]
      ,[Dep_Name]
      ,[Dep_ID]
      ,[Dep_Address]
  FROM [Sample].[dbo].[Department]
  Select Employee.Emp_ID, Department.Dep_Name, Department.Dep_Address, Employee.Salary
  from Employee
  left outer join Department
  on Employee.Emp_ID = Department.Emp_ID 

