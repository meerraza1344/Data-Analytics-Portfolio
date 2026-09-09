SELECT TOP (1000) [Emp_ID]
      ,[Emp_Name]
      ,[Salary]
      ,[Age]
  FROM [Sample].[dbo].[Employee]
  Select a.Emp_Name as Emp_Name1, b.Emp_Name as Emp_Name2, A.Salary
  From Employee A, Employee B
  Where A.Emp_ID <> B.Emp_ID
  And A.Salary= B.Salary
  Order by A.Salary+
