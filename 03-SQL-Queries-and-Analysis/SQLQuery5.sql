SELECT TOP (1000) [Emp_ID]
      ,[Emp_Name]
      ,[Salary]
      ,[Age]
  FROM [Sample].[dbo].[Employee]
  Select Employee.Emp_Name, Department.Dep_Address
  From Employee
  Cross join Department
  Where Employee.Emp_ID = Department.Emp_ID
