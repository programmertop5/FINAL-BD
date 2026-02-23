CREATE TABLE Teachers(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [EmploymentDate] DATE NOT NULL
        CHECK(EmploymentDate >= '1990-01-01'),
    [IsAssistant] BIT NOT NULL DEFAULT 0,
    [IsProfessor] BIT NOT NULL DEFAULT 0,
    [Name] NVARCHAR(MAX) NOT NULL
        CHECK(Name <> ''),
    [Position] NVARCHAR(MAX) NOT NULL
        CHECK(Position <> ''),
    [Premium] MONEY NOT NULL DEFAULT 0
        CHECK(Premium >= 0),
    [Salary] MONEY NOT NULL
        CHECK(Salary > 0),
    [Surname] NVARCHAR(MAX) NOT NULL
        CHECK(Surname <> '')
)
