--1--
SELECT Buildings
FROM Departments
GROUP BY Buildings
HAVING SUM(Financing) > 100000;
--2--
SELECT G.Name 
FROM Groups G
JOIN Departments D ON G.DepartmentId = D.Id
JOIN GroupsLectures gl ON G.Id = gl.GroupId
JOIN Lectures l ON gl.LectureId = l.Id
WHERE G.Year = 5
	AND D.Name = 'Software Development' 
	AND DATEPART(WEEK,l.Date) = 1
GROUP BY
	G.Name
HAVING 
	COUNT(gl.LectureId) > 10;
--3--
SELECT G.Name 
FROM Groups G
JOIN GroupsStudents gp ON G.Id = gp.GroupsId
JOIN Students s ON gp.StudentId = s.Id
GROUP BY G.Name
HAVING AVG(s.Rating) > (
	SELECT AVG(s2.Rating)
	FROM Groups g2
	JOIN GroupsStudents gp2 ON g2.Id = gp2.GroupsId
	JOIN Students s2 ON gp2.StudentId = s2.Id
	WHERE 
		g2.Name = 'D221'
);
--4--
SELECT Name,Surname,Salary
FROM Teachers
WHERE Salary >(
	SELECT AVG(Salary)
	FROM Teachers
	WHERE IsProfessor = 1
);
--5--
SELECT G.Name
FROM Groups G
JOIN GroupsCurators gc ON G.Id = gc.Id
GROUP BY
	G.Name
HAVING COUNT (gc.CuratorId) > 1;
--7--
SELECT F.Name
FROM Faculties F
JOIN Departments d ON F.Id = df.Id
GROUP BY 
	F.Name
HAVING SUM(D.Financing) > (
    SELECT SUM(d2.Financing)
    FROM Faculties F2
    JOIN Departments d2 ON f2.Id = d2f.Id
    WHERE F2.Name = 'Computer Science'
);
--9--
SELECT TOP 1 S.Name
FROM Lectures l 
JOIN Subjects S ON l.SubjectId = S.Id
GROUP BY
	S.Name
ORDER BY 
	COUNT(l.Id) ASC;
