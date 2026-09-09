SELECT TOP (1000) [Dep_ID]
      ,[Dep_Name]
      ,[Student_ID]
  FROM [Sample1].[dbo].[Department]
  Select Student.Student_Name, Department.Dep_Name
  from Department
  right outer join Student
  on Department.Student_ID = Student.Student_ID
