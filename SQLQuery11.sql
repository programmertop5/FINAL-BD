--1--
SELECT COUNT(*) AS 'Teachers Count'
FROM Teachers
WHERE DepartmentId = (SELECT Id FROM Departments WHERE Name = 'Software Development');

--2--
SELECT COUNT(*) AS 'Lectures Count'
FROM Lectures
WHERE TeacherId = (SELECT Id FROM Teachers WHERE Surname = 'McQueen' AND Name = 'Dave');

--3--
SELECT COUNT(*) AS 'Lecture Count'
FROM Lectures
WHERE LectureRoom = 'D201';

--5--
SELECT COUNT(DISTINCT gs.StudentId) AS 'Students Count'
FROM Lectures l
JOIN GroupsLectures gl ON l.Id = gl.LectureId
JOIN GroupsStudents gs ON gl.GroupId = gs.GroupId
WHERE l.TeacherId = (SELECT Id FROM Teachers WHERE Surname = 'Underhill' AND Name = 'Jack');

--6--
SELECT AVG(t.Salary) AS 'Avg Salary'
FROM Teachers t
JOIN Departments d ON t.DepartmentId = d.Id
JOIN Faculties f ON d.FacultyId = f.Id
WHERE f.Name = 'Computer Science';

--7--
SELECT 
    MIN(StudentCount) AS 'Minimal Students',
    MAX(StudentCount) AS 'Max Students'
FROM (
    SELECT GroupId, COUNT(*) AS StudentCount
    FROM GroupsStudents
    GROUP BY GroupId
) AS SubQuery;

--8--
SELECT AVG(Financing) AS 'Avg Financing'
FROM Departments;

--9--
SELECT 
    t.Name + ' ' + t.Surname AS 'Full Name',
    COUNT(DISTINCT l.SubjectId) AS 'Subject Count'
FROM Teachers t
LEFT JOIN Lectures l ON t.Id = l.TeacherId
GROUP BY t.Name, t.Surname;

--10--
SELECT 
    DayOfWeek,
    COUNT(*) AS 'Lectures Count'
FROM Lectures
GROUP BY DayOfWeek
ORDER BY DayOfWeek;

--13--
SELECT 
    t.Name + ' ' + t.Surname AS 'Teacher',
    l.LectureRoom AS 'Lecture Room',
    COUNT(*) AS 'Lectures Count'
FROM Lectures l
JOIN Teachers t ON l.TeacherId = t.Id
GROUP BY t.Name, t.Surname, l.LectureRoom
ORDER BY COUNT(*) DESC;
