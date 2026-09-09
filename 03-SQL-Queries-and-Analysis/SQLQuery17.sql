SELECT TOP (1000) [Dep_ID]
      ,[Dep_Name]
      ,[Student_ID]
  FROM [Sample1].[dbo].[Department]
  sELECT Student.Student_Name, Department.Dep_Name
  from Student
  Full outer join Department
  on Student.Student_ID = Department.Student_ID
