CREATE TABLE Teachers(
	[Id]  INT NOT NULL PRIMARY KEY IDENTITY,
	[EmploymentDate]  DATE  NOT NULL
	CHECK (EmploymentDate >= '1990-01-01'),
	[Name]  NVARCHAR(MAX)  NOT NULL,
	[Premium]  MONEY  NOT NULL DEFAULT 0
	CHECK (Premium >= 0),
	[Salary]  MONEY  NOT NULL
	CHECK(Salary <= 0),
	[Surname]  NVARCHAR(MAX)  NOT NULL
)

