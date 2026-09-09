SELECT TOP (1000) [Emp_ID]
      ,[Emp_Name]
      ,[Salary]
      ,[Age]
  FROM [Sample].[dbo].[Employee]
  Select Employee.Emp_Name, Department.Dep_Name, Department.Dep_Address, Employee.Salary
  from Employee
  RIGHT outer join Department
  on Employee.Emp_ID = Department.Emp_ID 
  DRop table Stu