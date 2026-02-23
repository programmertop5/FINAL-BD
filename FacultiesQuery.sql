CREATE TABLE Faculties(
	[Id]  INT  NOT NULL PRIMARY KEY IDENTITY,
	[Name]  NVARCHAR(100)  NOT NULL UNIQUE
)

INSERT INTO Faculties ([Name]) VALUES
(N'Факультет комп''ютерних наук'),
(N'Факультет менеджменту'),
(N'Факультет медицини'),
(N'Факультет іноземних мов'),
(N'Факультет архітектури'),
(N'Факультет математики та фізики'),
(N'Факультет біології');
